문제(상품 별 오프라인 매출 구하기)
PRODUCT 테이블과 OFFLINE_SALE 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 출력하는 SQL문을 작성해주세요. 결과는 매출액을 기준으로 내림차순 정렬해주시고 매출액이 같다면 상품코드를 기준으로 오름차순 정렬해주세요.
inner join 사용

SELECT p.PRODUCT_CODE , sum(p.PRICE * o.SALES_AMOUNT) as SALES
from PRODUCT as p join OFFLINE_SALE as o
on p.PRODUCT_ID = o.PRODUCT_ID
group by p.PRODUCT_ID
order by 2 desc ,1;


문제(있었는데요 없었습니다)
관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.
SELECT ai.ANIMAL_ID, ai.NAME
FROM ANIMAL_INS AS ai JOIN ANIMAL_OUTS AS ao
ON ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ao.DATETIME < ai.DATETIME
ORDER BY ai.DATETIME ASC;

문제(오랜 기간 보호한 동물(1))
아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 시작일 순으로 조회해야 합니다.
방법1
SELECT ai.NAME, ai.DATETIME
FROM ANIMAL_INS as ai LEFT join ANIMAL_OUTS as ao
on ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ao.ANIMAL_ID IS NULL
ORDER BY DATETIME
LIMIT 3;

방법2
SELECT NAME, DATETIME
FROM ANIMAL_INS
WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID
                       FROM ANIMAL_OUTS)
ORDER BY DATETIME
LIMIT 3;
