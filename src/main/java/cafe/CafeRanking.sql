DROP TABLE comment;
DROP TABLE community;
DROP TABLE review;
DROP TABLE heart;
DROP TABLE cafe;
DROP TABLE customer;

CREATE TABLE customer(
    id IDENTITY,
    name VARCHAR(12) NOT NULL,
    email VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    nickname VARCHAR(24),
    address VARCHAR,
    phone VARCHAR,
    admin BOOLEAN
);
CREATE TABLE cafe(
    id IDENTITY,
    city VARCHAR(12) NOT NULL,
    name VARCHAR(64) NOT NULL,
    img VARCHAR,
    address VARCHAR NOT NULL,
    phone VARCHAR(64),
    dayOff VARCHAR(22),
    openingHours VARCHAR(64),
    parking BOOLEAN NOT NULL,
    webSite VARCHAR,
    info VARCHAR,
    category VARCHAR(12)
);
CREATE TABLE HEART(
    id IDENTITY,
    cafeId BIGINT NOT NULL REFERENCES cafe(id) ON DELETE CASCADE,
    customerId BIGINT NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
    likeCNT INT DEFAULT 0
);
CREATE TABLE review(
    id IDENTITY,
    cafeId BIGINT NOT NULL REFERENCES cafe(id) ON DELETE CASCADE,
    customerId BIGINT NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
    img VARCHAR,
    content VARCHAR NOT NULL,
    date DATE NOT NULL
);
CREATE TABLE community(
    id IDENTITY,
    customerId BIGINT NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
    title VARCHAR(64) NOT NULL,
    img VARCHAR,
    content VARCHAR NOT NULL,
    date TIMESTAMP,
    view BIGINT DEFAULT 0

);
CREATE TABLE comment(
    id IDENTITY,
    customerId BIGINT NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
    communityId BIGINT NOT NULL REFERENCES community(id) ON DELETE CASCADE,
    content VARCHAR,
    date TIMESTAMP
);
