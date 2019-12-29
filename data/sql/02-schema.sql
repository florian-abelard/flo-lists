CREATE TABLE wishlist_user (
    uuid VARCHAR(36) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (uuid)
);

CREATE TABLE person (
    uuid VARCHAR(36) NOT NULL,
    name VARCHAR(100) NOT NULL,
    in_a_relationship_with VARCHAR(100) NULL,
    PRIMARY KEY (uuid)
);
