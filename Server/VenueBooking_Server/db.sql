CREATE DATABASE VB;
use VB;


CREATE TABLE Admin (
	Admin_id INT PRIMARY KEY AUTO_INCREMENT,
  	Admin_name VARCHAR(120),
    	Admin_email VARCHAR(120) UNIQUE,
    	Admin_pass VARCHAR(120)
);

insert into Admin (Admin_name, Admin_email, Admin_pass) values
("admin", "admin@gmail.com", "123");


CREATE TABLE Users (
    	User_id INT PRIMARY KEY AUTO_INCREMENT,
    	User_name VARCHAR(120),
	User_email VARCHAR(120) UNIQUE,
     User_pass VARCHAR(120),
     User_contact VARCHAR(15),
     User_address VARCHAR(256)
);

insert into Users (User_name ,User_email, User_pass , User_contact, User_address )values
("sachin", "sachin@gmail.com", "123", "987654321", "Pune"),
("ruchi", "ruchi@gmail.com", "123", "987654321", "Pune"),
("teja", "teja@gmail.com", "123", "987654321", "Pune"),
("rashmi", "rashmi@gmail.com", "123", "987654321", "Pune");



CREATE TABLE Venues (
     Venue_id INT PRIMARY KEY AUTO_INCREMENT,
     Venue_name VARCHAR(60),
     Venue_description VARCHAR(512),
     Venue_contact VARCHAR(15),
     Venue_address VARCHAR(100),
     Venue_amountPerDay DECIMAL(10,2),
     Venue_image VARCHAR(100)
);

insert into Venues (Venue_name , Venue_description , Venue_contact , Venue_address , Venue_amountPerDay , Venue_image) values 
("Taj Hotel", "The Taj Mahal Palace is a heritage, five-star, luxury hotel in the Colaba area of mumbai", "987654321", "pune", 4000, "3D Destination.jpeg"),
("King Hotel", "King Hotel is a 3-star property located in Palmerston", "987654321", "pune", 5000, "Dutch Palace.jpeg"),
("Radision","Radisson Blu is an international chain of upscale hotels", "987654321", "pune", 6000, "leMeridian3.jpeg"),
("Novotel1","Novotel is a French midscale hotel brand owned by Accor", "987654321", "pune", 9000, "Hotel_Novotel1.jpeg"),
("Vrindavan Garden","Hotel Vrindavan Garden is a good choice for travellers looking for a 3 star hotel in pune", "985654321", "pune", 10000, "Vrindavan Garden .jpeg");



CREATE TABLE Services (
     Service_id INT PRIMARY KEY AUTO_INCREMENT,
     Service_name VARCHAR(60)  
);

insert into Services (Service_name) values
("Catering"),
("Decoration"), 
("Transportation"),
("Sound System"),
("Photography"); 


CREATE TABLE VenueServices (
	Venue_id INT,
	Service_id INT,
     Service_amount DECIMAL(10,2),
     PRIMARY KEY (Venue_id, Service_id),
	FOREIGN KEY (Venue_id ) REFERENCES Venues(Venue_id )ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Service_id) REFERENCES Services(Service_id)ON DELETE CASCADE ON UPDATE CASCADE	
);

-- if we enter duplicate Service_id with a  Venue_id

insert into VenueServices values
(1,1,5000),
(1,2,1000),
(1,3,2000);





CREATE TABLE VenueBookings (
    VenueBooking_id INT PRIMARY KEY AUTO_INCREMENT,
    User_id INT,
    Venue_id INT,
    Total_amount DECIMAL(10,2),
    Start_date Date,
    End_date Date,
    FOREIGN KEY (User_id) REFERENCES Users(User_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Venue_id) REFERENCES Venues(Venue_id) ON DELETE CASCADE ON UPDATE CASCADE
);




CREATE TABLE VenueBookedServices (
    VenueBookedService_id INT PRIMARY KEY AUTO_INCREMENT,
    VenueBooking_id INT,
    Service_id INT,
    FOREIGN KEY (VenueBooking_id) REFERENCES VenueBookings(VenueBooking_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Service_id) REFERENCES Services(Service_id) ON DELETE CASCADE ON UPDATE CASCADE
);


