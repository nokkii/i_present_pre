drop database IF EXISTS test_idraw;
create database test_idraw;
drop database IF EXISTS production_idraw;
create database production_idraw;

use test_idraw;
CREATE TABLE user(
    username		varchar(20) PRIMARY KEY,
    pwd				TEXT, #NOT NULL,
    salt			TEXT, #NOT NULL,
    secret_key		TEXT, #NOT NULL,
    session_id		varchar(32) UNIQUE, #NOT NULL,
    INDEX idx_sid(session_id)
);
# ) engine=memory; # オンメモリで爆速

CREATE TABLE page(
    page_num		 INT PRIMARY KEY,
    joined_image	 MEDIUMTEXT, #NOT NULL,
    background_image MEDIUMTEXT,
    timer			 varchar(255),
    INDEX idx_pnum(page_num)
);
# ) engine=memory; # オンメモリで爆速

use production_idraw;
CREATE TABLE user(
    username	varchar(20) PRIMARY KEY,
    pwd			TEXT, #NOT NULL,
    salt		TEXT, #NOT NULL,
    secret_key	TEXT, #NOT NULL,
    session_id	varchar(32) UNIQUE, #NOT NULL,
    INDEX idx_sid(session_id)
);
# ) engine=memory; # オンメモリで爆速

CREATE TABLE page(
    page_num		 INT PRIMARY KEY,
    joined_image	 MEDIUMTEXT, #NOT NULL,
    background_image MEDIUMTEXT,
    timer            varchar(255),
    INDEX idx_pnum(page_num)
);
# ) engine=memory; # オンメモリで爆速