CREATE TABLE MUSER (

U_NO NUMBER(6,0) PRIMARY KEY,
U_ID VARCHAR2(30),
U_PW VARCHAR2(50),
U_NAME VARCHAR2(20),
U_NICKNAME VARCHAR2(20),
U_EMAIL VARCHAR2(50),
U_PROFILEIMG VARCHAR2(50),
U_BDAY VARCHAR2(40)




);


create table movie (

m_no number (10,0) primary key,
m_id number(10,0),
m_title varchar2(100),
m_img   varchar2(200) default 'https://image.tmdb.org/t/p/original',
m_release_date varchar2(50),
m_vote_average number(6,0),
m_vote_count   number(6,0)


);

create table moviereview (

r_no  number(6,0) primary key,
r_review varchar2(50),
u_no number(6,0),
m_no number(6,0),
foreign key (u_no) references muser(u_no) ON DELETE CASCADE,
foreign key (m_no) references movie(m_no) ON DELETE CASCADE


);


create table movielike (
m_no number(6,0),
u_no number(6,0),
foreign key (u_no) references muser(u_no) ON DELETE CASCADE,
foreign key (m_no) references movie(m_no) ON DELETE CASCADE
);


create table cservice (
cs_idx number(6,0) primary key,
u_no number(6,0),
cs_title varchar2(50),
cs_cont varchar2(300),
cs_img  varchar2(255),
cs_writerdate DATE,
cs_category varchar2(30),
FOREIGN KEY (u_no) REFERENCES muser(u_no) ON DELETE CASCADE

);

CREATE TABLE csanswer(
cs_idx NUMBER(6,0),
cs_answer VARCHAR2(300),
cs_img varchar2(255),
cs_answerdate DATE,
  FOREIGN KEY (cs_idx) REFERENCES cservice(cs_idx) ON DELETE CASCADE
  );

