DROP TABLE bookings;
DROP TABLE members;
DROP TABLE yogaclasses;
DROP TABLE instructors;
DROP TABLE specialities;
DROP TABLE levels;


CREATE TABLE levels (
  id SERIAL8 primary key,
  level VARCHAR(255)
);

CREATE TABLE specialities
 (
  id SERIAL8 primary key,
  speciality VARCHAR(255)
);

CREATE TABLE instructors
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  speciality_id INT8 REFERENCES specialities(id) ON DELETE CASCADE
);

CREATE TABLE yogaclasses
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  start_time TIMESTAMP,
  duration VARCHAR(255),
  level_id INT8 REFERENCES levels(id) ON DELETE CASCADE,
  instructor_id INT8 REFERENCES instructors(id) ON DELETE CASCADE
);

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  level_id INT8 REFERENCES levels(id) ON DELETE CASCADE
);

CREATE TABLE bookings
(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  yogaclass_id INT8 REFERENCES yogaclasses(id) ON DELETE CASCADE
);
