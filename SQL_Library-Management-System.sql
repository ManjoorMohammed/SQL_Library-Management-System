create database library;
use library;

CREATE TABLE Books(ISBN VARCHAR(20) PRIMARY KEY, Book_title VARCHAR(200),
 Category VARCHAR(20),Rental_Price INT, Status ENUM('YES','NO'),
 Author VARCHAR(100),Publisher VARCHAR(100)); 
 
CREATE TABLE Branch( Branch_no INT PRIMARY KEY, Manager_id INT, 
Branch_address VARCHAR(200), Contact_no BIGINT);

CREATE TABLE Employee(Emp_id INT PRIMARY KEY, Emp_name VARCHAR(30),
 Position VARCHAR(30), Salary INT);

CREATE TABLE Customer( Customer_id INT PRIMARY KEY, Customer_name VARCHAR(30),
 Customer_address VARCHAR(200), Reg_date DATE);

CREATE TABLE IssueStatus( Issue_id INT PRIMARY KEY, Issued_cust INT,
 Issued_book_name VARCHAR(100), Issue_date DATE, Isbn_book VARCHAR(20),
 FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_id),
 FOREIGN KEY(Isbn_book) REFERENCES Books(ISBN));

CREATE TABLE ReturnStatus( Return_id INT PRIMARY KEY, Return_Cust INT,
 Return_book_name VARCHAR(100), Return_date DATE, Isbn_book2 VARCHAR(20),
 FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN),
 FOREIGN KEY (Return_Cust) REFERENCES Customer(Customer_id));
 
DESC Branch;
DESC Employee;
DESC Customer;
DESC IssueStatus;
DESC ReturnStatus;
DESC Books;

INSERT INTO Books VALUES 
('978-0061120084', 'To Kill a Mockingbird', 'Fiction', 10, 'YES', 'Harper Lee', 'HarperCollins'),
('978-1400033416', '1984', 'Fiction', 12, 'NO', 'George Orwell', 'Penguin Books'),
('978-0544003415', 'The Hobbit', 'Fantasy', 15, 'YES', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt'),
('978-0385472579', 'Brave New World', 'Science Fiction', 11, 'YES', 'Aldous Huxley', 'Harper & Brothers'),
('978-0743273565', 'The Great Gatsby', 'Fiction', 13, 'YES', 'F. Scott Fitzgerald', 'Scribner'),
('978-0316769488', 'To the Lighthouse', 'Fiction', 9, 'NO', 'Virginia Woolf', 'Harvest Books'),
('978-0142437209', 'Moby-Dick', 'Fiction', 14, 'YES', 'Herman Melville', 'Penguin Books'),
('978-0743273567', 'Pride and Prejudice', 'Fiction', 12, 'NO', 'Jane Austen', 'Modern Library'),
('978-0062315007', 'The Catcher in the Rye', 'Fiction', 10, 'YES', 'J.D. Salinger', 'Little, Brown and Company'),
('978-1400034772', 'Animal Farm', 'Fiction', 11, 'YES', 'George Orwell', 'Penguin Books');
 
 
   
INSERT INTO Branch VALUES 
(1, 101, '123 Main St', 1234567890),
(2, 102, '456 Elm St', 9876543210),
(3, 103, '789 Oak St', 1357924680),
(4, 104, '567 Pine St', 2468013579),
(5, 105, '890 Maple St', 1122334455),
(6, 106, '222 Cedar St', 9988776655),
(7, 107, '333 Birch St', 5544332211),
(8, 108, '444 Walnut St', 6677889900),
(9, 109, '555 Cherry St', 9900112233),
(10, 110, '666 Willow St', 7788990011); 

INSERT INTO Employee VALUES 
(1, 'John Doe', 'Manager', 60000),
(2, 'Jane Smith', 'Supervisor', 45000),
(3, 'Michael Johnson', 'Assistant Manager', 48000),
(4, 'Emily Williams', 'Clerk', 30000),
(5, 'David Brown', 'Analyst', 55000),
(6, 'Sarah Garcia', 'Assistant', 32000),
(7, 'Robert Martinez', 'Coordinator', 40000),
(8, 'Jennifer Miller', 'Associate', 42000),
(9, 'William Wilson', 'Consultant', 50000),
(10, 'Amanda Jones', 'Specialist', 48000);
 
 INSERT INTO Customer values
(1, 'Alice Johnson', '123 Main St, Cityville', '2023-01-15'),
(2, 'Bob Smith', '456 Elm St, Townburg', '2023-02-28'),
(3, 'Charlie Brown', '789 Oak St, Villageton', '2023-03-10'),
(4, 'Diana Williams', '111 Pine St, Hamletville', '2023-04-05'),
(5, 'Eva Garcia', '222 Maple St, Boroughtown', '2023-05-20'),
(6, 'Frank Davis', '333 Cedar St, Settlementville', '2023-06-12'),
(7, 'Grace Wilson', '444 Birch St, Villageville', '2023-07-18'),
(8, 'Henry Moore', '555 Walnut St, Hamletburg', '2023-08-25'),
(9, 'Isabel Lee', '666 Cherry St, Townville', '2023-09-30'),
(10, 'Jack Taylor', '777 Willow St, Cityburg', '2023-10-11');

INSERT INTO IssueStatus VALUES 
(1, 1, 'To Kill a Mockingbird', '2023-01-20', '978-0061120084'),
(2, 3, '1984', '2023-02-05', '978-1400033416'),
(3, 5, 'The Hobbit', '2023-03-12', '978-0544003415'),
(4, 2, 'Brave New World', '2023-04-18', '978-0385472579'),
(5, 4, 'The Great Gatsby', '2023-05-01', '978-0743273565'),
(6, 6, 'To the Lighthouse', '2023-06-08', '978-0316769488'),
(7, 8, 'Moby-Dick', '2023-07-15', '978-0142437209'),
(8, 10, 'Pride and Prejudice', '2023-08-20', '978-0743273565'),
(9, 7, 'The Catcher in the Rye', '2023-09-25', '978-0062315007'),
(10, 9, 'Animal Farm', '2023-10-30', '978-1400034772');

 
INSERT INTO ReturnStatus 
VALUES 
(1, 1, 'To Kill a Mockingbird', '2023-02-15', '978-0061120084'),
(2, 3, '1984', '2023-03-10', '978-1400033416'),
(3, 5, 'The Hobbit', '2023-04-20', '978-0544003415'),
(4, 2, 'Brave New World', '2023-05-25', '978-0385472579'),
(5, 4, 'The Great Gatsby', '2023-06-30', '978-0743273565');

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Books;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;

-- 1. Retrieve books with a 'yes' status:
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status="YES";

-- 2. Get employee names and salaries in descending order of salary:
select Emp_name, Salary from Employee order by Salary desc;

-- 3. Retrieve books issued with the customer names:
SELECT Issued_book_name,Customer_name FROM IssueStatus,Customer
  WHERE IssueStatus.Issued_cust=Customer.Customer_id;
  
  -- 4. Book Catehory Count
  SELECT Category,count(Book_title) as Total_Books  FROM Books GROUP BY Category;
  
  -- 5. Employee with salary greater than 50000
  SELECT Emp_name,Position,Salary FROM Employee WHERE Salary>50000;
  
  -- 6. customers who registered before January 1, 2023, and who have not issued any books
  SELECT Customer_id, Customer_name,Reg_date From Customer 
  WHERE Reg_date <"2023-01-01"  and Customer_id NOT IN (SELECT Issued_cust FROM IssueStatus); 
  
  -- 7.  Manager_id values for each unique Branch_no 
SELECT Branch_no,count(Manager_id) FROM  Branch GROUP BY Branch_no;

-- 8. customers along with the corresponding books they've issued within the specified date range.
SELECT Customer_name,Issued_book_name FROM Customer,IssueStatus WHERE Customer.Customer_id=IssueStatus.Issued_cust 
AND Customer_id IN (SELECT Issued_cust FROM IssueStatus WHERE Issue_date BETWEEN  "2023-05-31" AND "2023-07-01");
  
-- 9. Books In Fantasy
SELECT Book_title,Category FROM Books WHERE Category="Fantasy";
  
-- 10.
SELECT Branch.Branch_no, count(*) as Total_employee 
     FROM Branch 
     JOIN Employee ON Branch.Manager_id=Employee.Emp_id
     GROUP BY Branch.Branch_no
     HAVING COUNT(*) >5;
