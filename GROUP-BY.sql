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

alias 사용의 경우 띄어쓰기나 ASCII가 아닌 문자가 있으면 쿼리를 잘못 인식하므로 "(큰따옴표)를 사용
ORDER BY 절에는 컬럼 명 대신 ALIAS 명이나 컬럼 순서를 나타내는 정수를 혼용하여 사용할 수 있음. 하지만 정수 사용은 유지 보수에 좋지 않으므로 실제 컬럼 이름을 사용하겠습니다.

