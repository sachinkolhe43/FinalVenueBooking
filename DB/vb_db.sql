create database vb;
use vb;


CREATE TABLE Admin (
	Admin_id INT PRIMARY KEY AUTO_INCREMENT,
  	Admin_name VARCHAR(120),
    Admin_email VARCHAR(120) UNIQUE,
    Admin_pass VARCHAR(120)
);



CREATE TABLE Users (
    	User_id INT PRIMARY KEY AUTO_INCREMENT,
    	User_name VARCHAR(120),
	User_email VARCHAR(120) UNIQUE,
     User_pass VARCHAR(120),
     User_contact VARCHAR(15),
     User_address VARCHAR(256)
);



CREATE TABLE Venues (
     Venue_id INT PRIMARY KEY AUTO_INCREMENT,
     Venue_name VARCHAR(60),
     Venue_description VARCHAR(512),
     Venue_contact VARCHAR(15),
     Venue_address VARCHAR(100),
     Venue_amountPerDay DECIMAL(10,2),
     Venue_image VARCHAR(100)
);


CREATE TABLE Services (
     Service_id INT PRIMARY KEY AUTO_INCREMENT,
     Service_name VARCHAR(60)  
);


CREATE TABLE VenueServices (
    	VenueService_id INT PRIMARY KEY AUTO_INCREMENT,
	Venue_id INT,
	Service_id INT,
	FOREIGN KEY (Venue_id ) REFERENCES Venues(Venue_id )ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Service_id) REFERENCES Services(Service_id)ON DELETE CASCADE ON UPDATE CASCADE
	
);


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




   
