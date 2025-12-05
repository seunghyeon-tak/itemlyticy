CREATE TABLE items
(
    id             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    item_code      INT             NOT NULL,           -- 메이플 아이템 고유 코드
    name_ko        VARCHAR(255)    NOT NULL,           -- 이름(한국어)
    name_en        VARCHAR(255)    NULL,               -- 영문 이름(있으면)
    category       VARCHAR(100)    NULL,               -- 대분류(장비/무기/기타 등)
    subcategory    VARCHAR(100)    NULL,               -- 소분류
    required_level INT             NULL,               -- 요구 레벨
    icon_url       VARCHAR(500)    NULL,               -- 아이콘 이미지 URL
    is_cash        TINYINT(1)      NOT NULL DEFAULT 0, -- 캐시 여부
    raw_json       JSON            NOT NULL,           -- 원본 NDJSON 전체 저장
    created_at     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_item_code (item_code)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE item_trade_snapshots
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    item_code       INT             NOT NULL,           -- FK(논리적), items.item_code
    world           VARCHAR(50)     NULL,               -- 서버명 (스카니아 등)
    price           BIGINT          NOT NULL,           -- 가격
    quantity        INT             NOT NULL DEFAULT 1, -- 수량
    trade_source_id VARCHAR(100)    NULL,               -- 거래 ID(있다면)
    crawled_at      DATETIME        NOT NULL,           -- 크롤링 시각
    raw_json        JSON            NOT NULL,           -- 원본 거래 JSON
    PRIMARY KEY (id),
    KEY idx_item_time (item_code, crawled_at),
    KEY idx_item_world (item_code, world, crawled_at)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
