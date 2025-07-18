CREATE DATABASE Aereopuerto;
USE Aereopuerto;

# Tabla Airport
CREATE TABLE Airport (
    Airport_code INT NOT NULL AUTO_INCREMENT,
    Name1 VARCHAR(50),
    City VARCHAR(25),
    State1 VARCHAR(50),
    PRIMARY KEY (Airport_code)
);

# Tabla Airplane_type
CREATE TABLE Airplane_type (
    Type_name VARCHAR(50) NOT NULL,
    Company VARCHAR(20),
    Max_seat INT,
    PRIMARY KEY (Type_name)
);

# Tabla Airplane
CREATE TABLE Airplane (
    Airplane_id INT NOT NULL AUTO_INCREMENT,
    Total_no_of_seats INT,
    Type_name VARCHAR(50),
    PRIMARY KEY (Airplane_id),
    FOREIGN KEY (Type_name) REFERENCES Airplane_type(Type_name)
);

# Tabla Can_land
CREATE TABLE Can_land (
    Type_name VARCHAR(50),
    Airport_code INT,
    PRIMARY KEY (Type_name, Airport_code),
    FOREIGN KEY (Type_name) REFERENCES Airplane_type(Type_name),
    FOREIGN KEY (Airport_code) REFERENCES Airport(Airport_code)
);

# Tabla Flight
CREATE TABLE Flight (
    Number_flight INT NOT NULL AUTO_INCREMENT,
    Airline VARCHAR(20),
    Weekdays VARCHAR(25),
    PRIMARY KEY (Number_flight)
);

# Tabla Flight_leg
CREATE TABLE Flight_leg (
    Leg_no INT,
    Departure_airport INT,
    Schedule_dep_time TIME,
    Arrival_airport INT,
    Schedule_arrival_time TIME,
    Number_flight INT,
    PRIMARY KEY (Leg_no, Number_flight),
    FOREIGN KEY (Departure_airport) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Arrival_airport) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Number_flight) REFERENCES Flight(Number_flight)
);

# Tabla Leg_instance
CREATE TABLE Leg_instance (
    Date1 DATE,
    Leg_no INT,
    Number_flight INT,
    Departure_airport INT,
    Arrival_airport INT,
    Airport_departs INT,
    Dep_time TIME,
    Airport_arrives INT,
    Max_time TIME,
    No_of_avails_seats INT,
    Airplaneid INT,
    PRIMARY KEY (Date1, Leg_no, Number_flight),
    FOREIGN KEY (Departure_airport) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Arrival_airport) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Airport_departs) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Airport_arrives) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Airplaneid) REFERENCES Airplane(Airplane_id),
    FOREIGN KEY (Leg_no, Number_flight) REFERENCES Flight_leg(Leg_no, Number_flight)
);

# Tabla Seat
CREATE TABLE Seat (
    Date1 DATE,
    Leg_no INT,
    Number_flight INT,
    Seat_no INT,
    Airplaneid INT,
    Airport_departs INT,
    Airport_arrives INT,
    PRIMARY KEY (Date1, Leg_no, Number_flight, Seat_no),
    FOREIGN KEY (Leg_no, Number_flight) REFERENCES Flight_leg(Leg_no, Number_flight),
    FOREIGN KEY (Airplaneid) REFERENCES Airplane(Airplane_id),
    FOREIGN KEY (Airport_departs) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Airport_arrives) REFERENCES Airport(Airport_code)
);

# Tabla Fare
CREATE TABLE Fare (
    Code_fare INT NOT NULL AUTO_INCREMENT,
    Amount DECIMAL(10,2),
    Restrictions VARCHAR(50),
    Number_flight INT,
    PRIMARY KEY (Code_fare),
    FOREIGN KEY (Number_flight) REFERENCES Flight(Number_flight)
);
