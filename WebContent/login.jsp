<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="./idraw.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script src="./jquery.cookie-1.4.1.min.js"></script>
	<script src="./cryptico.min.js"></script>
	<script src="./idraw.js"></script>
	<%
		Cookie[] coockies = request.getCookies();
		for(Cookie cookie: coockies){
			if(cookie.getName().equals("JSESSIONID")){
				System.out.println(coockies[0].getValue());
				cookie.setHttpOnly(false);
				response.addCookie(cookie);
			}
		}
	%>
</head>
<body>
<div id="panel_canvas_login">
<% // インフォメーション用文字  %>
<h1 id="title"><span id="title_secondary">We</span>Draw</h1>
<h1 id="infoTitle" style="position:absolute;margin-left: 340px;margin-top: 240px;font-size: 24px;display:none;">ログイン</h1>
<h1 id="subInfo" style="position:absolute;margin-left: 280px;margin-top: 300px;font-size: 20px;display:none;">ログインIDを入力</h1>
<div id="chat_window"></div>
<% // 絵を書くキャンバス  %>
<canvas width="800" height="600" id="canvas" style="position: absolute;"></canvas>
<% // ブラッシュの画像  %>
<img id="brush" src="images/brush.png" style="height:130px;width:0px;position:absolute">
<% // タイトルのオブジェクト  %>
<input id="loginButton" type="submit" value="ログイン" class="button">
<input id="signUpButton" type="submit" value="サインアップ" class="button">
<% // ID入力のオブジェクト  %>
<input id="idField" type="text" value="" class="button text_field" style="position:absolute;margin-left: 280px;margin-top: 330px;display:none;">
<input id="idSubmitButton" type="submit" value="送信" class="button" style="position:absolute;margin-left: 440px;margin-top: 330px;display:none;">
<input id="pwField" type="password" value="" class="button text_field" style="position:absolute;margin-left: 280px;margin-top: 330px;display:none;">
<input id="pwSubmitButton" type="submit" value="送信" class="button" style="position:absolute;margin-left: 440px;margin-top: 330px;display:none;">
</div>
<div id="panel_console" class="Paper">
<div id="panel_theme"><span id="theme_text">テーマ：</span>
<select id="select_theme">
	<option>Paper</option>
	<option>Modern</option>
	<option>Dark</option>
</select>
</div>
<table id="palette">
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 90%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 100%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 80%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 80%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 70%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 70%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 60%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 60%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 50%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 50%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 40%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 40%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 30%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 30%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 20%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 20%)"></td>
  </tr>
  <tr>
    <td class="palette_cell" style="background-color:hsl(0, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(30, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(60, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(90, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(120, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(150, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(180, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(210, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(240, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(270, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(300, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 100%, 10%)"></td>
    <td class="palette_cell" style="background-color:hsl(330, 0%, 0%)"></td>
  </tr>
</table>

    <div id="panel_button">
    	<input type="button" id="tool_pen" class="tool_button Paper" />
		<input type="button" id="tool_clear" class="tool_button Paper" />
		<input type="button" id="tool_eraser" class="tool_button Paper" />
	</div>
</div>
<div id="panel_mask">
</div>
</body>
<script>
$(function(){
	idraw.websocketInit();
	idraw.loadSessionId();
	idraw.eventDefine(false);
	var ani_speed = 500;
	
    commands.push(function (json){
    	switch (json.cmd){
    	case "pubkey":
			if ($("#idField").val() == json.id) {
	    		pubkey = json.key;
	    		
	    		$("#idField").animate({opacity: '0'},ani_speed);
	    		$("#idSubmitButton").animate({opacity: '0'},ani_speed);
	    		// subinfoをしまい終わってから全部出す
	    		$("#subInfo").animate({opacity: '0'},ani_speed, function() {
	    			$("#subInfo").text("パスワードを入力");

	    			$("#subInfo").animate({opacity: '1'},ani_speed);
	    			$("#pwField").show(ani_speed);
	    			$("#pwSubmitButton").show(ani_speed);
	    		});
			}
    		break;
    	case "login_done":
			if ($("#idField").val() == json.id) {
	    		location.href = "index.jsp";
			}
    		break;
    	}
    });
	$("#loginButton").click(function() {
		idNew = false;
		$("#brush").animate({top: '300px',opacity: '1'},0);
		$("#title").animate({top: '-100px', opacity: '0.2'},ani_speed);
		$("#loginButton").animate({opacity: '0'},ani_speed);
		$("#signUpButton").animate({opacity: '0'},ani_speed);
		$("#brush").animate({opacity: '0'},ani_speed);

		$("#infoTitle").show(ani_speed);
		$("#subInfo").show(ani_speed);
		$("#idField").show(ani_speed);
		$("#idSubmitButton").show(ani_speed);
		$("#brush").hide(0);
	});

	$("#signUpButton").click(function() {
		idNew = true;
		$("#title").animate({top: '-100px', opacity: '0.2'},ani_speed);
		$("#loginButton").animate({opacity: '0'},ani_speed);
		$("#signUpButton").animate({opacity: '0'},ani_speed);
		$("#brush").animate({opacity: '0'},ani_speed);

		$("#infoTitle").text("サインアップ");

		$("#infoTitle").show(ani_speed);
		$("#subInfo").show(ani_speed);
		$("#idField").show(ani_speed);
		$("#idSubmitButton").show(ani_speed);
	});

	$("#idSubmitButton").click(function() {
		// id送信
		socket.send(JSON.stringify({ cmd:"login", id:$("#idField").val(), "new":idNew}));
	});

	$("#pwSubmitButton").click(function() {
		// 鍵作成
		var getKey = pubkey; // javaで作成した公開鍵情報
		var pkey = getKey.split(":");
		var modules = new BigInteger(pkey[0]);
		var publicExponent = new BigInteger(pkey[1]);
		var rsa = new RSAKey();
		rsa.setPublic(modules.toString(16), publicExponent.toString(16));

		// 暗号化
		var pwEncrypt = rsa.encrypt($("#pwField").val());

		// id, pwd, sessionid送信
		socket.send(JSON.stringify({ cmd:"login", id:$("#idField").val(), pwd: pwEncrypt, session_id: sessionId}));
	});

	$("#loginButton").mouseover(function() {
		$("#brush").stop(true,true);
		$("#brush").animate({top: '300px', left: '220px'},0);
		$("#brush").animate({width: '200px'},ani_speed/4);

		});
	$("#loginButton").mouseout(function() {
		$("#brush").stop(true,true);
		$("#brush").animate({width: '0px'},ani_speed/4);
		});
	$("#signUpButton").mouseover(function() {
		$("#brush").stop(true,true);
		$("#brush").animate({top: '300px', left: '390px'},0);
		$("#brush").animate({width: '200px'},ani_speed/4);
		});
	$("#signUpButton").mouseout(function() {
		$("#brush").stop(true,true);
		$("#brush").animate({width: '0px'},ani_speed/4);
		});
});
</script>
</html>