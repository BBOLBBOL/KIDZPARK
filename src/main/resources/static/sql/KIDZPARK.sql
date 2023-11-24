BEGIN
  FOR cur_rec IN (SELECT table_name FROM user_tables) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
  END LOOP;
END;
/
-- 위에는 모든 테이블 삭제 명령어

CREATE TABLE puser (
  u_no NUMBER(6) PRIMARY KEY,
  u_id VARCHAR2(150) UNIQUE,
  u_pw VARCHAR2(30),
  u_name VARCHAR2(30),
  u_postcode NUMBER(10),
  u_address VARCHAR2(150),
  u_detailaddress VARCHAR2(150),
  u_extraaddress VARCHAR2(100),
  u_nickname VARCHAR2(50) UNIQUE,
  u_phone NUMBER(15),
  u_profileimg VARCHAR2(255),
  u_email VARCHAR2(150),
  u_logincount NUMBER,
  u_writecount NUMBER,
  u_grade NUMBER
);

CREATE TABLE menu (
  m_no NUMBER(6) PRIMARY KEY,
  m_name VARCHAR2(100),
  m_seq NUMBER(3)
);

CREATE TABLE board (
  b_idx NUMBER PRIMARY KEY,
  b_title VARCHAR2(255),
  b_cont VARCHAR2(4000),
  b_img VARCHAR2(255),
  b_readcount NUMBER,
  b_writedate DATE,
  b_update DATE,
  m_no NUMBER(6),
  u_no NUMBER(6),
  FOREIGN KEY (m_no) REFERENCES menu(m_no),
  FOREIGN KEY (u_no) REFERENCES puser(u_no)
);

CREATE TABLE commt (
  c_idx NUMBER(6) PRIMARY KEY,
  c_comment VARCHAR2(400),
  c_commentDate DATE,
  u_no NUMBER,
  FOREIGN KEY (u_no) REFERENCES puser(u_no)
);

CREATE TABLE chatroom (
  chr_no NUMBER(6) PRIMARY KEY,
  chr_title VARCHAR2(255),
  chr_opendate DATE
);

CREATE TABLE chat (
  chr_no NUMBER(6),
  chr_message VARCHAR2(255),
  chr_submitTime DATE,
  u_no NUMBER,
  FOREIGN KEY (chr_no) REFERENCES chatroom(chr_no),
  FOREIGN KEY (u_no) REFERENCES puser(u_no)
);

CREATE TABLE chatmember(
chr_no number,
u_no number,
FOREIGN KEY (chr_no) REFERENCES chatroom(chr_no),
FOREIGN KEY (u_no) REFERENCES puser(u_no)
);

CREATE TABLE kidzzone (
  kz_no NUMBER PRIMARY KEY,
  kz_name VARCHAR2(255),
  kz_postcode NUMBER(10),
  kz_address VARCHAR2(150),
  kz_detailaddress VARCHAR2(250),
  kz_extraaddress VARCHAR2(100),
  kz_explanation VARCHAR2(400),
  kz_openingtime VARCHAR2(150),
  kz_img VARCHAR2(255)
);

CREATE TABLE zonereview (
  r_review VARCHAR2(4000),
  r_reviewdate DATE,
  r_reviewimg VARCHAR2(255),
  kz_no NUMBER,
  u_no NUMBER,
  FOREIGN KEY (kz_no) REFERENCES kidzzone(kz_no),
  FOREIGN KEY (u_no) REFERENCES puser(u_no)
);

CREATE TABLE zonelike (
  kz_like NUMBER,
  kz_no NUMBER,
  u_no NUMBER,
  FOREIGN KEY (kz_no) REFERENCES kidzzone(kz_no),
  FOREIGN KEY (u_no) REFERENCES puser(u_no)
);

CREATE TABLE cservice (
cs_idx NUMBER PRIMARY KEY,
u_no NUMBER,
cs_title VARCHAR2(150),
cs_cont VARCHAR2(400),
cs_img VARCHAR2(255),
cs_writerdate DATE,
  FOREIGN KEY (u_no) REFERENCES puser(u_no)
);
  
CREATE TABLE csanswer(
cs_idx NUMBER,
cs_answer VARCHAR2(400),
cs_answerdate DATE,
  FOREIGN KEY (cs_idx) REFERENCES cservice(cs_idx)
  );

CREATE TABLE boardlike(
  b_idx number,
  u_no  number,
  FOREIGN KEY (b_idx) REFERENCES board(b_idx),
  FOREIGN KEY (u_no) REFERENCES puser(u_no)
)
