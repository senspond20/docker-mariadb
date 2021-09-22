-- BOARD 
CREATE TABLE BOARD (
    BID BIGINT AUTO_INCREMENT COMMENT '게시글번호',
    TITLE VARCHAR(50) NOT NULL COMMENT '제목',
    CONTENT TEXT  DEFAULT NULL COMMENT '내용',
    STATUS CHAR(1) DEFAULT 'Y' COMMENT '공개여부(Y/N)',                 
    CREATE_TIME timestamp NOT NULL DEFAULT current_timestamp() COMMENT '최초 작성날짜',
    UPDATE_TIME timestamp NULL COMMENT '수정날짜',
    PRIMARY KEY(BID),
    CONSTRAINT CHECK(STATUS IN ('Y','N'))
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO BOARD (TITLE,CONTENT) VALUES('제목입니다1','안녕하세요1');
INSERT INTO BOARD (TITLE,CONTENT) VALUES('제목입니다2','안녕하세요2❤');
INSERT INTO BOARD (TITLE,CONTENT) VALUES('제목입니다3','안녕하세요3😁');
INSERT INTO BOARD (TITLE,CONTENT) VALUES('제목입니다4','안녕하세요4');
INSERT INTO BOARD (TITLE,CONTENT) VALUES('제목입니다5','안녕하세요5😎');
INSERT INTO BOARD (TITLE,CONTENT) VALUES('새해복 많이 받으십시오.🤦‍♂️','올해는 좋은 일만 가득하시길');
INSERT INTO BOARD (TITLE,CONTENT) VALUES('당신은 어디서 오셨나요?','지구별😎 에서 오셨군요');
INSERT INTO BOARD (TITLE,CONTENT,STATUS) VALUES('비공개글입니다.👌','당신을 💋사랑💖합니다.','N');

UPDATE BOARD SET TITLE = '수정했습니다.', UPDATE_TIME = current_timestamp() WHERE BID = 1;

-- BOARD_REPLAY
-- DELETE CASCADE 게시물이 삭제될시 연관된 댓글도 삭제
CREATE OR REPLACE TABLE BOARD_REPlY(
    RID INT NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
    BOARD_ID BIGINT NOT NULL COMMENT '게시글번호',
    WRITER_ID VARCHAR(50) NOT NULL COMMENT '작성자ID',
    COMMENT VARCHAR(1000) NOT NULL COMMENT '댓글내용',
    INSERT_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT '댓글작성 시간',
    PRIMARY KEY(RID),
    FOREIGN KEY(BOARD_ID) REFERENCES BOARD(BID) ON DELETE CASCADE 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (1,'senspond','반가 😎워요');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (1,'admin','안녕하십니까');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (2,'senspond','반갑숩니다.');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (2,'admin','안녕하십니까');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (2,'senspond','반가하이요😎');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (3,'admin','안녕하십니까');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (3,'senspond','반가반가워요');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (4,'test','반가ㅋㅋ');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (4,'test','ㅋㅋ');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (4,'test','아잉');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (4,'test','오오');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (5,'admin','안녕하십니까');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (6,'senspond','반가반가워요');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (6,'admin','안녕하십니까👌');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (7,'admin','저는 지구에서 왔어요👌');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (7,'gfdein','저는 화성에서 왔어요👌');
INSERT INTO BOARD_REPlY (BOARD_ID, WRITER_ID, COMMENT) VALUES (8,'admin','새해 복 많이 받으세요');

-- DELETE CASECASE 테스트
DELETE FROM BOARD WHERE BID = 4;