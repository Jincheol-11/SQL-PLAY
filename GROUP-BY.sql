문제
CAR_RENTAL_COMPANY_CAR 테이블에서 '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차가 자동차 종류 별로 몇 대인지 출력하는 SQL문을 작성해주세요. 이때 자동차 수에 대한 컬럼명은 CARS로 지정하고, 결과는 자동차 종류를 기준으로 오름차순 정렬해주세요.
SELECT CAR_TYPE, COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;

문제
APPOINTMENT 테이블에서 2022년 5월에 예약한 환자 수를 진료과코드 별로 조회하는 SQL문을 작성해주세요. 이때, 컬럼명은 '진료과 코드', '5월예약건수'로 지정해주시고 결과는 진료과별 예약한 환자 수를 기준으로 오름차순 정렬하고, 예약한 환자 수가 같다면 진료과 코드를 기준으로 오름차순 정렬해주세요.
  SELECT MCDP_CD AS "진료과코드", COUNT(*) AS "5월예약건수"
FROM APPOINTMENT
WHERE APNT_YMD  LIKE '2022-05%'
GROUP BY MCDP_CD
ORDER BY COUNT(*) ASC, MCDP_CD ASC;

alias 사용의 경우 띄어쓰기나 ASCII가 아닌 문자가 있으면 쿼리를 잘못 인식하므로 "(큰따옴표)"를 사용
ORDER BY 절에는 컬럼 명 대신 ALIAS 명이나 컬럼 순서를 나타내는 정수를 혼용하여 사용할 수 있음. 하지만 정수 사용은 유지 보수에 좋지 않으므로 실제 컬럼 이름을 사용하겠습니다.

문제
REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요. 이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.
서브쿼리 + 조인 사용
SELECT R1.FOOD_TYPE, R1.REST_ID, R1.REST_NAME, R1.FAVORITES
FROM REST_INFO R1
JOIN (
    SELECT FOOD_TYPE, MAX(FAVORITES) AS FAVORITES
    FROM REST_INFO
    GROUP BY FOOD_TYPE
) R2 ON R1.FOOD_TYPE = R2.FOOD_TYPE AND R1.FAVORITES = R2.FAVORITES
ORDER BY R1.FOOD_TYPE DESC;

문제
USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 완료된 중고 거래의 총금액이 70만 원 이상인 사람의 회원 ID, 닉네임, 총거래금액을 조회하는 SQL문을 작성해주세요. 결과는 총거래금액을 기준으로 오름차순 정렬해주세요.
SELECT USER_ID, NICKNAME, SUM(PRICE) AS TOTAL_SALES
FROM USED_GOODS_BOARD AS b, USED_GOODS_USER AS u
WHERE b.WRITER_ID = u.USER_ID
    AND b.STATUS = 'DONE'
GROUP BY USER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES ASC;

문제
CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 
  자동차들에 대해서 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력하는 SQL문을 작성해주세요.
  결과는 월을 기준으로 오름차순 정렬하고, 월이 같다면 자동차 ID를 기준으로 내림차순 정렬해주세요. 특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외해주세요.

SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    AND CAR_ID IN(
        SELECT CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
        GROUP BY CAR_ID
        HAVING COUNT(*) >= 5
    )
GROUP BY MONTH(START_DATE), CAR_ID
ORDER BY MONTH ASC, CAR_ID DESC;

문제
동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.

SELECT NAME, COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE NAME IN(
    SELECT NAME
    FROM ANIMAL_INS
    GROUP BY NAME
    HAVING COUNT(*) >= 2
)
GROUP BY NAME
ORDER BY NAME ASC;
