-- <ABHISHEK MONDAL> [12001018036] -04-06-2020-  --
CREATE TABLE S (
  s_no     NUMBER(5),
  s_name   VARCHAR2(30),
  s_city   VARCHAR2(20),
  turnover NUMBER(10, 2),
  PRIMARY KEY (s_no)
);

CREATE TABLE p (
  p_no       NUMBER(5),
  weight     NUMBER(6, 3),
  color      VARCHAR2(12),
  cost       NUMBER(10, 2),
  sell_price NUMBER(10, 2),
  PRIMARY KEY (p_no)
);

CREATE TABLE sp (
  s_no     NUMBER(5) REFERENCES s (s_no),
  p_no     NUMBER(5) REFERENCES p (p_no),
  quantity NUMBER(4),
  project  VARCHAR2(20)
);

INSERT INTO s VALUES (100, 'AAAAA', 'Burdwan', 8000000);
INSERT INTO s VALUES (101, 'OOOOO', 'Asansol', 200000);
INSERT INTO s VALUES (102, 'MMMMM', 'Burdwan', 9000000);
INSERT INTO s VALUES (104, 'KKKKKKK', 'Kolkata', 350000);
INSERT INTO s VALUES (105, 'BBBBB', 'Asansol', 12000);
INSERT INTO s VALUES (106, 'BBBAAA', 'Asansol', 22000);
INSERT INTO s VALUES (107, 'DDDB', 'Burdwan', 32000);

INSERT INTO p VALUES (1, 20, 'Red', 10000, 12000);
INSERT INTO p VALUES (2, 12, 'Brown', 7000, 8000);
INSERT INTO p VALUES (3, 25, 'Orange', 12000, 15000);
INSERT INTO p VALUES (4, 5, 'Brown', 2000, 3000);
INSERT INTO p VALUES (5, 10, 'Red', 4000, 6000);

INSERT INTO sp VALUES (100, 1, 10, 'Housing');
INSERT INTO sp VALUES (101, 2, 15, 'Housing');
INSERT INTO sp VALUES (102, 1, 5, 'Housing');
INSERT INTO sp VALUES (104, 3, 22, 'Textiles');
INSERT INTO sp VALUES (105, 4, 11, 'Chemicals');
INSERT INTO sp VALUES (106, 5, 15, 'Computer Electronics');
INSERT INTO sp VALUES (107, 5, 30, 'Computer Electronics');

SELECT *
FROM s;
SELECT *
FROM p;
SELECT *
FROM sp;

-- a) write down s_name and turnover in alphabetical order of names.
SELECT
  s_name,
  turnover
FROM s
ORDER BY s_name ASC;

-- b) Get details of suppliers who operate from burdwan to asansol and supply materials for housing project
SELECT s.*
FROM s
  INNER JOIN sp ON s.s_no = sp.s_no
WHERE s.s_city IN ('Burdwan', 'Asansol') AND sp.project = 'Housing';

-- c) Find pair of suppliers who operate from same city.


-- d) Find the suppliers whose turnover is between Rs. 80 Lac to 95 Lac.
SELECT *
FROM s
WHERE turnover BETWEEN 8000000 AND 95000000;

-- e) Get suppliers who supply brown parts.
SELECT s.*
FROM s
  INNER JOIN sp ON s.s_no = sp.s_no
  INNER JOIN p ON sp.p_no = p.p_no
WHERE p.color = 'Brown';

-- f) List the part names costing below 500.
SELECT p_no
FROM p
WHERE cost < 500;

-- g) List the part names costing below 500 and color red.
SELECT p_no
FROM p
WHERE cost < 500 AND color = 'Red';

-- h) List the sname for parts supplied by more than one supplier.
SELECT s.s_name FROM s INNER JOIN sp ON s.s_no = sp.s_no GROUP BY (sp.s_no) HAVING COUNT(sp.p_no)>1 ;

SELECT p_no FROM sp GROUP BY p_no HAVING COUNT(p_no)>1;


