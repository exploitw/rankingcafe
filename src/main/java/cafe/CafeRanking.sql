DROP TABLE comment;
DROP TABLE community;
DROP TABLE review;
DROP TABLE menu;
DROP TABLE type;
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
    info VARCHAR
);
CREATE TABLE menu(
    id IDENTITY,
    cafeId BIGINT NOT NULL REFERENCES cafe(id) ON DELETE CASCADE,
    name VARCHAR(64) NOT NULL,
    price INT NOT NULL,
    content VARCHAR
);
CREATE TABLE type(
    id IDENTITY,
    cafeId BIGINT NOT NULL REFERENCES cafe(id) ON DELETE CASCADE,
    name VARCHAR(10) NOT NULL
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
    date TIMESTAMP
);
CREATE TABLE comment(
    id IDENTITY,
    customerId varchar(24) NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
    communityId BIGINT NOT NULL REFERENCES community(id) ON DELETE CASCADE,
    content VARCHAR,
    date TIMESTAMP
);