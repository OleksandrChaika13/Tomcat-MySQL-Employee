--Створення БД
CREATE DATABASE employees_db;

--Створення таблиці
CREATE TABLE IF NOT EXISTS employees
( id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  position VARCHAR(128) NOT NULL,
  phone VARCHAR(128) NOT NULL,
  PRIMARY KEY (id)
);