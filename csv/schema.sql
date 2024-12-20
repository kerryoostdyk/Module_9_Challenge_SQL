--Created with Quick DBD
--Edited with help from chat GPT

CREATE TABLE "employees" (
    "emp_no" VARCHAR(10) NOT NULL,
    "emp_title_id" VARCHAR(10) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE "department" (
    "dept_no" VARCHAR(10) NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY ("dept_no")
);

CREATE TABLE "titles" (
    "emp_title_id" VARCHAR(10) NOT NULL,
    "title" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("emp_title_id")
);

CREATE TABLE "salaries" (
    "emp_no" VARCHAR(10) NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);


CREATE TABLE "dept_emp" (
    "dept_no" VARCHAR(10) NOT NULL,
    "emp_no" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "department" ("dept_no"),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10) NOT NULL,
    "emp_no" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "department" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

--To insert data, follow this order:

--Insert into department and titles (no foreign key dependencies).
--Insert into employees.
--Insert into salaries.
--Insert into dept_manager.
--Insert into dept_emp. 

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" 
FOREIGN KEY ("emp_title_id") REFERENCES "titles" ("emp_title_id");

