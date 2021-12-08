/*Create a database*/
CREATE DATABASE zomato_order;

/*Use the database*/
USE zomato_order;


/*Create the customer_t table*/
CREATE TABLE customer_t (
customer_id int(11) not null AUTO_INCREMENT,
first_name varchar(50) not null,
last_name varchar(50),
email_id varchar(40) not null,
address varchar(200) not null,
phone_number varchar(30) not null,
CONSTRAINT customer_pk PRIMARY KEY (customer_id))
ENGINE = INNODB;



/*Create the subscriptions_T table*/
CREATE TABLE subscriptions_T (
subscription_id int(11) not null AUTO_INCREMENT,
date_placed date not null,
date_validity date not null,
cost double not null,
subscription_name varchar(100) not null,
customer_id int (11),
CONSTRAINT subscriptions_pk PRIMARY KEY (subscription_id),
CONSTRAINT subscriptions_fk FOREIGN KEY (customer_id) REFERENCES customer_t (customer_id) 
ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE = INNODB;


/*Create the customer_support_t table*/
CREATE TABLE customer_support_t (
query_id int(11) not null AUTO_INCREMENT,
customer_executive_id int(11) not null,
email_id varchar(40) not null,
query_description varchar(1000) not null,
resolution_status varchar(40) not null,
CONSTRAINT customer_support_pk PRIMARY KEY (query_id))
ENGINE = INNODB;


/*Create the customer_query_t table*/
CREATE TABLE customer_query_t (
query_id int(11),
customer_id int (11),
resolution_Date date not null,
CONSTRAINT customer_query_pk PRIMARY KEY (query_id, customer_id),
CONSTRAINT customer_query_fk1 FOREIGN KEY (query_id) REFERENCES customer_support_t (query_id) 
ON UPDATE CASCADE,
CONSTRAINT customer_query_fk2 FOREIGN KEY (customer_id) REFERENCES customer_t (customer_id) 
ON DELETE CASCADE)
ENGINE = INNODB;


/*Create the delivery table*/
CREATE TABLE delivery_t (
delivery_id int(11) not null AUTO_INCREMENT,
first_name varchar(50) not null,
last_name varchar(50) ,
phone_number varchar(30) not null,
delivery_time datetime not null,
CONSTRAINT delivery_pk PRIMARY KEY (delivery_id))
ENGINE = INNODB;


/*Create the order table*/
CREATE TABLE order_t (
order_id int(11) not null AUTO_INCREMENT,
order_date date NOT NULL,
order_price double NOT NULL,
customer_id int(11),
delivery_id int(11),
CONSTRAINT order_pk PRIMARY KEY (order_id),
CONSTRAINT order_fk1 FOREIGN KEY (delivery_id) REFERENCES delivery_t (delivery_id) 
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT order_fk2 FOREIGN KEY (customer_id) REFERENCES customer_t (customer_id) 
ON DELETE CASCADE)
ENGINE = INNODB;

/*Create the order details table*/
CREATE TABLE order_details_t (
order_id int(11) NOT NULL,
order_details varchar(200) NOT NULL,
CONSTRAINT order_detail_fk FOREIGN KEY (order_id) REFERENCES order_t (order_id) 
ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE = INNODB;




/*Create the payment_t table*/
CREATE TABLE payment_t (
payment_id int(11),
cost double not null,
payment_type varchar(100)  not null,
customer_id  int(11),
order_id  int(11),
CONSTRAINT payment_pk PRIMARY KEY (payment_id),
CONSTRAINT payment_fk1 FOREIGN KEY (order_id) REFERENCES order_t (order_id) 
ON UPDATE CASCADE,
CONSTRAINT payment_fk2 FOREIGN KEY (customer_id) REFERENCES customer_t (customer_id) 
ON DELETE CASCADE)
ENGINE = INNODB;


/*Create the notification_t table*/
CREATE TABLE notification_t (
message varchar(100)  not null,
customer_id  int(11),
CONSTRAINT notification_pk PRIMARY KEY (message,customer_id),
CONSTRAINT notification_fk FOREIGN KEY (customer_id) REFERENCES customer_t (customer_id) 
ON DELETE CASCADE)
ENGINE = INNODB;

/*insert into customer_t*/
INSERT INTO customer_t (customer_id, first_name, last_name, email_id, address, phone_number) VALUES
(115, 'John', 'Doe','john@gmail.com', '200 Maple Street, Indiranagar, Bangalore 560008,India','455-908-6781'),
(101, 'Bill', 'Doll', 'bill@gmail.com','300 West,Indiranagar, Bangalore 560008,India','455-920-6782'),
(102, 'Karthik', 'Turburn','karthik@gmail.com', '250 North, Indiranagar, Bangalore 560008,India','455-921-6739'),
(103, 'Mary', 'Lee', 'mary@gmail.com','200 South, Indiranagar, Bangalore 560008,India','455-908-6811'),
(104, 'Jane', 'Smith','jane@gmail.com', '120 University, MG Road, Mumbai 762112,India','455-908-6900'),
(105, 'Vincent', 'Smith','vincent@gmail.com', '200 Maple, MG Road, Mumbai 762112,India','455-908-6814'),
(106, 'David', 'Brown','david@gmail.com', '300 West, MG Road, Mumbai 762112,India','455-908-6888'),
(107, 'Carl', 'Smith','carl@gmail.com', '250 North, MG Road, Mumbai 762112,India','455-908-6670'),
(108, 'John', 'Doll', 'doll@gmail.com','200 South, MG Road, Mumbai 762112,India','455-908-6123'),
(109, 'Jim', 'Chris', 'chris@gmail.com','120 University, Castle Road, Hyderabad 87102,India','455-908-6321'),
(110, 'Joyce', 'French','joyce@gmail.com', '200 Main, Castle Road, Hyderabad 87102,India','455-908-6456'),
(111, 'Manav', 'English','manav@gmail.com', '250 State, Castle Road, Hyderabad 87102,India','455-908-6653'),
(112, 'Tom', 'Borg','jtom@gmail.com', '3000 Sunset, Castle Road, Hyderabad 87102,India','455-908-6654'),
(113, 'Donald', 'Thomas','donald@gmail.com', '1200 Hollywood,Majestic Road, Delhi 87123,India','455-908-6546'),
(114, 'Vishwas', 'Borg','vishwas@gmail.com', '100 College,Majestic Road, Delhi 87123,India','455-908-6711'),
(116, 'Brandon', 'French','bran@gmail.com', '200 Main, Windtunnel Road, Chennai 76112,India','455-908-6712'),
(117, 'Victor', 'English','voctor@gmail.com', '250 State, Windtunnel Road, Chennai 76112,India','455-908-67713'),
(118, 'Alice', 'Borg','alice@gmail.com', '3000 Sunset, Windtunnel Road, Chennai 76112,India','455-908-6715'),
(119, 'Margaret', 'Thomas','amrg@gmail.com', '1200 Hollywood,Windtunnel Road, Chennai 76112,India','455-908-6714'),
(120, 'Aston', 'Borg','aston@gmail.com', '100 College,Windtunnel Road, Chennai 76112,India','455-908-6717'),
(121, 'Joel', 'French','joel@gmail.com', '200 Main, Brigade Road, Kolkata 88111,India','455-908-6811'),
(122, 'Robert', 'English','robert@gmail.com', '250 State, Brigade Road, Kolkata 88111,India','455-908-6812'),
(123, 'Leonardo', 'Borg','leo@gmail.com', '3000 Sunset,Brigade Road, Kolkata 88111,India','455-908-6813'),
(124, 'Bruce', 'Thomas','bruce@gmail.com', '1200 Hollywood,Brigade Road, Kolkata 88111,India','455-908-6814'),
(125, 'Shawn', 'Borg','shawn@gmail.com', '100 College,Brigade Road, Kolkata 88111,India','455-908-6815');

/*insert into subscriptions_t*/
INSERT INTO subscriptions_t (subscription_id, date_placed, date_validity, cost, subscription_name, customer_id) VALUES
(501, '2020-10-24','2021-01-23','300','Zomato Pro','101'),
(502,  '2020-09-23','2020-12-22','300','Zomato Pro','102'),
(503,  '2020-08-22','2020-11-21','300','Zomato Pro','103'),
(504,  '2020-07-21','2020-10-20','300','Zomato Pro','104'),
(505,  '2020-06-20','2020-09-19','300','Zomato Pro','105'),
(515,  '2020-05-19','2020-08-18','300','Zomato Pro','106'),
(506,  '2020-04-18','2020-07-17','300','Zomato Pro','107'),
(507,  '2020-03-17','2020-06-16','300','Zomato Pro','108'),
(508,  '2020-02-16','2020-05-15','300','Zomato Pro','109'),
(509,  '2020-01-15','2020-04-14','300','Zomato Pro','110'),
(510,  '2020-11-14','2021-02-13','300','Zomato Pro','111'),
(511, '2020-12-13','2021-03-12','300','Zomato Pro','112'),
(512, '2021-01-12','2021-04-11','300','Zomato Pro','113'),
(513, '2021-02-11','2021-05-10','300','Zomato Pro','114'),
(514, '2021-03-10','2021-06-09','300','Zomato Pro','115'),

(516,  '2019-11-14','2020-02-13','500','Zomato Pro','116'),
(517, '2019-12-13','2020-03-12','500','Zomato Pro','117'),
(518, '2019-01-12','2019-04-11','500','Zomato Pro','118'),
(519, '2019-02-11','2019-05-10','500','Zomato Pro','119'),
(520, '2019-03-10','2019-06-09','500','Zomato Pro','120'),

(521,  '2018-11-14','2019-02-13','400','Zomato Pro','121'),
(522, '2018-12-13','2019-03-12','400','Zomato Pro','122'),
(523, '2018-01-12','2018-04-11','400','Zomato Pro','123'),
(524, '2018-02-11','2018-05-10','400','Zomato Pro','124'),
(525, '2018-03-10','2018-06-09','400','Zomato Pro','125');




/*insert into customer_support_t*/
INSERT INTO customer_support_t (query_id, customer_executive_id, query_description, resolution_status) VALUES
(601, '901','Unable to do payment ','In Progress'),
(602, '902','Unable to add items to cart ','In Progress'),
(603, '903','Unable to do add subscription ','In Progress'),
(604,  '904','Need more info aboyt payment options ','In Progress'),
(605,  '905','Zomato offers on varioursfood items in restaurants','In Progress'),
(615,  '906','Restaurant offers in specific location','Closed'),
(606,  '907','Unable to order food','Closed'),
(607,  '908','Zomato subscription page not loading','Closed'),
(608,  '909','Techincal error is appering on adding to cart','Closed'),
(609, '910','Need more information on offers during festival','Closed'),
(610,  '911','customer_support@zomato.com','Did not get the order despite ordered 2 hours ago','Closed'),
(611, '912','Not happy with the food delivered. Need refund','Escalated'),
(612, '913','Unable to reach the delivery person','Escalated'),
(613, '914','Restaurant is not allowing to reserve the table','In Progress'),
(614, '915','Order contains fewer items than what was ordered','Escalated'),
(623, '916','Unable to get subscription activated','Escalated'),
(616, '917','Offer for onlibe delivery of pizza','CLosed'),
(617, '918','Any more subscriptions in the future','CLosed'),
(618, '919','How to enroll as a vendor for zomato','CLosed'),
(619, '920','Not happy with food quality','In Progress'),
(620, '921','How much is the maximum discount using subscription','CLosed'),
(621, '922','When is the valididty ending for subscription','CLosed'),
(622, '923','Can zomato update the validity of subscription','CLosed'),
(624, '924','Does zomato deliver during late night hours','CLosed'),
(625, '925','What is the last order time for meals','CLosed');


/*insert into customer_query_t*/
INSERT INTO customer_query_t (query_id, customer_id,resolution_Date) VALUES
(601, '101','2021-03-10'),
(602, '101','2021-02-10'),
(603, '101','2021-01-11'),
(604, '101','2021-04-13'),
(605, '101','2021-01-01'),
(606, '101','2021-04-10'),


(607, '102','2020-03-10'),
(608, '102','2020-02-10'),
(609, '103','2020-01-11'),
(610, '104','2020-04-13'),
(611, '105','2020-01-01'),
(612, '106','2020-04-10'),

(613, '107','2019-03-10'),
(614, '108','2019-02-10'),
(615, '109','2019-01-11'),
(616, '110','2019-04-13'),
(617, '111','2019-08-01'),
(618, '112','2019-12-10'),

(619, '113','2018-03-10'),
(620, '114','2018-02-10'),
(621, '115','2018-01-11'),
(622, '116','2018-10-13'),
(623, '117','2018-09-01'),
(624, '118','2018-07-10'),
(625, '125','2018-06-10');

/*insert into payment_t*/
INSERT INTO payment_t (payment_id, cost,payment_type,customer_id,order_id) VALUES
(301, '200','Credit Card','101','201'),
(302, '300','Credit Card','102','202'),
(303, '200','Credit Card','103','203'),
(304, '400','Credit Card','104','204'),
(305, '500','Credit Card','105','205'),

(306, '200','Credit Card','106','206'),
(307, '300','Credit Card','107','207'),
(308, '200','Credit Card','108','208'),
(309, '400','Credit Card','109','209'),
(310, '500','Credit Card','110','210'),

(311, '200','Credit Card','111','211'),
(312, '300','Credit Card','112','212'),
(313, '200','Credit Card','113','213'),
(314, '400','Credit Card','114','214'),
(315, '500','Credit Card','115','215'),


(316, '200','Debit Card','116','216'),
(317, '300','Debit Card','117','217'),
(318, '200','Debit Card','118','218'),
(319, '400','Debit Card','119','219'),
(320, '500','Debit Card','120','220'),


(321, '200','Debit Card','121','221'),
(322, '300','Debit Card','122','222'),
(323, '200','Debit Card','123','223'),
(324, '400','Debit Card','124','224'),
(325, '500','Debit Card','125','225'),

(326, '200','Debit Card','101','226'),
(327, '300','Debit Card','102','227'),
(328, '200','Debit Card','103','228'),
(329, '400','Debit Card','104','229'),
(330, '500','Debit Card','105','230'),



(331, '200','Google Pay','106','231'),
(332, '300','Google Pay','107','232'),
(333, '200','Google Pay','108','233'),
(334, '400','Google Pay','109','234'),
(335, '500','Google Pay','110','235'),

(336, '200','Cash On Delivery + Zomato Wallet','111','236'),
(337, '300','Cash On Delivery + Zomato Wallet','112','237'),
(338, '200','Cash On Delivery + Zomato Wallety','113','238'),
(339, '400','Cash On Delivery + Zomato Wallet','114','239'),
(340, '500','Cash On Delivery + Zomato Wallet','115','240'),

(341, '200','Credit Card + Zomato Wallet','116','241'),
(342, '300','Credit Card + Zomato Wallet','117','242'),
(343, '200','Credit Card + Zomato Wallet','118','243'),
(344, '400','Credit Card + Zomato Wallet','119','244'),
(345, '500','Credit Card + Zomato Wallet','120','245'),

(346, '200','Debit Card + Zomato Wallet','121','246'),
(347, '300','Debit Card + Zomato Wallet','122','247'),
(348, '200','Debit Card + Zomato Wallety','123','248'),
(349, '400','Debit Card + Zomato Wallet','124','249'),
(350, '500','Debit Card + Zomato Wallet','125','250'),

(351, '200','Cash On Delivery','101','251'),
(352, '600','Cash On Delivery','102','252'),
(353, '700','Cash On Delivery','103','253'),
(354, '800','Cash On Delivery','104','254'),
(355, '140','Cash On Delivery','105','255'),
(356, '200','Cash On Delivery','106','256'),
(357, '356','Cash On Delivery','107','257'),
(358, '782','Cash On Delivery','108','258'),
(359, '119','Cash On Delivery','109','259'),
(360, '194','Cash On Delivery','110','260'),

(361, '200','Cash On Delivery','111','261'),
(362, '600','Cash On Delivery','112','262'),
(363, '700','Cash On Delivery','113','263'),
(364, '800','Cash On Delivery','114','264'),
(365, '140','Cash On Delivery','115','265');

/*insert into notification_t*/
INSERT INTO notification_t (message, customer_id) VALUES
('Half Price Offer starts tonight','101'),
('Weekend Offer on Pizzas!!!!!','102'),
('Zomato Pro to cost 10% less!!!!','103'),
('Book a Restaurant table today and get 25% discount','104'),
('Mandarin is now offering a Full course meal at 50% price today','105'),

('Zomato pro validity is not extended to 4 months','106'),
('Burgers at Burger king to cost less from tomorrow','107'),
('Biryani zone is now at your nearest location!!!!','108'),

('Half Price Offer starts tonight','109'),
('Weekend Offer on Pizzas!!!!!','110'),
('Zomato Pro to cost 10% less!!!!','111'),
('Book a Restaurant table today and get 25% discount','112'),
('Mandarin is now offering a Full course meal at 50% price today','113'),

('Zomato pro validity is not extended to 4 months','114'),
('Burgers at Burger king to cost less from tomorrow','115'),
('Biryani zone is now at your nearest location!!!!','116'),

('Half Price Offer starts tonight','117'),
('Weekend Offer on Pizzas!!!!!','118'),
('Zomato Pro to cost 10% less!!!!','119'),
('Book a Restaurant table today and get 25% discount','120');

