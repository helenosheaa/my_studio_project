DROP TABLE bookings;
DROP TABLE members;
DROP TABLE yogaclasses;
DROP TABLE instructors;

CREATE TABLE instructors
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  speciality VARCHAR(255)
);

CREATE TABLE yogaclasses
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  time VARCHAR(255),
  duration VARCHAR(255),
  level VARCHAR(255),
  instructor_id INT8 REFERENCES instructors(id)
);

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  level VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id),
  yogaclass_id INT8 REFERENCES yogaclasses(id)
);
