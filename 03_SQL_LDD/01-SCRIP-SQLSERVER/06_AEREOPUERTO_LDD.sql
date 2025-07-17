CREATE DATABASE Aereopuerto;
GO

USE Aereopuerto;
GO

CREATE TABLE Airport (
    Airport_code INT NOT NULL IDENTITY(1,1),
    Name1 VARCHAR(50),
    City VARCHAR(25),
    State1 VARCHAR(50)
    CONSTRAINT pk_airport
    PRIMARY KEY(Airport_code)
);

CREATE TABLE Airplane_type (
    Type_name VARCHAR(50) NOT NULL,
    Company VARCHAR(20),
    Max_seat INT
    CONSTRAINT pk_airplaneType
    PRIMARY KEY(Type_name)
);

CREATE TABLE Airplane (
    Airplane_id INT NOT NULL IDENTITY(1,1),
    Total_no_of_seats INT,
    Type_name VARCHAR(50),
    CONSTRAINT pk_airplane
    PRIMARY KEY(Airplane_id),
    CONSTRAINT fk_airplane_airplaneType
    FOREIGN KEY (Type_name)
    REFERENCES Airplane_type
);

CREATE TABLE Can_land (
    Type_name VARCHAR(50),
    Airport_code INT,
    CONSTRAINT pk_canLand
    PRIMARY KEY (Type_name, Airport_code),

    CONSTRAINT fk_canLand_airplaneType_typeName
    FOREIGN KEY (Type_name) 
    REFERENCES Airplane_type,

    CONSTRAINT fk_canLand_airplaneType_airportCode
    FOREIGN KEY (Airport_code) 
    REFERENCES Airport
);

CREATE TABLE Flight (
    Number_flight INT NOT NULL IDENTITY(1,1),
    Airline VARCHAR(20),
    Weekdays VARCHAR(25)
    CONSTRAINT pk_flight
    PRIMARY KEY(Number_flight)
);

CREATE TABLE Flight_leg (
    Leg_no INT,
    Departure_airport INT,
    Schedule_dep_time VARCHAR(20),
    Arrival_airport INT,
    Schedule_arrival_airport VARCHAR(20),
    Number_flight INT,
    CONSTRAINT pk_flightLeg
    PRIMARY KEY (Leg_no, Number_flight),
    
    CONSTRAINT fk_flightLeg_airport
    FOREIGN KEY (Departure_airport) 
    REFERENCES Airport,

    CONSTRAINT fk_flightLeg_arrival
    FOREIGN KEY (Arrival_airport) 
    REFERENCES Airport,
    
    CONSTRAINT fk_flightLeg_numberflight
    FOREIGN KEY (Number_flight) 
    REFERENCES Flight
);

CREATE TABLE Leg_instance (
    Date1 DATE,
    Leg_no INT,
    Departure_airport INT,
    Arrival_airport INT,
    Number_flight INT,
    Airport_departs INT,
    Dep_time DATE,
    Airport_arrives INT,
    Max_time INT,
    No_of_avails_seats INT,
    Airplaneid INT,
    CONSTRAINT pk_leginstance
    PRIMARY KEY (Date1, Leg_no, Number_flight),
    
    CONSTRAINT fk_leginstance_departure
    FOREIGN KEY (Departure_airport) 
    REFERENCES Airport,
    
    CONSTRAINT fk_leginstance_arrival
    FOREIGN KEY (Arrival_airport) 
    REFERENCES Airport,

    CONSTRAINT fk_leginstance_airportdeparts
    FOREIGN KEY (Airport_departs) 
    REFERENCES Airport,

    CONSTRAINT fk_leginstance_airport_arrives
    FOREIGN KEY (Airport_arrives) 
    REFERENCES Airport,

    CONSTRAINT fk_leginstance_airplane
    FOREIGN KEY (Airplaneid) 
    REFERENCES Airplane,

    CONSTRAINT fk_leginstance_flightleg
    FOREIGN KEY (Leg_no, Number_flight) 
    REFERENCES Flight_leg
);

CREATE TABLE Seat (
    Date DATE,
    Leg_no INT,
    Departure_airport VARCHAR(20),
    Number_flight INT,
    Arrival_airport INT,
    Airport_departs INT,
    Airport_arrives INT,
    Airplaneid INT,
    Seat_no INT,

    CONSTRAINT pk_seat
    PRIMARY KEY (Date, Leg_no, Number_flight, Seat_no),

    CONSTRAINT fk_seat_flightleg
    FOREIGN KEY (Leg_no, Number_flight) 
    REFERENCES Flight_leg,

    CONSTRAINT fk_seat_airplane
    FOREIGN KEY (Airplaneid) 
    REFERENCES Airplane,

    CONSTRAINT fk_seat_airport_departs
    FOREIGN KEY (Airport_departs) 
    REFERENCES Airport,

    CONSTRAINT fk_seat_airport_arrives
    FOREIGN KEY (Airport_arrives) 
    REFERENCES Airport
);

CREATE TABLE Fare (
    Code_fare INT NOT NULL IDENTITY(1,1),
    Amount VARCHAR(20),
    Restrictions VARCHAR(20),
    Number_flight INT,
    CONSTRAINT pk_fare
    PRIMARY KEY(Code_fare),
    CONSTRAINT fk_fare_flight
    FOREIGN KEY (Number_flight) 
    REFERENCES Flight
);




