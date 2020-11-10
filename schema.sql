DROP TABLE IF EXISTS titles;

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS departments;

DROP TABLE IF EXISTS dept_emp;

DROP TABLE IF EXISTS dept_manager;

DROP TABLE IF EXISTS salaries;


CREATE TABLE titles (
	title_id VARCHAR(20),
	title VARCHAR(20),
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no INTEGER,
	emp_title VARCHAR(20),
	birth_date DATE NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(20),
	hire_date DATE NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR(20),
	dept_name VARCHAR(20),
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(20),
	emp_no INTEGER,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER  NOT NULL,
	dept_no VARCHAR(20)  NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
