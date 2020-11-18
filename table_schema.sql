-- creating tables for Employee Data Base

-- creating table 'titles'
CREATE TABLE titles ( title_id varchar(20) PRIMARY KEY,
    				  title_description varchar(50) NOT NULL);
					  
-- creating table 'employees' 
CREATE TABLE employees (  emp_id int NOT NULL,
    					  emp_title_id varchar(20),
    					  birth_date date,
   						  first_name varchar(50) NOT NULL,
    					  last_name varchar(50) NOT NULL,
    					  sex varchar(1),
    					  hire_date date   NOT NULL,
						  PRIMARY KEY (emp_id),
						  FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
					  CONSTRAINT chk_sex CHECK (sex::text = 'F'::text OR sex::text = 'M'::text));

-- creating table 'salaries' 
CREATE TABLE salaries (emp_id int PRIMARY KEY,
   					   salary numeric(8,2)NOT NULL,
					   FOREIGN KEY (emp_id) REFERENCES employees (emp_id));
					   
-- creating table 'departments' 
CREATE TABLE departments (dept_id varchar(6) PRIMARY KEY,
						  dept_description varchar(40) NOT NULL);
						  
-- creating table 'department_employees' 
CREATE TABLE department_employees (emp_id int NOT NULL,
    							   dept_id varchar(6) NOT NULL,
								   PRIMARY KEY(emp_id,dept_id),
								   FOREIGN KEY (emp_id) REFERENCES employees (emp_id),
								   FOREIGN KEY (dept_id) REFERENCES departments (dept_id));


-- creating table 'department_manager'
CREATE TABLE department_manager (dept_id varchar(6) NOT NULL,
    							 emp_id_manager int NOT NULL,
								 PRIMARY KEY (dept_id,emp_id_manager),
								 FOREIGN KEY (dept_id) REFERENCES departments (dept_id),
								 FOREIGN KEY (emp_id_manager) REFERENCES employees (emp_id));
								 
								 
								 
