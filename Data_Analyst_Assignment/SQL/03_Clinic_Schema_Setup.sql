CREATE TABLE clinics (
    cid TEXT,
    clinic_name TEXT,
    city TEXT,
    state TEXT
);

CREATE TABLE clinic_sales (
    id TEXT,
    cid TEXT,
    uid TEXT,
    datetime DATETIME,
    sales_channel TEXT,
    amount FLOAT
);

CREATE TABLE expenses (
    id TEXT,
    cid TEXT,
    datetime DATETIME,
    expense_type TEXT,
    amount FLOAT
);

INSERT INTO clinics VALUES 
('c1','Apollo Clinic','Hyderabad','Telangana'),
('c2','City Care','Bangalore','Karnataka');

INSERT INTO clinic_sales VALUES 
('s1','c1','u1','2021-01-10 10:00:00','Online',500),
('s2','c1','u2','2021-01-15 11:00:00','Offline',700),
('s3','c2','u3','2021-02-10 09:00:00','Online',800),
('s4','c2','u1','2021-02-12 12:00:00','Offline',300);

INSERT INTO expenses VALUES 
('e1','c1','2021-01-20','Rent',400),
('e2','c1','2021-01-25','Salary',300),
('e3','c2','2021-02-20','Rent',500),
('e4','c2','2021-02-25','Salary',200);