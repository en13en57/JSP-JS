DROP TABLE board;

CREATE TABLE board(
	idx NUMBER PRIMARY KEY,
	name varchar2(100) NOT NULL,
	password varchar2(100) NOT NULL,
	subject varchar2(1000) NOT NULL,
	content varchar2(2500) NOT NULL,
	regdate timestamp DEFAULT sysdate,
	ip varchar2(20) NOT NULL,
	hit NUMBER DEFAULT 0
);

CREATE SEQUENCE board_idx_seq;

SELECT * FROM board;

-- sample 테이터 3개 넣기
INSERT INTO board (idx, name, password, subject, content, ip) 
			VALUES (board_idx_seq.nextval, '나그네1', '1234', '1등~~~','와 1등이다~~', '192.168.0.1');
INSERT INTO board (idx, name, password, subject, content, ip) 
			VALUES (board_idx_seq.nextval, '나그네2', '1234', '2등~~~','와 2등이다~~', '192.168.0.1');
INSERT INTO board (idx, name, password, subject, content, ip) 
			VALUES (board_idx_seq.nextval, '나그네3', '1234', '3등~~~','와 3등이다~~', '192.168.0.1');

SELECT * FROM board;

-- saple 데이터 333개 넣기
BEGIN
	FOR i IN 4..333 loop
		INSERT INTO board (idx, name, password, subject, content, ip) 
			VALUES (board_idx_seq.nextval, '나그네1', '1234', '난 ' || i ||'~~','와 '|| i ||'등이다~~', '192.168.0.1');
	commit;
	END LOOP;
END;