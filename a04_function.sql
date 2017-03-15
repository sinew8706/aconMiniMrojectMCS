select * from emp;
/*
숫자함수 : 숫자를 처리하는 함수 절대값, 수학함수(sin, cos, tan..)
올림(ceil), 반올림(round), 내림(trunc, floor), 나머지(mod)를 처리함
1. abs() : 절대값 -부호에 상관없이 양수로 처리
*/
select 25, -25, abs(25), abs(-25) from dual;
/*
2. floor() : 소수점 아래를 버리는 함수
*/
select 25.74, floor(25.74) from dual;
/*
3. round() : 반올림 처리 함수
	round(데이터, 반올림할 자리수)
		반올림한 자리수 : 양수 - 소수점 이하의 자리수 처리
						음수 - 십단위(1), 백단위(2)식으로 해당 단위 만큼 반올림 처리
*/
select 25.28975, round(25.28975,2) from dual;
select 625.28975, round(625.28975,-2) from dual; -- 백자리로 반올림처리됨
select * from emp;
-- 과제
-- sal를 매월 이달 급여분(1/13)을 처리하시오, 단 이달은 보너스가 있는 달
-- 출력내용 : 사번, 연봉, 이달급여, 보너스, 총급여액(급여와 보너스는 10단위로 반올림처리)
select empno, sal, round(sal/13,-1), round(nvl(comm,0),-1), round(sal/13,-1)+round(nvl(comm,0),-1) from emp;
/*
4. trunc함수 : 특정 자리수 이하로 절삭처리
	trunc(데이터, 자리수)
*/
select *from emp;
select trunc(24.5465,2), trunc(24.5465,-1) from emp;
/*
숙제 sal를 기준으로
1000미만				-10% 보너스
1000~2000미만		-20% 보너스
2000~3000미만		-30% 보너스
3000~4000미만		-40% 보너스
4000~5000미만		-50% 보너스
5000이상				-60% 보너스
함수를 활용해서 아래 내용을 처리하시오
사번 이름 연봉 보너스(%) 보너스금액
*/
--5. mod함수 : 나머지 함수처리 형식 : mod(데이터,나눌수) 해당데이터를 나눌 수로 나눈 후 나머지내용에 대한처리
-- 사원번호가 홀수인 사람을 검색
select * from emp
where mod(empno,2)=1;
/*
숙제
사원을 부서기준으로 1팀과 2팀으로 나누어서 체육대회를 하기로 했다
부서번호가 10, 30 ==> 1팀
부서번호가 20, 40 ==> 2팀
으로 나누고 다음과 같이 출력
부서번호 사원번호 이름 팀명
*/
/*
문자 처리 함수
1. upper 모든 데이터를 대문자로 전환
	upper(데이터)
	일반적으로 운영데이터가 소문자나 대문자가 섞여 입력되어 있는 경우
	해당 데이터를 입력문자(대소문자 구분없이)로 검색할 때 많이 쓰인다
*/
select upper('hi! Good days!!') from dual;
/*
2. 소문자를 변환하는 lower함수
	lower(데이터)
*/
select empno, lower(ename), lower(job) from emp;
/*
3. initcap함수 : 첫문자만 대문자, 나머지는 소문자처리
	initcap(데이터)
*/
select initcap(ename), initcap(job) from emp;
-- Smith is a Clerk!! 출력
select initcap(ename) ||' is a '||initcap(job)||'!!!' introJob from emp;
/*
문자 길이를 처리하는 length
형식 length(데이터)
*/
select length('himan') from dual;






