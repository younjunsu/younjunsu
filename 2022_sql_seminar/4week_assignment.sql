[주요 용도]
1. 데이터 복제 : 같은 집합을 여러 번 복제하여 원하는 결과집합을 구한다.
2. 데이터 체크 : 일자의 경우 입력된 값이 올바른지 확인한다. 예를 들면, 2월 30일은 잘못된 일자이다.
3. 효율적 인덱스 사용 : 인덱스의 첫 번째 컬럼 혹은 중간 컬럼이 Where 조건에 사용되지 
않을 때 더미 테이블을 이용하여 IN으로 공급해주면 인덱스를 효율적으로 사용할 수 있다.

[Quiz1]
1. 과거 10년, 미래 10년의 날짜를 포함하고 있는 날짜 테이블(COPY_YMD)을 생성하시오
2. 해당 테이블에 Char형, Date형 날짜 컬럼과 해당 날짜가 포함하는 다양한 포맷을 가진 컬럼을 포함하시오 
   (컬럼명과 컬럼 설명은 아래를 참조)
   ymd_char - 20220420   : Char Type  
   ymd_date - 2022/04/20 : Date Type  
   ymd_d    - 4  : 1(일) ~ 7(금)      
   ymd_dd   - 20 : 4.1 ~ 4.30         
   ymd_ddd  - 365일 기준 110일        
   ymd_dy   - 수    : 요일           
   ymd_day  - 수요일 : 요일           
   ymd_w    - 3    : 4월 기준 3번째 주
   ymd_ww   - 16   : 1년 기준 16주    
   ymd_mm   - 04   : 2자리 포맷팅된 월
   ymd_mon  - 4월  : 한글             
   ymd_q    - 2    : 2분기            
   ymd_yyyy - 2022 : YYYY             
   ymd_year - twenty twenty-two : Year

[주요 용도]
1. 데이터 복제 : 같은 집합을 여러 번 복제하여 원하는 결과집합을 구한다.
2. 주요 목적 : 데이터 복제를 통해 집합 처리를 가능하게 함

[Quiz2]
1. 해당 테이블의 데이터는 아래와 같음
   원본
   ----
      1
      2
      3
2. 데이터 복제를 활용하여 아래의 결과를 도출하시오
   (단, 데이터 복제를 활용하고 분석함수를 사용하지 말 것)
   ORG  ACCU SQUA  (ACCU : ORG의 누적 값, SQUA : ORG의 제곱 값)
   ---- ---- ----
      1    1    1
      2    3    4
      3    6    9


###############################################
answer quiz1
###############################################
$ export TB_NLS_LANG=utf8
SELECT 
	TO_CHAR(ymd) ymd_char,
	TO_DATE(ymd,'yyyy/mm/dd') ymd_date,
	TO_CHAR(ymd,'D') ymd_d,
	TO_CHAR(ymd,'DD') ymd_dd,
	TO_CHAR(ymd,'DDD') ymd_ddd,
	TO_CHAR(ymd,'DY') ymd_dy,
	TO_CHAR(ymd,'DAY') ymd_day,	
	TO_CHAR(ymd,'W') ymd_w,
	TO_CHAR(ymd,'WW') ymd_ww,
	TO_CHAR(ymd,'MM') ymd_mm,
	TO_CHAR(ymd,'MON') ymd_mon,
	TO_CHAR(ymd,'Q') ymd_q,
	TO_CHAR(ymd,'YYYY') ymd_yyyy,
	TO_CHAR(ymd,'YEAR') ymd_year
FROM
	(
		SELECT TO_DATE('20220420') ymd FROM DUAL
	)

###############################################
answer quiz2
###############################################
SELECT
	ORG,
	(SELECT SUM(LEVEL) FROM dual CONNECT BY LEVEL <=a.ORG) ACCU,
	POWER(ORG,2) SQUA
FROM
(
	SELECT
		LEVEL ORG		
	FROM
		DUAL 
	CONNECT BY
	LEVEL <= 3
) a
ORDER BY ORG;

       ORG       ACCU       SQUA
---------- ---------- ----------
         1          1          1
         2          3          4
         3          6          9

