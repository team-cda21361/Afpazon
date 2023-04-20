-- CREATION DE LA BASE --
DROP DATABASE IF EXISTS afpazon;
CREATE DATABASE IF NOT EXISTS afpazon;
USE afpazon;

-- CREATION DES TABLES --
DROP TABLE IF EXISTS user;
CREATE TABLE user (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
lastName VARCHAR(100),
firstName VARCHAR(100),
email VARCHAR(100) UNIQUE,
password TEXT,
gender VARCHAR(50),
phone VARCHAR(15),
registrationDate DATE,
isActive BOOLEAN DEFAULT 1,
id_role INT DEFAULT 1);

DROP TABLE IF EXISTS address;
CREATE TABLE address (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
address VARCHAR(255),
zipCode INT(5),
city VARCHAR(100),
id_user INT,
id_address_type INT);

DROP TABLE IF EXISTS address_type;
CREATE TABLE address_type (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
type VARCHAR(15));

DROP TABLE IF EXISTS address_ledger;
CREATE TABLE address_ledger (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
address VARCHAR(255),
zipCode INT(5),
city VARCHAR(100));

DROP TABLE IF EXISTS role;
CREATE TABLE role (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
role VARCHAR(10));

DROP TABLE IF EXISTS product;
CREATE TABLE product (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(150),
description TEXT,
price FLOAT,
mainPicPath VARCHAR(255),
videoPath VARCHAR(255) NULL,
inCarousel BOOLEAN,
size VARCHAR(30) NULL,
reference VARCHAR(30) NULL,
color VARCHAR(30) NULL,
weight FLOAT NULL,
warranty INT(2),
sponsoring INT DEFAULT 1,
isActive BOOLEAN DEFAULT 1,
id_vat INT);

DROP TABLE IF EXISTS category;
CREATE TABLE category (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category VARCHAR(50),
isActive BOOLEAN DEFAULT TRUE);

DROP TABLE IF EXISTS category_product;
CREATE TABLE category_product (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_product INT,
id_category INT);

DROP TABLE IF EXISTS image;
CREATE TABLE image (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
picPath VARCHAR(255),
id_product INT);

DROP TABLE IF EXISTS discount;
CREATE TABLE discount (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
startDate DATE,
endDate DATE,
percent FLOAT,
voucher VARCHAR(15) NULL);

DROP TABLE IF EXISTS product_discount;
CREATE TABLE product_discount (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_product INT,
id_discount INT);

DROP TABLE IF EXISTS stock;
CREATE TABLE stock (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
quantity INT,
id_product INT);

DROP TABLE IF EXISTS order_list;
CREATE TABLE order_list (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
dateOrder DATE,
totalPrice FLOAT,
paymentToken VARCHAR(255),
trackingNumber VARCHAR(255) NULL,
id_user INT,
id_address_delivery INT,
id_address_billing INT,
id_status INT);

DROP TABLE IF EXISTS order_product;
CREATE TABLE order_product (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
price FLOAT,
quantity INT,
id_product INT,
id_order INT);

DROP TABLE IF EXISTS review;
CREATE TABLE review (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
content TEXT,
stars INT(1),
id_product INT,
id_user INT);

DROP TABLE IF EXISTS alert;
CREATE TABLE alert (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
email VARCHAR(100),
backInStock BOOLEAN DEFAULT FALSE,
priceDrop BOOLEAN DEFAULT FALSE,
id_product INT);

DROP TABLE IF EXISTS status;
CREATE TABLE status (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
status VARCHAR(50));

DROP TABLE IF EXISTS vat;
CREATE TABLE vat (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
value FLOAT);

DROP TABLE IF EXISTS complement;
CREATE TABLE complement (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_product_a INT,
id_product_b INT);

-- CREATION DES FOREIGN KEYS --
ALTER TABLE address ADD CONSTRAINT FK_address_id_user FOREIGN KEY (id_user) REFERENCES user(id) ON DELETE SET NULL;
ALTER TABLE address ADD CONSTRAINT FK_address_id_address_type FOREIGN KEY (id_address_type) REFERENCES address_type(id) ON DELETE SET NULL;
ALTER TABLE alert ADD CONSTRAINT FK_alert_id_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE image ADD CONSTRAINT FK_image_id_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE order_list ADD CONSTRAINT FK_order_list_id_user FOREIGN KEY (id_user) REFERENCES user(id) ON DELETE SET NULL;
ALTER TABLE order_list ADD CONSTRAINT FK_order_list_id_address_delivery FOREIGN KEY (id_address_delivery) REFERENCES address_ledger(id) ON DELETE SET NULL;
ALTER TABLE order_list ADD CONSTRAINT FK_order_list_id_address_billing FOREIGN KEY (id_address_billing) REFERENCES address_ledger(id) ON DELETE SET NULL;
ALTER TABLE order_list ADD CONSTRAINT FK_order_list_id_status FOREIGN KEY (id_status) REFERENCES status(id) ON DELETE SET NULL;
ALTER TABLE order_product ADD CONSTRAINT FK_order_product_id_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE order_product ADD CONSTRAINT FK_order_product_id_order FOREIGN KEY (id_order) REFERENCES order_list(id) ON DELETE SET NULL;
ALTER TABLE product ADD CONSTRAINT FK_product_id_vat FOREIGN KEY (id_vat) REFERENCES vat(id);
ALTER TABLE category_product ADD CONSTRAINT FK_category_product_id_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE category_product ADD CONSTRAINT FK_category_product_id_category FOREIGN KEY (id_category) REFERENCES category(id) ON DELETE SET NULL;
ALTER TABLE product_discount ADD CONSTRAINT FK_product_discount_id_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE product_discount ADD CONSTRAINT FK_product_discount_id_discount FOREIGN KEY (id_discount) REFERENCES discount(id) ON DELETE SET NULL;
ALTER TABLE review ADD CONSTRAINT FK_review_id_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE review ADD CONSTRAINT FK_review_id_user FOREIGN KEY (id_user) REFERENCES user(id) ON DELETE SET NULL;
ALTER TABLE stock ADD CONSTRAINT FK_stock_id_product FOREIGN KEY (id_product) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE user ADD CONSTRAINT FK_user_id_role FOREIGN KEY (id_role) REFERENCES role(id) ON DELETE SET NULL;
ALTER TABLE complement ADD CONSTRAINT FK_complement_id_product_a FOREIGN KEY (id_product_a) REFERENCES product(id) ON DELETE SET NULL;
ALTER TABLE complement ADD CONSTRAINT FK_complement_id_product_b FOREIGN KEY (id_product_b) REFERENCES product(id) ON DELETE SET NULL;

-- DATASET DE DEPART --
INSERT INTO role (id, role) VALUES 
    (1, "Client"), 
    (729, "Vendeur"), 
    (183, "Admin")
;
INSERT INTO vat (value) VALUES 
    (0.021), 
    (0.055), 
    (0.1), 
    (0.2)
;
INSERT INTO category (category) VALUES 
    ("Livre"),
    ("Musique"),
    ("Jeux Vidéo"),
    ("High-tech"),
    ("Electroménager")
;
INSERT INTO `product` (`id`, `name`, `description`, `price`, `mainPicPath`, `videoPath`, `inCarousel`, `size`, `reference`, `color`, `weight`, `warranty`, `sponsoring`, `isActive`, `id_vat`) VALUES
(1, 'Rosemary - Fresh', 'lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel', 94.99, 'product_1_mainPic.png', NULL, 0, 'XL', '52-772-4603', 'Green', 9.8, 2, 1, 1, 1),
(2, 'Steampan - Lid For Half Size', 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus', 72.99, 'product_2_mainPic.jpeg', NULL, 0, NULL, '95-893-1993', 'Goldenrod', 8.8, 2, 1, 1, 2),
(3, 'Bread - Roll, Soft White Round', 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', 33.99, 'product_3_mainPic.jpg', NULL, 0, 'XL', '80-728-8112', 'Indigo', 6.2, 1, 1, 1, 1),
(4, 'Philips Shaver Series 7000 (Modèle S7783/78)', 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo', 62.99, 'product_4_mainPic.jpg', 'product_4_video.mp4', 0, NULL, 'S7783/78', 'Mauv', 4.7, 0, 1, 1, 1),
(5, 'CHiQ Lave-linge CFL80-14586IM3X', 'sapien arcu sed augue aliquam erat volutpat in congue etiam', 51.99, 'product_5_mainPic.jpg', 'product_5_video.mp4', 0, 'XL', 'CFL80-14586IM3X', 'Pink', 0.8, 1, 1, 1, 4),
(6, 'Squid - Breaded', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna', 136.99, 'product_6_mainPic.png', NULL, 0, NULL, '36-547-3765', 'Purple', 9.8, 2, 1, 1, 4),
(7, 'Lemon Tarts', 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 80.99, 'product_7_mainPic.jpg', NULL, 0, NULL, '78-305-5167', 'Orange', 3.4, 1, 1, 1, 4),
(8, 'Random Access Memories 10th Anniversary Edition (Vinyl)', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis', 122.99, 'product_8_mainPic.jpg', NULL, 0, 'M', '52-166-9955', 'Khaki', 6.8, 2, 1, 1, 4),
(9, 'Icecream - Dstk Strw Chseck', 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum', 38.99, 'product_9_mainPic.png', NULL, 0, NULL, '51-329-0523', 'Red', 6.6, 0, 1, 1, 4),
(10, 'CHIQ, réfrigérateur bas givre, 117 litres', 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo', 143.99, 'product_10_mainPic.jpg', 'product_10_video.mp4', 0, NULL, 'CBM117L42', 'Puce', 7.4, 1, 1, 1, 1),
(11, 'Bundle DJI Mini 3 Fly More', 'sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', 6.99, 'product_11_mainPic.jpg', 'product_11_video.mp4', 0, 'M', '63-464-0059', 'Violet', 1, 1, 1, 1, 2),
(12, 'DJI Osmo Pocket 2', 'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis', 121.99, 'product_12_mainPic.jpg', 'product_12_video.mp4', 0, NULL, '74-073-9906', 'Mauv', 4.6, 3, 1, 1, 4),
(13, 'Hogwarts Legacy (Edition Deluxe)', 'ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam', 60.99, 'product_13_mainPic.jpg', 'product_13_video.mp4', 0, NULL, '09-489-8277', 'Puce', 4.2, 3, 1, 1, 1),
(14, 'Philips L\'Or Barista Sublime LM9012/60', 'arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu pede', 138.99, 'product_14_mainPic.jpg', 'product_14_video.mp4', 0, NULL, 'LM9012/60', 'Mauv', 1.2, 2, 1, 1, 2),
(15, 'Face (Undefinable Face) Édition Limitée', 'nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque', 19.99, 'product_15_mainPic.jpg', NULL, 0, NULL, '76-535-0900', 'Puce', 4.4, 3, 1, 1, 1),
(16, 'Assassin\'s Creed Valhalla - Édition Limitée', 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue', 9.99, 'product_16_mainPic.jpg', 'product_16_video.mp4', 0, NULL, '12-846-5806', 'Violet', 3.9, 2, 1, 1, 3),
(17, 'Lentils - Red, Dry', 'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus', 67.99, 'product_17_mainPic.png', NULL, 0, NULL, '45-515-2568', 'Turquoise', 0, 3, 1, 1, 2),
(18, 'Apple MacBook Air 2022 (M2 Pro)', 'aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede', 9.99, 'product_18_mainPic.jpg', 'product_18_video.mp4', 0, 'M', '16-421-1107', 'Mauv', 2.4, 2, 1, 1, 3),
(19, 'Avant Blake et Mortimer - Tome 1 - Le Rayon U', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 48.99, 'product_19_mainPic.jpg', NULL, 0, NULL, '71-103-4461', 'Aquamarine', 2.9, 2, 1, 1, 4),
(20, 'Green Tea Refresher', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere', 62.99, 'product_20_mainPic.jpg', NULL, 0, 'S', '03-010-8557', 'Crimson', 1.8, 0, 1, 1, 1),
(21, 'Mario Kart 8 Deluxe', 'semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices', 85.99, 'product_21_mainPic.jpg', 'product_21_video.mp4', 0, NULL, '66-050-1905', 'Teal', 1.9, 2, 1, 1, 3),
(22, 'Memento Mori Édition Deluxe', 'semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non', 63.99, 'product_22_mainPic.jpg', NULL, 0, NULL, '53-812-0730', 'Teal', 0.4, 3, 1, 1, 2),
(23, 'Je m\'appelais Franck', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget', 39.99, 'product_23_mainPic.jpg', NULL, 0, NULL, '06-386-2205', 'Purple', 9.7, 1, 1, 1, 3),
(24, 'Apple iPhone 14 Pro', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus', 63.99, 'product_24_mainPic.jpg', 'product_24_video.mp4', 0, 'XS', '37-075-1192', 'Khaki', 9, 0, 1, 1, 1),
(25, 'Fire Emblem: Engage', 'elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas', 50.99, 'product_25_mainPic.jpg', 'product_25_video.mp4', 0, 'L', '27-503-8140', 'Maroon', 3.1, 0, 1, 1, 3),
(26, 'Ratchet & Clank: Rift Apart', 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam', 91.99, 'product_26_mainPic.jpg', 'product_26_video.mp4', 0, NULL, '23-965-2365', 'Aquamarine', 6.4, 3, 1, 1, 3),
(27, 'Longos - Lasagna Veg', 'arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus', 36.99, 'product_27_mainPic.png', NULL, 0, '2XL', '83-992-2978', 'Puce', 8.3, 2, 1, 1, 4),
(28, 'Star Wars Jedi: Survivor', 'vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien', 105.99, 'product_28_mainPic.jpg', 'product_28_video.mp4', 0, NULL, '97-601-9578', 'Yellow', 4.8, 3, 1, 1, 2),
(29, 'Téléviseur Philips 43 Pouces 43PUS8107', 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere', 87.99, 'product_29_mainPic.jpg', 'product_29_video.mp4', 0, '3XL', '43PUS8107', 'Crimson', 6.2, 1, 1, 1, 3),
(30, 'Grille-pain Philips HD2581/90', 'amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in', 90.99, 'product_30_mainPic.jpg', 'product_30_video.mp4', 0, NULL, 'HD2581/90', 'Green', 5.7, 0, 1, 1, 1);
INSERT INTO complement (id_product_a, id_product_b) VALUES 
    (12, 24), 
    (24, 12),
    (12, 25), 
    (25, 12), 
    (13, 26), 
    (26, 13), 
    (8, 9), 
    (9, 8), 
    (1, 30), 
    (30, 1)
;
INSERT INTO category_product (id_product, id_category) VALUES 
    (21, 3),
    (22, 2),
    (14, 5),
    (28, 3),
    (29, 4),
    (19, 1),
    (22, 4),
    (15, 2),
    (26, 3),
    (25, 3),
    (30, 5),
    (18, 4),
    (22, 5),
    (12, 4),
    (13, 3),
    (8, 2),
    (21, 4),
    (18, 2),
    (26, 1),
    (4, 5),
    (10, 5),
    (23, 1),
    (26, 4),
    (29, 5),
    (19, 2),
    (30, 2),
    (11, 4),
    (23, 4),
    (8, 4),
    (16, 3),
    (14, 1),
    (5, 5),
    (21, 5),
    (25, 1),
    (24, 4),
    (18, 3),
    (18, 5),
    (26, 5),
    (4, 4),
    (26, 2)
;
INSERT INTO alert (email, backInStock, priceDrop, id_product) VALUES 
    ('gswiffen0@icio.us', FALSE, TRUE, 5),
    ('bsharrock1@jiathis.com', FALSE, TRUE, 9),
    ('ashelmardine2@epa.gov', TRUE, FALSE, 8),
    ('crambadt3@princeton.edu', TRUE, FALSE, 18),
    ('mabbison4@europa.eu', FALSE, TRUE, 3),
    ('ltoomer5@ucla.edu', TRUE, FALSE, 3),
    ('twolfarth6@ocn.ne.jp', TRUE, FALSE, 11),
    ('ccisco7@freewebs.com', FALSE, TRUE, 4),
    ('scrookshanks8@ucla.edu', FALSE, TRUE, 13),
    ('lcorish9@chronoengine.com', TRUE, FALSE, 3),
    ('cpaoluccia@fema.gov', TRUE, FALSE, 10),
    ('gmateub@guardian.co.uk', TRUE, FALSE, 13),
    ('lobrollachainc@furl.net', TRUE, FALSE, 12),
    ('cghilardinid@comcast.net', TRUE, FALSE, 13),
    ('lschofielde@yellowpages.com', TRUE, FALSE, 7),
    ('domulderrigf@fotki.com', FALSE, TRUE, 14),
    ('bcroning@github.com', TRUE, FALSE, 1),
    ('mkerseyh@behance.net', FALSE, TRUE, 13),
    ('fselwayi@discuz.net', FALSE, TRUE, 11),
    ('cahrendj@fotki.com', TRUE, FALSE, 9),
    ('tlettucek@com.com', TRUE, FALSE, 17),
    ('ddoughtonl@mozilla.com', FALSE, TRUE, 8),
    ('ajavesm@cam.ac.uk', TRUE, FALSE, 12),
    ('cscarrattn@pbs.org', FALSE, TRUE, 18),
    ('cinchleyo@angelfire.com', FALSE, TRUE, 9),
    ('dkeasyp@wufoo.com', TRUE, FALSE, 1),
    ('pgregolq@goo.gl', FALSE, TRUE, 15),
    ('flaurencer@blogger.com', TRUE, FALSE, 2),
    ('gcraythornes@xing.com', FALSE, TRUE, 8),
    ('vrecordt@sfgate.com', TRUE, FALSE, 7)
;
INSERT INTO `image` (`id`, `picPath`, `id_product`) VALUES
(1, 'product_6_pic_2.jpg', 6),
(2, 'product_30_pic_2.jpg', 30),
(3, 'product_15_pic_2.jpg', 15),
(4, 'product_16_pic_2.jpg', 16),
(5, 'product_16_pic_3.jpg', 16),
(6, 'product_15_pic_3.jpg', 15),
(7, 'product_27_pic_2.jpg', 27),
(8, 'product_20_pic_2.jpg', 20),
(9, 'product_13_pic_2.jpg', 13),
(10, 'product_6_pic_2.jpg', 6),
(11, 'product_4_pic_2.jpg', 4),
(12, 'product_8_pic_2.jpg', 8),
(13, 'product_29_pic_2.jpg', 29),
(14, 'product_12_pic_2.jpg', 12),
(15, 'product_10_pic_2.jpg', 10),
(16, 'product_29_pic_3.jpg', 29),
(17, 'product_8_pic_3.jpg', 8),
(18, 'product_10_pic_3.jpg', 10),
(19, 'product_5_pic_2.jpg', 5),
(20, 'product_24_pic_2.jpg', 24),
(21, 'product_24_pic_3.jpg', 24),
(22, 'product_4_pic_3.jpg', 4),
(23, 'product_21_pic_2.jpg', 21),
(24, 'product_24_pic_4.jpg', 24),
(25, 'product_8_pic_4.jpg', 8),
(26, 'product_2_pic_2.jpeg', 2),
(27, 'product_30_pic_3.jpg', 30),
(28, 'product_18_pic_2.jpg', 18),
(29, 'product_24_pic_5.jpg', 24),
(30, 'product_28_pic_2.jpg', 28);
INSERT INTO `address_type` (`id`, `type`) VALUES
    (1, 'facturation'),
    (2, 'livraison')
;
INSERT INTO user (`id`, `lastName`, `firstName`, `email`, `password`, `gender`, `phone`, `registrationDate`, `isActive`, `id_role`) VALUES
    (1, 'Wayon', 'Anatol', 'awayon0@deliciousdays.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0917848282', '2022-07-28', 1, 1),
    (2, 'Foxwell', 'Jesse', 'jfoxwell1@rakuten.co.jp', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0207367433', '2022-06-27', 1, 1),
    (3, 'Lunck', 'Joannes', 'jlunck2@telegraph.co.uk', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0995520217', '2023-03-15', 1, 1),
    (4, 'Blow', 'Charmine', 'cblow3@youtube.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0142308695', '2022-04-09', 1, 1),
    (5, 'Cockell', 'Melantha', 'mcockell4@about.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0268099382', '2022-09-25', 1, 1),
    (6, 'Geffcock', 'Tybie', 'tgeffcock5@diigo.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0944446893', '2022-09-03', 1, 1),
    (7, 'Mellor', 'Royall', 'rmellor6@weibo.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0376167727', '2023-01-11', 1, 1),
    (8, 'alffy', 'Babita', 'bpalffy7@mashable.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0269671050', '2022-09-27', 1, 1),
    (9, 'Daber', 'Glyn', 'gdaber8@mozilla.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0298592896', '2022-04-19', 1, 1),
    (10, 'Erskine', 'Cristobal', 'cerskine9@intel.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0921068139', '2022-08-06', 1, 1),
    (11, 'Ryce', 'Gale', 'grycea@forbes.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0249273666', '2023-02-17', 1, 1),
    (12, 'Penhaleurack', 'Georgiana', 'gpenhaleurackb@microsoft.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0601745513', '2022-10-12', 0, 1),
    (13, 'Shedden', 'Cesaro', 'csheddenc@miitbeian.gov.cn', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0673669765', '2022-05-07', 1, 1),
    (14, 'Flemming', 'Boycey', 'bflemmingd@dot.gov', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0156893119', '2023-03-20', 0, 1),
    (15, 'Postlewhite', 'Tammy', 'tpostlewhitee@wordpress.org', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0555659671', '2022-05-27', 1, 1),
    (16, 'Clewer', 'Brion', 'bclewerf@phoca.cz', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '7985378277', '2023-01-19', 0, 1),
    (17, 'Slidders', 'Dael', 'dsliddersg@shutterfly.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0452518614', '2022-11-07', 1, 1),
    (18, 'Rosel', 'Blinny', 'broselh@ucoz.ru', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '6404075325', '2022-08-30', 1, 1),
    (19, 'O\'Day', 'Mace', 'modayi@huffingtonpost.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0238709373', '2022-05-06', 0, 1),
    (20, 'Perchard', 'Netti', 'nperchardj@geocities.com', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'Mme.', '0748474157', '2022-11-09', 1, 1),
    (21, 'Test (C)', 'Compte Test (C)', 'cli@test.fr', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0123456789', '2023-04-04', 1, 1),
    (22, 'Test (V)', 'Compte Test (V)', 'ven@test.fr', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0123456789', '2023-04-04', 1, 729),
    (23, 'Test (A)', 'Compte Test (A)', 'adm@test.fr', '$2a$10$mh7EdI9i8Gk8z9xKR0da6em/GSl7/n5RLrJOKqlUbtigpKTlp2Ztm', 'M.', '0123456789', '2023-04-04', 1, 183)
;
INSERT INTO `address` (`id`, `address`, `zipCode`, `city`, `id_user`, `id_address_type`) VALUES
    (1, '028 Debra Point', 64520, 'Zhoukou', 11, 2),
    (2, '94749 Sherman Avenue', 54123, 'Uničov', 15, 2),
    (3, '12777 North Point', 5381, 'Concepción', 15, 1),
    (4, '41500 Banding Road', 77290, 'Steinkjer', 11, 1),
    (5, '2 Hauk Street', 61205, 'Penhascoso', 21, 1),
    (6, '183 Gerald Plaza', 31050, 'Diamante', 13, 1),
    (7, '1 Summer Ridge Center', 45200, 'Tungdor', 17, 1),
    (8, '372 Mifflin Court', 84210, 'San Isidro', 9, 2),
    (9, '50 Washington Alley', 45200, 'Saurimo', 14, 2),
    (10, '4 Warrior Plaza', 32187, 'Giebultów', 21, 2),
    (11, '9644 Killdeer Point', 54100, 'Stockholm', 16, 1),
    (12, '667 Hermina Trail', 20140, 'Tororo', 18, 2),
    (13, '8 Sycamore Circle', 73939, 'Lučina', 9, 2),
    (14, '930 Swallow Plaza', 43384, 'Jaworze', 16, 2),
    (15, '7 Meadow Ridge Place', 74500, 'Sidi Smaïl', 10, 2),
    (16, '7243 Cambridge Court', 45000, 'Victoriaville', 1, 2),
    (17, '4 Kinsman Drive', 56301, 'Strážná', 5, 2),
    (18, '53 Pleasure Pass', 78500, 'Tallinn', 4, 1),
    (19, '83095 Swallow Point', 11440, 'Ja Ela', 12, 2),
    (20, '61716 Columbus Avenue', 60230, 'Stepojevac', 4, 2)
;

INSERT INTO address_ledger (address, zipCode, city) VALUES
    ('913 Elka Way', '22304', 'Lannion'),
    ('1 Delladonna Lane', '76069', 'Le Havre'),
    ('28502 Service Place', '93321', 'Aubervilliers'),
    ('99 Bluestem Plaza', '41919', 'Blois'),
    ('21 Bonner Trail', '15104', 'Saint-Flour'),
    ('977 Bultman Plaza', '84404', 'Apt'),
    ('7 Lerdahl Place', '45969', 'Orléans'),
    ('2475 Kim Hill', '42045', 'Saint-Étienne'),
    ('109 High Crossing Junction', '13155', 'Tarascon'),
    ('78 Riverside Place', '47555', 'Boé'),
    ('11 Summer Ridge Lane', '91194', 'Gif-sur-Yvette'),
    ('8 Grim Street', '94174', 'Le Perreux-sur-Marne'),
    ('6286 Butterfield Court', '78181', 'Saint-Quentin-en-Yvelines'),
    ('55220 Jenifer Court', '83087', 'Toulon'),
    ('91 Mosinee Hill', '37942', 'Tours'),
    ('2906 Everett Crossing', '41976', 'Blois'),
    ('6058 Annamark Trail', '91304', 'Massy'),
    ('37 Mallard Pass', '20311', 'Ajaccio'),
    ('3 Barby Drive', '60022', 'Beauvais'),
    ('9 Village Green Drive', '84147', 'Montfavet'),
    ('2306 Redwing Street', '14097', 'Caen'),
    ('7343 Helena Lane', '94865', 'Bonneuil-sur-Marne'),
    ('0238 Superior Parkway', '59734', 'Saint-Amand-les-Eaux'),
    ('563 Duke Place', '77554', 'Moissy-Cramayel'),
    ('84647 Algoma Crossing', '75522', 'Paris 11'),
    ('7308 Pine View Plaza', '76069', 'Le Havre'),
    ('2 Fieldstone Road', '80004', 'Amiens'),
    ('3 Autumn Leaf Junction', '69239', 'Lyon'),
    ('77886 Lakeland Center', '07304', 'Tournon-sur-Rhône'),
    ('4 Basil Alley', '13807', 'Istres'),
    ('954 Larry Avenue', '75669', 'Paris 14'),
    ('95821 Hoepker Point', '76404', 'Fécamp'),
    ('63 Clove Avenue', '92762', 'Antony'),
    ('458 Dunning Terrace', '92980', 'Paris La Défense'),
    ('1 Marcy Pass', '87030', 'Limoges'),
    ('035 Comanche Place', '84092', 'Avignon'),
    ('0 American Plaza', '20195', 'Ajaccio'),
    ('952 Sage Hill', '31029', 'Toulouse'),
    ('64 Becker Parkway', '14030', 'Caen'),
    ('73 Continental Alley', '93604', 'Aulnay-sous-Bois')
;
INSERT INTO `status` (`id`, `status`) VALUES
    (1, 'Commande validée'),
    (2, 'En préparation'),
    (3, 'En cours de livraison'),
    (4, 'Commande livrée')
;
INSERT INTO order_list (`id`, `dateOrder`, `totalPrice`, `paymentToken`, `trackingNumber`, `id_user`, `id_address_delivery`, `id_address_billing`, `id_status`) VALUES
    (1, '2022-04-12', 14, '3557901867976722', '5610432730626823', 21, 1, 2, 4)
;
INSERT INTO order_list (`dateOrder`, `totalPrice`, `paymentToken`, `trackingNumber`, `id_user`, `id_address_delivery`, `id_address_billing`, `id_status`) VALUES
    ('2023-04-02', 118, '4844318201321807', '3532330109449589', 17, 3, 4, 4),
    ('2022-09-22', 120, '3543994218346239', '5266586991243110', 10, 5, 6, 4),
    ('2022-04-28', 176, '3547091665388867', '3540743303623447', 21, 7, 8, 4),
    ('2023-03-19', 215, '3574259868175763', '4041375988223086', 10, 9, 10, 4),
    ('2022-05-10', 139, '3553931211364493', '3567268103144871', 16, 11, 12, 4),
    ('2023-02-09', 62, '3588281697971802', '67711815561881491', 15, 13, 14, 4),
    ('2022-10-01', 139, '6376058914343950', '6386376168180706', 16, 15, 16, 4),
    ('2023-01-22', 134, '372301281014136', '4917074435705578', 21, 17, 18, 4),
    ('2022-05-11', 245, '30426252802203', '3535128704487385', 15, 19, 20, 4),
    ('2022-11-22', 297, '5100147996476161', '5602232318051372', 2, 21, 22, 4),
    ('2022-12-10', 121, '3569551211288864', '5204353413548880', 15, 23, 24, 4),
    ('2023-03-27', 15, '3542994142979130', '4844720473755465', 11, 25, 26, 4),
    ('2023-02-26', 232, '3583796958723704', '201817262159381', 21, 27, 28, 3),
    ('2023-01-29', 126, '3569171493774471', '3583191360226423', 9, 29, 30, 4),
    ('2022-04-11', 151, '3536707568936733', '4026427586540095', 4, 31, 32, 4),
    ('2022-12-01', 253, '0604136715241982', '3571495295398809', 13, 33, 34, 4),
    ('2022-12-07', 80, '3568691851086847', '56022314571163543', 9, 35, 36, 4),
    ('2023-03-11', 274, '201878262465434', '5020408360967681', 18, 37, 38, 4),
    ('2022-12-21', 285, '3544675101350235', '3551108966809996', 13, 39, 40, 4)
;
INSERT INTO order_product (price, quantity, id_product, id_order) VALUES
    ('15,25', 2, 18, 13),
    ('46,98', 1, 11, 13),
    ('14,67', 2, 11, 15),
    ('42,51', 1, 6, 3),
    ('43,71', 1, 22, 3),
    ('45,91', 2, 12, 12),
    ('24,54', 2, 7, 19),
    ('14,68', 2, 9, 15),
    ('38,68', 2, 19, 11),
    ('26,76', 2, 4, 3),
    ('20,02', 1, 11, 1),
    ('48,69', 2, 5, 9),
    ('20,22', 2, 22, 20),
    ('29,80', 1, 16, 15),
    ('15,55', 2, 28, 7),
    ('15,81', 2, 28, 2),
    ('42,65', 2, 5, 5),
    ('49,95', 1, 25, 14),
    ('35,15', 2, 1, 3),
    ('25,43', 1, 4, 9),
    ('11,95', 2, 26, 6),
    ('26,87', 1, 4, 2),
    ('26,59', 2, 26, 5),
    ('29,77', 1, 28, 13),
    ('42,78', 2, 30, 6),
    ('13,57', 2, 9, 5),
    ('19,21', 2, 6, 15),
    ('13,76', 1, 20, 9),
    ('29,30', 2, 26, 15),
    ('21,24', 1, 19, 11)
;
INSERT INTO review (content, stars, id_product, id_user) VALUES
    ('Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 2, 27, 10),
    ('Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 4, 20, 7),
    ('Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 3, 26, 14),
    ('Morbi ut odio.', 3, 24, 12),
    ('Fusce consequat.', 1, 4, 1),
    ('Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae , Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 2, 30, 8),
    ('Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae , Duis faucibus accumsan odio.', 1, 22, 7),
    ('Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 1, 30, 1),
    ('Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 3, 21, 9),
    ('Morbi ut odio.', 5, 30, 1),
    ('Nullam varius.', 1, 6, 6),
    ('Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 5, 24, 4),
    ('Sed sagittis.', 4, 3, 1),
    ('Morbi porttitor lorem id ligula.', 1, 26, 12),
    ('Quisque ut erat.', 3, 6, 13),
    ('Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 3, 27, 5),
    ('Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 4, 22, 9),
    ('In est risus, auctor sed, tristique in, tempus sit amet, sem.', 5, 29, 9),
    ('Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae , Duis faucibus accumsan odio. Curabitur convallis.', 3, 9, 16),
    ('Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 3, 14, 18)
;
INSERT INTO stock (quantity, id_product) VALUES
    (346, 18),
    (370, 29),
    (213, 10),
    (112, 25),
    (348, 28),
    (360, 14),
    (177, 24),
    (76, 27),
    (77, 11),
    (234, 17),
    (283, 8),
    (281, 6),
    (310, 23),
    (165, 9),
    (346, 30),
    (98, 16),
    (286, 22),
    (279, 5),
    (147, 21),
    (72, 26),
    (362, 7),
    (120, 1),
    (188, 4),
    (163, 12),
    (345, 2),
    (305, 20),
    (254, 3),
    (313, 13),
    (336, 15),
    (156, 19)
;
INSERT INTO discount (startDate, endDate, percent, voucher) VALUES 
    ('2022-01-12', '2022-02-02', 0.8, 'Doubtfull22'),
    ('2022-04-25', '2022-05-12', 0.9, 'jeSuisReduc10'),
    ('2022-06-12', '2022-07-20', 0.8, 'olé2022'),
    ('2022-02-11', '2022-03-11', 0.8, 'fun22'),
    ('2023-04-10', '2023-04-25', 0.8, null)
;
INSERT INTO product_discount (id_product, id_discount) VALUES 
    (2,2),
    (12,2),
    (23,1),
    (7,3),
    (4,2),
    (5,4)
;

DELIMITER //

create trigger stockReturn 
before delete on order_product
for each row
BEGIN
DECLARE sum int;
DECLARE qty1 int;
DECLARE qty2 int;
SELECT quantity FROM order_product WHERE id=old.id into qty1;
SELECT quantity FROM stock WHERE id_product = old.id_product into qty2;
SET sum = qty1 + qty2;
UPDATE stock SET quantity = sum WHERE stock.id_product = old.id_product;
END //

DELIMITER ;

DELIMITER //
create trigger delete_order_product
after delete on order_list
for each row
BEGIN
  DELETE FROM order_product WHERE order_product.id_order is null;
END //

DELIMITER ;

DELIMITER //
create trigger delete_order_product
after delete on order_list
for each row
BEGIN
  DELETE FROM order_product WHERE order_product.id_order is null;
END //

DELIMITER ;
DELIMITER //

create trigger stockReturn 
before delete on order_product
for each row
BEGIN
DECLARE sum int;
DECLARE qty1 int;
DECLARE qty2 int;
SELECT quantity FROM order_product WHERE id=old.id into qty1;
SELECT quantity FROM stock WHERE id_product = old.id_product into qty2;
SET sum = qty1 + qty2;
UPDATE stock SET quantity = sum WHERE stock.id_product = old.id_product;
END //

DELIMITER ;
DELIMITER //

create trigger stockManager 
after insert on order_product
for each row
BEGIN
DECLARE sum int;
DECLARE qty1 int;
DECLARE qty2 int;
SELECT quantity FROM order_product WHERE id=new.id into qty1;
SELECT quantity FROM stock WHERE id_product = new.id_product into qty2;
SET sum = qty2 - qty1;
UPDATE stock SET quantity = sum WHERE stock.id_product = new.id_product;
END //

DELIMITER ;
