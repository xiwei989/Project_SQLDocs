	-- insert values into baseuser table
INSERT INTO BASEUSER (Email, Password, Fname, Lname, is_active, is_staff, is_superuser,last_login) VALUES 
('admin1@handmade.com', 'adminpassword1', 'Admin1', 'Admin1', 1, 1, 0, null),
('admin2@handmade.com', 'adminpassword2', 'Admin2', 'Admin2', 1, 1, 0,null),
('admin3@handmade.com', 'adminpassword3', 'Admin3', 'Admin3', 1, 1, 0, null),
('admin4@handmade.com', 'adminpassword4', 'Admin4', 'Admin4', 1, 1, 0,null),
('admin5@handmade.com', 'adminpassword5', 'Admin5', 'Admin5', 1, 1, 0, null),
('admin6@handmade.com', 'adminpassword6', 'Admin6', 'Admin6', 1, 1, 0,null),
('admin7@handmade.com', 'adminpassword7', 'Admin7', 'Admin7', 1, 1, 0, null),
('mike1@gmail.com', '1234', 'Mike', 'AB', 1, 0, 0,null),
('hook1@outlook.com', '1234', 'Alice', 'KK', 1, 0, 0,null),
('harry@hogwarts.com', '1234', 'Harry', 'Potter', 1, 0, 0, null),
('ron@hogwarts.com', '1234', 'Ron', 'Weasley', 1, 0, 0, null),
('hermione@hogwarts.com', '123456', 'Granger', 'hgranger', 1, 0, 0, null),
('draco@hogwarts.com', '123456', 'Draco', 'Malfoy', 1, 0, 0, null),
('luna@hogwarts.com', '123456', 'Luna', 'Lovegood', 1, 0, 0, null);

-- insert into adminuser table
INSERT INTO ADMINUSER (base_user_id) VALUES
((SELECT UserID FROM BASEUSER WHERE Email = 'admin1@handmade.com')),
((SELECT UserID FROM BASEUSER WHERE Email = 'admin2@handmade.com')),
((SELECT UserID FROM BASEUSER WHERE Email = 'admin3@handmade.com')),
((SELECT UserID FROM BASEUSER WHERE Email = 'admin4@handmade.com')),
((SELECT UserID FROM BASEUSER WHERE Email = 'admin5@handmade.com')),
((SELECT UserID FROM BASEUSER WHERE Email = 'admin6@handmade.com')),
((SELECT UserID FROM BASEUSER WHERE Email = 'admin7@handmade.com'));

-- insert into normaluser table
-- ALTER TABLE NORMALUSER MODIFY COLUMN is_superuser BOOLEAN NOT NULL DEFAULT 0;

-- insert values into normaluser table (normal user's id starts with '2') 
INSERT INTO NORMALUSER (base_user_id, Username, DefaultAddressID, Phone, Rate, ManageID) VALUES
((SELECT UserID FROM BASEUSER WHERE Email = 'mike1@gmail.com'), 'mike123', 1, '1234567890', 0.0, 1),
((SELECT UserID FROM BASEUSER WHERE Email = 'hook1@outlook.com'), 'hope123', 2, '1234567890', 0.0, 1),
((SELECT UserID FROM BASEUSER WHERE Email = 'harry@hogwarts.com'), 'magic123', 3, '1234567890', 0.0, 1),
((SELECT UserID FROM BASEUSER WHERE Email = 'ron@hogwarts.com'), 'magic456', 4, '2345678901', 0.0, 1),
((SELECT UserID FROM BASEUSER WHERE Email = 'hermione@hogwarts.com'), 'magic789', 5, '3456789012', 0.0, 1),
((SELECT UserID FROM BASEUSER WHERE Email = 'draco@hogwarts.com'), 'magic901', 6, '4567890123', 0.0, 1),
((SELECT UserID FROM BASEUSER WHERE Email = 'luna@hogwarts.com'), 'magic345', 7, '7890123456', 0.0, 1);

-- insert values into report table
INSERT INTO REPORT (FilePath, UpdateDate) VALUES
('/reports/report01.pdf', null),
('/reports/report02.pdf', null),
('/reports/report03.pdf',  null),
('/reports/report04.pdf', null),
('/reports/report05.pdf', null),
('/reports/report06.pdf', null),
('/reports/report07.pdf', null);
-- when update a report, update the value of 'UpdateDate' column
update report 
set updatedate = curdate()
where ReportID = 1;

-- insert values into generates table
INSERT INTO GENERATES (UserID, ReportID, GenerateDate) VALUES
(1, 1, '2024-01-02'),
(2, 2, '2024-01-02'),
(3, 3, '2024-02-02'),
(4, 4, '2024-02-16'),
(5, 5, '2024-03-02'),
(6, 6, '2024-03-16'),
(7, 7, '2024-04-02');

-- insert values into address table 
INSERT INTO ADDRESS (Fname, Lname, UserID, Street, StreetOptional, City, State, Zipcode) VALUES
('Mike', 'AB', 1, '4 Privet Drive', null, 'Little Whinging', 'Surrey', '12345'),
('Alice', 'KK', 2, 'The Burrow', null, 'Ottery St Catchpole', 'Devon', '23456'),
('Harry', 'Potter', 3, 'Hogwarts Castle', 'Room 11', 'Hogsmeade', 'Highlands', '34567'),
('Ron', 'Weasley', 4, 'Malfoy Manor', null, 'Wiltshire', null, '45678'),
('Granger', 'hgranger', 5, 'Lovegood House', null, 'Near Ottery St Catchpole', 'Devon', '56789'),
('Draco', 'Malfoy', 6, 'Longbottom House', null, 'London', null, '67890'),
('Luna', 'Lovegood', 7, 'Weasley’s Wizard Wheezes', null, 'Diagon Alley', 'London', '78901'),
('Luna', 'Lovegood', 7, '7224 Ohio St.', null, 'Deer Park', 'NY', '11729'),
('Luna', 'Lovegood', 7, '243 James Court', null, 'Oak Park', 'MI', '48237');

-- insert values into category table 
INSERT INTO CATEGORY (CategoryID, CName, Description) VALUES
(1, 'Ceramics and Glass', 'Hand crafts made with ceramics or glasses.'),
(2, 'Paper Crafts', 'Hand crafts made with paper, such as orgami.'),
(3, 'Yarn and Fiber Crafts', 'Hand knitted crafts such as crochet artwork.'),
(4, 'Upcycling Crafts', 'Eco-friendly handicrafts made from recycled waste'),
(5, 'Decorative Crafts', 'Crafts whose aim is the design and manufacture of objects that are both beautiful and functional.'),
(6, 'Fashion Crafts', 'Handmade clothing, jewelry and other fashion products.'),
(7, 'Miscellaneous Crafts', 'Other handicrafts that cannot be classified into the above categories.');

-- insert values into products table
INSERT INTO PRODUCTS (SellerID, Name, CategoryID, Description, StartPrice, PictureID, PostDate, Status, Inventory, ManageID) VALUES
(1, 'Stained Glass Flowers', 1, 'Stained glass flowers inspired by beautiful fall foliage', 20.0, 1, '2024-01-01', 'Active', 10, 1),
(1, 'Blue Butterfly Lady', 1, 'Stained glass artwork', 30.0, 2, '2024-02-01', 'Active', 5, 1),
(1, 'Bird Brooch', 1, 'Blue Heritage handmade ceramic floral Bird Brooch', 19.0, 3, '2024-02-01', 'Active', 30, 1),
(2, 'Sunflower Butterflies', 2, '9 inch Sunflower Butterflies', 5.0, 4, '2024-02-05', 'Active', 100, 1),
(3, 'Bunny', 3, 'Crochet Bunny Rabbit', 10.0, 5, '2024-02-05', 'Active', 4, 1),
(3, 'Teddy Bear', 3, 'Classic Crochet Teddy Bear', 15.0, 8, '2024-02-10', 'Active', 5, 1),
(4, 'Silk Scarf', 5, 'Gold Dust Wildflower Silk Scarf', 48.0, 9, '2024-03-01', 'Active', 3, 1),
(4, 'Pink Scarf', 5, 'Kalee Handwoven Scarf', 35.0, 10, '2024-03-10', 'Active', 10, 1);

-- insert values into pictures table
INSERT INTO PICTURES (ProductID, Picture) VALUES
(1, 'https://i.etsystatic.com/25421725/r/il/b8ae25/3863459011/il_1588xN.3863459011_glv8.jpg'),
(2, 'https://i.etsystatic.com/6706558/r/il/4d71b6/5080059054/il_1588xN.5080059054_4bgk.jpg'),
(3, 'https://i.etsystatic.com/13026407/r/il/0090ef/3101972265/il_1588xN.3101972265_r8c1.jpg'),
(4, 'https://i.etsystatic.com/37047015/r/il/c29484/4609730318/il_1588xN.4609730318_5wv9.jpg'),
(5, 'https://i.etsystatic.com/15528295/r/il/35c9d7/4225269669/il_1588xN.4225269669_9741.jpg'),
(6, 'https://i.etsystatic.com/17382265/r/il/961ad4/2791862567/il_1588xN.2791862567_o5rk.jpg'),
(6, 'https://i.etsystatic.com/17382265/r/il/961ad4/2791862567/il_1588xN.2791862567_o5rk.jpg'),
(6, 'https://i.etsystatic.com/17382265/r/il/961ad4/2791862567/il_1588xN.2791862567_o5rk.jpg'),
(7, '/images/silk.jpg'),
(8, 'https://i.etsystatic.com/24987188/r/il/54622a/2721384059/il_1588xN.2721384059_e1pd.jpg');

-- insert values into bidding table
INSERT INTO BIDDING (ProductID, BidderId, BidPrice, Quantity, BidDate, ActiveDays, Status, ManageID) VALUES
(1, 7, 25.00, 2, '2024-01-11', 7, 'Pending', 1),
(1, 6, 22.00, 8, '2024-01-16', 7, 'Pending', 1),
(8, 5, 45.00, 2, '2024-03-12', 7, 'Pending', 1),
(2, 4, 40.00, 4, '2024-02-02', 7, 'Pending', 1),
(2, 5, 45.00, 1, '2024-02-16', 7, 'Pending', 1),
(3, 7, 20.00, 2, '2024-03-02', 7, 'Pending', 1),
(5, 7, 11.00, 2, '2024-03-12', 7, 'Pending', 1),
(5, 6, 10.50, 1, '2024-03-12', 7, 'Pending', 1),
(8, 1, 40.0, 1, '2024-03-13', 7, 'Pending', 1),
(8, 7, 40.0, 2, '2024-03-14', 8, 'Pending', 1);

-- insert values into orders table (meanwhile update bidding status)
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES (1, '2024-01-16', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 1;
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES(2, '2024-01-16', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 2;
update products
set status = 'Sold out'
where ProductID = 1;
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES(5, '2024-02-20', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 5;
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES(4, '2024-02-08', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 4;
update products
set status = 'Sold out'
where ProductID = 2;
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES(6, '2024-03-05', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 6;
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES(7, '2024-03-18', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 7;
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES(8, '2024-03-18', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 8;
INSERT INTO ORDERS (BiddingID, OrderDate, OrderStatus, ManageID) VALUES(9, '2024-03-16', 'Pending', 1);
update bidding 
set status = 'Accepted'
where BiddingID = 9;

-- insert values into shipment table (meanwhile update order status)
INSERT INTO SHIPMENT (OrderID, TrackingNumber, AddressID, Status) VALUES (1, 'TRACK123', 7, 'Delivered');
update orders
set orderstatus = 'Delivered'
where OrderID = 1;
INSERT INTO SHIPMENT (OrderID, TrackingNumber, AddressID, Status) VALUES (2, 'TRACK222', 6, 'Delivered');
update orders
set orderstatus = 'Delivered'
where OrderID = 2;
INSERT INTO SHIPMENT (OrderID, TrackingNumber, AddressID, Status) VALUES (3, 'TRACK789', 5, 'Delivered');
update orders
set orderstatus = 'Delivered'
where OrderID = 3;
INSERT INTO SHIPMENT (OrderID, TrackingNumber, AddressID, Status) VALUES (4, 'TRACK012', 4, 'Delivered');
update orders
set orderstatus = 'Delivered'
where OrderID = 4;
INSERT INTO SHIPMENT (OrderID, TrackingNumber, AddressID, Status) VALUES (5, 'TRACK345', 7, 'Delivered');
update orders
set orderstatus = 'Delivered'
where OrderID = 5;
INSERT INTO SHIPMENT (OrderID, TrackingNumber, AddressID, Status) VALUES (6, 'TRACK678', 7, 'Returned');
update orders
set orderstatus = 'Refunded'
where OrderID = 6;
INSERT INTO SHIPMENT (OrderID, TrackingNumber, AddressID, Status) VALUES (7, 'TRACK901', 6, 'Awaiting Shipment');

-- insert values into payment table
INSERT INTO PAYMENT (OrderID, PaymentStatus, PaymentMethod) VALUES
(1, 'Completed', 'Credit/Debit card'),
(2, 'Completed', 'Paypal'),
(3, 'Completed', 'Credit/Debit card'),
(4, 'Completed', 'Paypal'),
(5, 'Completed', 'Credit/Debit card'),
(6, 'Refunded', 'Credit/Debit card'),
(7, 'Completed', 'Paypal');

-- insert values into messages table
INSERT INTO MESSAGES ( AdminSenderID, SenderID, AdminReceiverID, ReceiverID, Content, CreateDate, ProductID, OrderID, SubjectType) VALUES
(1, NULL, NULL, 6, 'You have a new order', '2024-01-01', NULL, 2, 'Order'),
(NULL, 6, 1, NULL, 'Thank you!', '2024-01-02', NULL, 2, 'Order'),
(NULL, 1, NULL, 7, 'Interested in the Stained Glass Flowers?', '2024-01-10', 1, NULL, 'Product'),
(NULL, 7, NULL, 1, 'Yes, is it still available?', '2024-01-10', 1, NULL, 'Product'),
(NULL, 5, NULL, 1, 'Do you have more Stained Glass Flowers in stock?', '2024-01-16', 1, NULL, 'Product'),
(1, NULL, NULL, 7, 'Your order has been shipped.', '2024-01-18', NULL, 1, 'Order'),
(NULL, 7, 1, NULL, 'Thank you for the update!', '2024-01-19', NULL, 1, 'Order');

-- insert values into reviews table
INSERT INTO REVIEWS (ReviewerID, ReviewerType, RevieweeID, Content, ReviewDate, ProductID, OrderID, Rate) VALUES
(7, 'Buyer', 1, 'Great seller, fast delivery.', '2024-01-21', 1, 1, 5.0),
(1, 'Seller', 7, 'Prompt payment, excellent buyer.', '2024-01-21', 1, 1, 5.0),
(6, 'Buyer', 1, 'Item as described, highly recommend.', '2024-02-01', 1, 2, 4.3),
(1, 'Seller', 6, 'Great communication, a pleasure to do business with.', '2024-02-02', 1, 2, 4.5),
(5, 'Buyer', 1, 'Fast shipping, item exactly as described.', '2024-03-10', 2, 3, 4.8),
(7, 'Buyer', 3, 'Had issues with the product, but the seller resolved them quickly.', '2024-04-01', 5, 6, 3.9),
(1, 'Seller', 5, 'Quick payment, highly recommend this buyer.', '2024-03-11', 2, 3, 5.0),
(7, 'Buyer', 2, 'Not in good quality.', '2024-03-20', 3, 5, 3.5);