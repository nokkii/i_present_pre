package idraw.manager;

import java.lang.reflect.InvocationTargetException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.sql.SQLException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.xml.bind.DatatypeConverter;

import idraw.model.User;

public class EncryptManager {
	/**
	 * 公開鍵と秘密鍵の生成.
	 * @param user User型(Userテーブル)
	 * @return 公開鍵(16進数文字列)
	 * @throws SQLException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 */
	public static String generateKeyPair(User user) throws NoSuchAlgorithmException, NoSuchFieldException,
	SecurityException, IllegalArgumentException, IllegalAccessException, NoSuchMethodException,
	InvocationTargetException, SQLException {

		// RSA暗号化キーを生成する
		KeyPairGenerator keygen = KeyPairGenerator.getInstance("RSA");
		keygen.initialize(1024); // 1024bit - 88bit = 117byte (最大平文サイズ)
		KeyPair keyPair = keygen.generateKeyPair();

		// 秘密キー
		RSAPrivateKey privateKey = (RSAPrivateKey)keyPair.getPrivate();
		// 公開キー
		RSAPublicKey publicKey = (RSAPublicKey)keyPair.getPublic();

		// 秘密キーと公開キーを16進数文字列に変換
		byte[] binPrivate = privateKey.getEncoded();
		String encodedPrivate = toHexString(binPrivate);
		String PublicModulus = publicKey.getModulus().toString();
		String PublicExponent = publicKey.getPublicExponent().toString();
		String encodedPublic = PublicModulus + ":" + PublicExponent;

		// Userテーブルへ秘密鍵を書き出す
		user.secret_key = encodedPrivate;
		user.save();

		// 公開鍵を戻す
		return encodedPublic;
	}

	/**
	 * 秘密鍵を使用してパスワードの復号化.
	 * @param user User型(Userテーブル)
	 * @return 復号化したパスワード
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 * @throws NoSuchPaddingException
	 * @throws InvalidKeyException
	 * @throws BadPaddingException
	 * @throws IllegalBlockSizeException
	 */
	public static String getDecryptPwd(User user, String pwd) throws NoSuchAlgorithmException, InvalidKeySpecException,
	NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {

		// 秘密鍵をバイト列に変換し(16進数文字列→バイト列)、key型に復元
		PKCS8EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(DatatypeConverter.parseHexBinary(user.secret_key));

		// KeySpecから、秘密RSAキーを復元する
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		RSAPrivateKey privateKey = (RSAPrivateKey)keyFactory.generatePrivate(privateKeySpec);

		// 秘密鍵でパスワードを復号化する(16進数文字列→バイト列)
		Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decrypted = cipher.doFinal(DatatypeConverter.parseHexBinary(pwd));

		// パスワードを文字列に変換して戻す(バイト列→文字列)
		return new String(decrypted);
	}

	/**
	 * 平文のパスワードとソルトからパスワードを生成し返却
	 * @param pass パスワード
	 * @param salt ソルト
	 * @return ハッシュ化されたパスワード
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 */
	public static String getHashPwd(String pass, byte[] salt) throws NoSuchAlgorithmException, InvalidKeySpecException {
		String passPepper = pass + "qwertyuiop"; // ペッパーとして固定値をプラスする
		char[] passCharAry = passPepper.toCharArray();

		PBEKeySpec keySpec = new PBEKeySpec(passCharAry, salt, 10000, 256);

		SecretKeyFactory skf;
		skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");

		SecretKey secretKey = skf.generateSecret(keySpec);
		byte[] passByteAry = secretKey.getEncoded();

		// 生成されたバイト配列を16進数の文字列に変換して返却
		return toHexString(passByteAry);
	}

	/**
	 * ソルトを自動生成し返却
	 * @return 生成したソルト
	 * @throws NoSuchAlgorithmException
	 */
	public static byte[] createSalt() throws NoSuchAlgorithmException {
		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		byte[] salt = new byte[32];
		random.nextBytes(salt);
		return salt;
	}

	/**
	 * バイト列を16進数文字列に変換する.
	 * @param data バイト列
	 * @return 16進数文字列
	 */
	public static String toHexString(byte[] data) {
        StringBuilder buf = new StringBuilder();
        for (byte d : data) {
            buf.append(String.format("%02X", d));
        }
        return buf.toString();
    }
}