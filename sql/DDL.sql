-- Необходимо спроектировать базу данных ПОСТАВКА ТОВАРОВ
-- В БД должна храниться информация:
-- - о ТОВАРАХ : код товара, наименование товара, цена товара
--ЗАКАЗАХ на поставку товаров: код заказа, наименование заказчика, адрес заказчика, телефон,
-- номер договора, дата заключения договора, наименование товара, плановая поставка (шт.);
-- - фактических
--  ОТГРУЗКАХ товаров: код отгрузки, код заказа, дата отгрузки, отгружено товара (шт.)
-- При проектировании БД необходимо учитывать следующее:
-- • товар имеет несколько заказов на поставку. Заказ соответствует одному товару;
-- • товару могут соответствовать несколько отгрузок. В отгрузке могут участвовать несколько товаров.
-- Кроме того следует учесть:
-- • товар не обязательно имеет заказ. Каждому заказу обязательно соответствует товар;
-- • товар не обязательно отгружается заказчику. Каждая отгрузка обязательно соответствует некоторому товару.
--
CREATE TABLE products (
id serial PRIMARY KEY,
name varchar(120) NOT NULL CHECK (name != ' '),
price numeric(6, 2) NOT NULL CHECK(price > 0),
number_pcs int NOT NULL CHECK (number_pcs > 0)
);
--
CREATE TABLE users (
id serial PRIMARY KEY,
name varchar (125) NOT NULL CHECK (name != ' '),
adress varchar (200) NOT NULL CHECK (adress != ' '),
phone int NOT NUll CHECK (phone > 9) UNIQUE,
treaty_num int NOT NULL CHECK (treaty_num > 0) UNIQUE,
treaty_date date NOT NULL DEFAULT current_date
);
--
CREATE TABLE orders(
id serial PRIMARY KEY,
user_id int NOT NULL REFERENCES users
);
--

CREATE TABLE orders_to_products (
    orders_id int REFERENCES orders,
    product_id int REFERENCES products,
    quantity_units int NOT NULL CHECK(quantity_units > 0),
    PRIMARY KEY(orders_id, product_id)
);
--
CREATE TABLE shipments (
id serial PRIMARY KEY,
orders_id int REFERENCES orders,
shipments_date date NOT NULL DEFAULT current_date
);
--
