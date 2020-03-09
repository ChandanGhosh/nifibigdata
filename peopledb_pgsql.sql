CREATE database peopledb

CREATE TABLE Person
(
    id NUMERIC NOT NULL PRIMARY KEY, -- primary key column
    name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
    -- specify more columns here
);

