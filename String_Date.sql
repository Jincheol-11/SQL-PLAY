CAR_RENTAL_COMPANY_CAR 테이블에서 '네비게이션' 옵션이 포함된 자동차 리스트를 출력하는 SQL문을 작성해주세요. 결과는 자동차 ID를 기준으로 내림차순 정렬해주세요.
1. LIKE 이용
SELECT CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%네비게이션%'
ORDER BY CAR_ID DESC;

2. 정규식 이용
SELECT CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS REGEXP '네비게이션'
ORDER BY CAR_ID DESC;


USED_GOODS_BOARD 테이블에서 2022년 10월 5일에 등록된 중고거래 게시물의 게시글 ID, 작성자 ID, 게시글 제목, 가격, 거래상태를 조회하는 SQL문을 작성해주세요. 
거래상태가 SALE 이면 판매중, RESERVED이면 예약중, DONE이면 거래완료 분류하여 출력해주시고, 결과는 게시글 ID를 기준으로 내림차순 정렬해주세요.

SELECT BOARD_ID, WRITER_ID, TITLE, PRICE,
CASE WHEN STATUS = "SALE" THEN "판매중"
    WHEN STATUS = "RESERVED" THEN "예약중"
    WHEN STATUS = "DONE" THEN "거래완료"
    END AS STATUS
FROM USED_GOODS_BOARD
WHERE 1=1 // 참이라는 뜻 (CREATED_DATE = "2022-10-05%" 데이터를 모두 조회하라는 뜻)
AND CREATED_DATE = "2022-10-05%"
ORDER BY BOARD_ID DESC;
