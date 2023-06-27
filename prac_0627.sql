SHOW DATABASES;
SHOW TABLES;

SELECT * FROM mem;

-- 조건에 맞는 레코드 검색 (where)
SELECT id FROM mem WHERE name = '황영주';
SELECT id, name, address, tel, sex FROM mem WHERE sex = 'W';
SELECT * FROM mem WHERE age > 50;

-- 조건의 범위표현 between, > and <
SELECT name, id, age, address, post_num FROM mem WHERE age BETWEEN 20 AND 30;
SELECT name, id, age, address, post_num FROM mem WHERE age > 20 AND age < 30;
SELECT name, address, age FROM mem WHERE age >= 40 and age <= 50 and sex='M';

-- 포함여부 확인 (in, not in)
SELECT name, address, age FROM mem WHERE name not in ('신수진');
select * from book where publisher in ('굿스포츠', '대한미디어');
select * from book where publisher not in ('굿스포츠', '대한미디어');

-- 특정 값을 포함한 결과 검색 (like)
-- % = 해당 위치에 0개 이상의 문자
-- _ = 해당 위치에 1개의 문자
select * from mem where name like '김%';
select name address from mem where address like '서울%';
select name, address, sex from mem where address like '부산%' and sex = 'W';
select name, id from mem where name like '_용_';
select name, address, tel from mem where address like '광주%' and name like '김%';
select bookname, publisher from book where bookname like '%축구%';
select * from book where bookname like '_구%';
select * from book where bookname like '%축구%' and price >= 20000;

-- 기준이 되는 필드에 대해 오름차순 정렬 (order by)
select age, id, name, tel from mem order by age;
select age, id, name, tel from mem order by age, id;

-- 내림차순 정렬(order by (필드명) desc)
select name, age, address from mem where address like '서울%' order by age desc;

-- 집계함수 sum(), count(), avg(), min(), max()
select sum(age) as aum_age from mem;
select count(*) as count from mem where age >= 20;
select avg(age) as avg_age from mem where age >= 20;
select sum(saleprice) as total_price from orders;
select sum(saleprice) as Total , avg(saleprice) as Average, min(saleprice) as Minimum, max(saleprice) as Maximum
from orders;

-- 값 변경 (update 테이블명 set 필드명)
update mem set tel='123-4567' where id = 'yjhwang';
update mem set age=27 where name = '신수진';
update customer set address = '대한민국 부산' where custid = 5;

-- 값 삭제 (delete from 테이블명)
delete from customer where name = '김길수';
delete from mem where age >= 30 and age <= 50;
delete from book where bookid = 11;

-- 날짜 관련 함수 adddate(), addtime(), curdate(), curtime(), now() ~~~
select adddate('1998-01-02', interval 42 day);
select addtime('00:00:00', '02:33:44');
select curdate();
select curtime();
select now();

-- 테이블 생성시 foreign key 관련 명령(on delete, on update)
create table mem_order (
	order_id int not null auto_increment,
    mem_id int,
    order_date date,
    price int,
    primary key (order_id),
    foreign key (mem_id) references mem(num) on delete
    -- 부모데이터 삭제 시 자식 데이터도 삭제
    cascade
);

-- join 연산
select *
from mem_order join mem
-- 기준이 될 조건 설정(on)
on mem_order.mem_id = mem.num;