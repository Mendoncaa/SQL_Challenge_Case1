USE david_8weeks;

CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INT
);

CREATE TABLE menu (
  product_id INT,
  product_name VARCHAR(5),
  price INT
);

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);