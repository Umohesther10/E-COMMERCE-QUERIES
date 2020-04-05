CREATE DATABASE `e_commerce_website`; 
USE `e_commerce_website`;

CREATE TABLE customers (
customer_id INT(11) AUTO_INCREMENT,
first_name VARCHAR(60),
last_name VARCHAR (60),
phone VARCHAR (15),
email VARCHAR (60),
address VARCHAR (100),
gender VARCHAR (32),
country VARCHAR (32),
state VARCHAR (32),
PRIMARY KEY(customer_id)
);
SELECT * FROM customers;
INSERT INTO customers (`first_name`, `last_name`, `phone`, `email`, `address`, `gender`, `country`, `state`) VALUES ("Esther", "Umoh", "09094824383", "umohesther08@gmail.com", "3, Ogunseruwa Avenue Ogijo ", "female", "Nigeria", "Ogun");
INSERT INTO customers (`first_name`, `last_name`, `phone`, `email`, `address`, `gender`, `country`, `state`) VALUES ("Caleb", "Nya", "080057721579", "calebnya@gmail.com", "Area A Nyanya ", "male", "Nigeria", "FCT");
INSERT INTO customers (`first_name`, `last_name`, `phone`, `email`, `address`, `gender`, `country`, `state`) VALUES ("Susan", "Nwodo", "09094824384", "susannwodo08@gmail.com", "3, Lazarus avenue Sapele ", "female", "Nigeria", "Delta");
INSERT INTO customers (`first_name`, `last_name`, `phone`, `email`, `address`, `gender`, `country`, `state`) VALUES ("Gabriel", "Ogunsanya", "07033605727", "ogunsanyagabriel@gmail.com", "3 Mokola avenue Ibadan ", "male", "Nigeria", "Oyo");
INSERT INTO customers (`first_name`, `last_name`, `phone`, `email`, `address`, `gender`, `country`, `state`) VALUES ("Bunmi", "Idowu", "07068042756", "idowubunmi08@gmail.com", "12 GloryLand Estate Egbeda", "female", "Nigeria", "Lagos");
CREATE TABLE orders (
order_id INT(11) AUTO_INCREMENT,
customer_id INT(11),
order_date DATE ,
order_status VARCHAR (32),
PRIMARY KEY(order_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
SELECT * FROM orders;
SELECT `first_name`, `last_name`, `state`, `order_date`, `order_status`  FROM orders JOIN customers ON orders.customer_id= customers.customer_id;
INSERT INTO orders (`customer_id`, `order_date`, `order_status`) VALUES ("1", "2020-04-03", "NEW");
INSERT INTO orders (`customer_id`, `order_date`, `order_status`) VALUES ("2", "2020-04-02", "NEW");
INSERT INTO orders (`customer_id`, `order_date`, `order_status`) VALUES ("3", "2020-04-03", "NEW");
INSERT INTO orders (`customer_id`, `order_date`, `order_status`) VALUES ("4", "2020-04-03", "NEW");
INSERT INTO orders (`customer_id`, `order_date`, `order_status`) VALUES ("5", "2020-04-02", "NEW");

CREATE TABLE orders (
product_id INT(11) AUTO_INCREMENT,
customer_id INT(11),
order_date DATE ,
order_status VARCHAR (32),
PRIMARY KEY(product_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE product_categories (
category_id INT(11) AUTO_INCREMENT,
category_name VARCHAR (50),
PRIMARY KEY(category_id)
);

select * from products;
SELECT * FROM shippings JOIN orders ON shippings.order_id= orders.order_id;

CREATE TABLE products (
product_id INT(11) AUTO_INCREMENT,
category_id INT(11),
product_name VARCHAR (60) ,
product_price DECIMAL (10, 2) NOT NULL,
product_size VARCHAR (50),
product_color VARCHAR (50) ,
product_description VARCHAR (100),
product_location VARCHAR (100),
PRIMARY KEY (product_id),
FOREIGN KEY (category_id) REFERENCES product_categories(category_id)
);

INSERT INTO product_categories (`category_name`) VALUES ( "Electronics");
INSERT INTO product_categories (`category_name`) VALUES ( "Mobile Phones");
INSERT INTO product_categories (`category_name`) VALUES ( "Laptops");
INSERT INTO product_categories (`category_name`) VALUES ( "Women Dresses");
INSERT INTO product_categories (`category_name`) VALUES ( "Baby Accessories");
select * from products;
DROP TABLE products;

INSERT INTO products (`product_id`,`category_id`, `product_name`, `product_price`, `product_size`, `product_color`, `product_description`, `product_location`) VALUES ( "1","1", "Fridge", "223,000" "TRUE", "FALSE", "Affordable Fridge for use", "Lagos");
INSERT INTO products (`produc_id`,`category_id`, `product_name`, `product_price`, `product_size`, `product_color`, `product_description`, `product_location`) VALUES ( "2", "2", "Women Dress", "6,000" "TRUE", "TRUE", "Nice Dress for  women use", "Abuja");
INSERT INTO products (`product_id`,`category_id`, `product_name`, `product_price`, `product_size`, `product_color`, `product_description`, `product_location`) VALUES ( "3",   "3","I Phone 11", "289,000" "FALSE", "TRUE", "Sleek Phone for  Ultimate use", "Lagos");
INSERT INTO products (`product_id`,`category_id`, `product_name`, `product_price`, `product_size`, `product_color`, `product_description`, `product_location`) VALUES ( "4","4", "HP Laptops", "150,000" "FALSE", "TRUE", "Affordable Laptops for use", "Abuja");
INSERT INTO products (`product_id`,`category_id`, `product_name`, `product_price`, `product_size`, `product_color`, `product_description`, `product_location`) VALUES ("5", "5", "Baby Hangers", "9,000" "FALSE", "TRUE", "Baby accessories to make your life easier", "Lagos");

CREATE TABLE shippings (
shipping_id INT(11) AUTO_INCREMENT,
order_id INT(11),
shipping_date DATE ,
tracking_id VARCHAR (50) ,
shipping_location VARCHAR (100),
PRIMARY KEY (shipping_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


CREATE TABLE payments (
payment_id INT(11) AUTO_INCREMENT,
order_id INT (50),
payment_date DATE ,
credit_card_number VARCHAR (60),
PRIMARY KEY(payment_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
SELECT * FROM orders join customers on orders.customer_id= customers.customer_id join payments on orders.customer_id= orders.order_id JOIN shippings ON shippings.order_id= orders.order_id;
 

SELECT * FROM payments JOIN orders ON orders.customer_id= orders.order_id


