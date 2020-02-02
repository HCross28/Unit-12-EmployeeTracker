
CREATE DATABASE employees_db;

USE employees_db;


CREATE TABLE department
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE employee
(
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	role_id INT,
	manager_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (manager_id) REFERENCES role(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);


CREATE TABLE role
(
	id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR (30) NOT NULL,
    salary DECIMAL NOT NULL,
	department_id INTEGER NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);



INSERT INTO department (name) VALUES ("Scranton");
INSERT INTO department (name) VALUES ("Nashua");
INSERT INTO department (name) VALUES ("Stamford");
INSERT INTO department (name) VALUES ("New York");
INSERT INTO department (name) VALUES ("Utica");

INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Michael", "Scott", null , 1);
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Jim", "Halpert", 2 , null);
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Pam", "Beasley", 3 , null);
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Dwight", "Schrute", 4 , null);
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Karen", "Filippelli", null , 5);
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("David", "Wallace", null , 4);

INSERT INTO role (title, salary, department_id) VALUES ("Manager", 100.00, 1);
INSERT INTO role (title, salary, department_id) VALUES ("Manager", 100.00, 2);
INSERT INTO role (title, salary, department_id) VALUES ("Manager", 100.00, 3);
INSERT INTO role (title, salary, department_id) VALUES ("Manager", 100.00, 4);
INSERT INTO role (title, salary, department_id) VALUES ("Manager", 100.00, 5);