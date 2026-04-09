CREATE TABLE users (
    user_id TEXT,
    name TEXT,
    phone_number TEXT,
    mail_id TEXT,
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id TEXT,
    booking_date DATETIME,
    room_no TEXT,
    user_id TEXT
);

CREATE TABLE items (
    item_id TEXT,
    item_name TEXT,
    item_rate INT
);

CREATE TABLE booking_commercials (
    id TEXT,
    booking_id TEXT,
    bill_id TEXT,
    bill_date DATETIME,
    item_id TEXT,
    item_quantity FLOAT
);

INSERT INTO users VALUES 
('21wrcxuy-67erfn','John Doe','97XXXXXXXX','john.doe@example.com','ABC City');

INSERT INTO bookings VALUES 
('bk-09f3e-95hj','2021-09-23 07:36:48','rm-bhf9-aerjn','21wrcxuy-67erfn'),
('bk-11ghj-77kl','2021-11-15 10:20:30','rm-xy12-abcd','21wrcxuy-67erfn');

INSERT INTO items VALUES 
('itm-a9e8-q8fu','Tawa Paratha',18),
('itm-a07vh-aer8','Mix Veg',89),
('itm-w978-23u4','Paneer Butter Masala',120);

INSERT INTO booking_commercials VALUES 
('q1','bk-11ghj-77kl','bl-1','2021-11-15','itm-a9e8-q8fu',3),
('q2','bk-11ghj-77kl','bl-1','2021-11-15','itm-a07vh-aer8',1),
('q3','bk-09f3e-95hj','bl-2','2021-10-10','itm-w978-23u4',15);