--Создал покупателей
INSERT INTO users(name, adress, phone, treaty_num)
VALUES('Ivan', 'Dnipro', 0988877780, 1),
    ('Slava', 'Zaporoze', 0988877781, 2),
    ('Victor', 'Harcov', 0988877782, 3),
    ('Sveta', 'Kyev', 0988877783, 4);
--Товар
INSERT INTO products(name, price,number_pcs)
VALUES('Kat', 2000, 4),
('Dog', 4000, 2),
('Mays', 1000, 10);
--Заказы
INSERT INTO orders (user_id)
VALUES(1),(2),(1),(3),(4),(2);
--
INSERT INTO orders_to_products(orders_id,product_id,quantity_units)
VALUES 
(1,1,1),
(1,2,2),
(3,1,1),
(3,3,2),
(4,1,2),
(2,3,4);
--
INSERT INTO shipments(orders_id)
VALUES(1),(2),(3);