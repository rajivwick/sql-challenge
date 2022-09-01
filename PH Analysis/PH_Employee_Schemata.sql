-- Create the departments table

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

-- Import CSV File Now

-- Check data import

SELECT *
FROM departments;

-- Create the titles table

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);

-- Import CSV File Now

-- Check data import

SELECT *
FROM titles;

-- Create the employees table

CREATE TABLE "employees" (
    "emp_no" FLOAT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR(6)   NOT NULL,
    "hire_date" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

-- Import CSV File Now

-- Check data import

SELECT *
FROM employees;

-- Create the dept_emp table

CREATE TABLE "dept_emp" (
    "emp_no" FLOAT   NOT NULL,
	"dept_no" VARCHAR   NOT NULL,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
    PRIMARY KEY ("emp_no", "dept_no")
);

-- Import CSV File Now

-- Check data import

SELECT *
FROM dept_emp;

-- Create the dept_manager table

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
	"emp_no" FLOAT   NOT NULL,
	FOREIGN KEY("emp_no")REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
	PRIMARY KEY ("dept_no", "emp_no")
);

-- Import CSV File Now

-- Check data import

SELECT *
FROM dept_manager;

-- Create the salaries table

CREATE TABLE "salaries" (
    "emp_no" FLOAT   NOT NULL,
    "salary" FLOAT   NOT NULL,
	CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

-- Import CSV File Now

-- Check data import

SELECT *
FROM salaries;