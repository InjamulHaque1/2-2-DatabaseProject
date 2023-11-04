GO
Create database E_Seba

GO
use E_Seba

CREATE TABLE [User] (
  [u_id] varchar(10),
  [u_name] varchar(100),
  [u_age] varchar(3),
  [u_email] varchar(100) unique,
  [u_address] varchar(100),
  [u_gender] varchar(100),
  [u_mobile] varchar(100) unique,
  PRIMARY KEY ([u_id])
);

CREATE TABLE [Roles] (
  [r_id] varchar(10),
  [r_name] varchar(100),
  [r_description] varchar(100),
  [r_permission] varchar(100),
  PRIMARY KEY ([r_id])
);

CREATE TABLE [Access] (
  [r_id] varchar(10),
  [u_id] varchar(10),
  PRIMARY KEY ([r_id], [u_id]),
  CONSTRAINT [FK_Access.u_id]
    FOREIGN KEY ([u_id])
      REFERENCES [User]([u_id]),
  CONSTRAINT [FK_Access.r_id]
    FOREIGN KEY ([r_id])
      REFERENCES [Roles]([r_id])
);

CREATE TABLE [Doctor] (
  [d_id] varchar(10),
  [d_speciality] varchar(100),
  [d_status] varchar(100),
  [d_location] varchar(100),
  [d_cost] int,
  [d_days] varchar(100),
  [d_startTime] time(0),
  [d_endTime] time(0),
  [d_rating] numeric(3,2),
  PRIMARY KEY ([d_id])
);

CREATE TABLE [Appointment] (
  [app_id] varchar(10),
  [app_type] varchar(100),
  [app_time] varchar(100),
  [indv_rating] numeric(2,1),
  [u_id] varchar(10),
  [d_id] varchar(10),
  PRIMARY KEY ([app_id]),
  CONSTRAINT [FK_Appointment.u_id]
    FOREIGN KEY ([u_id])
      REFERENCES [User]([u_id]),
  CONSTRAINT [FK_Appointment.d_id]
    FOREIGN KEY ([d_id])
      REFERENCES [Doctor]([d_id])
);

CREATE TABLE [Hospital] (
  [h_id] varchar(10),
  [h_name] varchar(100),
  [h_location] varchar(100),
  [h_phone] varchar(100) unique,
  [h_icuStatus] varchar(100),
  [h_bloodGroup1] varchar(100),
  [h_bloodGroup2] varchar(100),
  [h_bloodGroup3] varchar(100),
  [h_cost] int,
  PRIMARY KEY ([h_id])
);

CREATE TABLE [Admit] (
  [h_id] varchar(10),
  [u_id] varchar(10),
  PRIMARY KEY ([h_id], [u_id]),
  CONSTRAINT [FK_Admit.h_id]
    FOREIGN KEY ([h_id])
      REFERENCES [Hospital]([h_id]),
  CONSTRAINT [FK_Admit.u_id]
    FOREIGN KEY ([u_id])
      REFERENCES [User]([u_id])
);

CREATE TABLE [Ambulence] (
  [a_id] varchar(10),
  [a_type] varchar(100),
  [a_cost] int,
  [a_location] varchar(100),
  [a_status] varchar(100),
  [a_number] varchar(10) unique,
  [driver_id] varchar(10),
  PRIMARY KEY ([a_id]),
  CONSTRAINT [FK_Ambulence.driver_id]
    FOREIGN KEY ([driver_id])
      REFERENCES [User]([u_id])
);

CREATE TABLE [Takes] (
  [u_id] varchar(10),
  [a_id] varchar(10),
  PRIMARY KEY ([u_id], [a_id]),
  CONSTRAINT [FK_Takes.a_id]
    FOREIGN KEY ([a_id])
      REFERENCES [Ambulence]([a_id]),
  CONSTRAINT [FK_Takes.u_id]
    FOREIGN KEY ([u_id])
      REFERENCES [User]([u_id])
);

CREATE TABLE [Goes] (
  [h_id] varchar(10),
  [a_id] varchar(10),
  PRIMARY KEY ([h_id], [a_id]),
  CONSTRAINT [FK_Goes.h_id]
    FOREIGN KEY ([h_id])
      REFERENCES [Hospital]([h_id]),
  CONSTRAINT [FK_Goes.a_id]
    FOREIGN KEY ([a_id])
      REFERENCES [Ambulence]([a_id])
);

CREATE TABLE [Medical Accessories] (
  [acc_id] varchar(10),
  [acc_name] varchar(100),
  [acc_type] varchar(100),
  [acc_cost] int,
  [acc_count] int,
  [seller_id] varchar(10),
  PRIMARY KEY ([acc_id]),
  CONSTRAINT [FK_Medical Accessories.seller_id]
    FOREIGN KEY ([seller_id])
      REFERENCES [User]([u_id])
);

CREATE TABLE [Buys] (
  [u_id] varchar(10),
  [acc_id] varchar(10),
  [quantity] int,
  [totalCost] int,
  PRIMARY KEY ([u_id], [acc_id]),
  CONSTRAINT [FK_Buys.u_id]
    FOREIGN KEY ([u_id])
      REFERENCES [User]([u_id]),
  CONSTRAINT [FK_Buys.acc_id]
    FOREIGN KEY ([acc_id])
      REFERENCES [Medical Accessories]([acc_id])
);

INSERT INTO [User] VALUES('1', 'John Smith', '29', 'john.smith@gmail.com', '123 Main St, NY', 'Male', '555-555-1234')
INSERT INTO [User] VALUES('2', 'Sarah Johnson', '35', 'sjohnson@hotmail.com', '456 Elm St, LA', 'Female', '555-555-5678')
INSERT INTO [User] VALUES('3', 'Michael Lee', '42', 'mlee@yahoo.com', '789 Oak St, SF', 'Male', '555-555-9012')
INSERT INTO [User] VALUES('4', 'Jessica Chen', '27', 'jchen@gmail.com', '321 Maple St, NY', 'Female', '555-555-3456')
INSERT INTO [User] VALUES('5', 'William Kim', '31', 'wkim@yahoo.com', '654 Pine St, LA', 'Male', '555-555-7890')
INSERT INTO [User] VALUES('6', 'Emily Davis', '25', 'edavis@hotmail.com', '987 Cedar St, SF', 'Female', '555-555-4321')
INSERT INTO [User] VALUES('7', 'David Brown', '38', 'dbrown@gmail.com', '456 Maple St, NY', 'Male', '555-555-8765')
INSERT INTO [User] VALUES('8', 'Karen Johnson', '45', 'kjohnson@yahoo.com', '123 Oak St, LA', 'Female', '555-555-2109')
INSERT INTO [User] VALUES('9', 'Robert Rodriguez', '29', 'rrodriguez@hotmail.com', '789 Pine St, SF', 'Male', '555-555-6543')
INSERT INTO [User] VALUES('10', 'Julie Lee', '33', 'jlee@gmail.com', '654 Cedar St, NY', 'Female', '555-555-0987')
INSERT INTO [User] VALUES('11', 'Daniel Kim', '28', 'dkim@yahoo.com', '321 Elm St, LA', 'Male', '555-555-5432')
INSERT INTO [User] VALUES('12', 'Ashley Davis', '24', 'adavis@hotmail.com', '987 Oak St, SF', 'Female', '555-555-9876')
INSERT INTO [User] VALUES('13', 'Steven Chen', '41', 'schen@gmail.com', '456 Pine St, NY', 'Male', '555-555-3210')
INSERT INTO [User] VALUES('14', 'Linda Wilson', '37', 'lwilson@yahoo.com', '123 Cedar St, LA', 'Female', '555-555-7654')
INSERT INTO [User] VALUES('15', 'Paul Brown', '44', 'pbrown@hotmail.com', '789 Elm St, SF', 'Male', '555-555-1098')
INSERT INTO [User] VALUES('16', 'Jennifer Kim', '30', 'jkim@yahoo.com', '321 Oak St, NY', 'Female', '555-555-6544')
INSERT INTO [User] VALUES('17', 'Eric Rodriguez', '36', 'erodriguez@gmail.com', '654 Pine St, LA', 'Male', '555-555-2110')
INSERT INTO [User] VALUES('18', 'Megan Davis', '28', 'mdavis@yahoo.com', '987 Cedar St, SF', 'Female', '555-555-8766')
INSERT INTO [User] VALUES('19', 'Kevin Chen', '32', 'kchen@hotmail.com', '456 Maple St, NY', 'Male', '555-555-0988')
INSERT INTO [User] VALUES('20', 'Amanda Johnson', '26', 'ajohnson@gmail.com', '123 Oak St, LA', 'Female', '555-555-5433')
INSERT INTO [User] VALUES('21', 'Timothy Kim', '39', 'tkim@hotmail.com', '789 Maple St, SF', 'Male', '555-555-1235')
INSERT INTO [User] VALUES('22', 'Rachel Davis', '28', 'rdavis@gmail.com', '321 Cedar St, NY', 'Female', '555-555-5679')
INSERT INTO [User] VALUES('23', 'Christopher Lee', '45', 'clee@yahoo.com', '654 Oak St, LA', 'Male', '555-555-9013')
INSERT INTO [User] VALUES('24', 'Stephanie Johnson', '31', 'sjohnson@gmail.com', '987 Pine St, SF', 'Female', '555-555-4456')
INSERT INTO [User] VALUES('25', 'Nicholas Rodriguez', '36', 'nrodriguez@yahoo.com', '456 Cedar St, NY', 'Male', '555-556-7890')
----------------------------------Seller
INSERT INTO [User] VALUES('26', 'Christina Brown', '27', 'cbrown@hotmail.com', '123 Elm St, LA', 'Female', '555-556-4321')
INSERT INTO [User] VALUES('27', 'Brandon Davis', '34', 'bdavis@gmail.com', '789 Maple St, SF', 'Male', '555-556-8765')
INSERT INTO [User] VALUES('28', 'Hannah Chen', '29', 'hchen@yahoo.com', '321 Oak St, NY', 'Female', '555-556-2109')
INSERT INTO [User] VALUES('29', 'Andrew Kim', '38', 'akim@hotmail.com', '654 Pine St, LA', 'Male', '555-556-6543')
INSERT INTO [User] VALUES('30', 'Lauren Wilson', '26', 'lwilson@gmail.com', '987 Cedar St, SF', 'Female', '555-556-0987')
----------------------------------Driver
INSERT INTO [User] VALUES('31', 'John Smith', '35', 'jsmith@gmail.com', '123 Main St, NY', 'Male', '555-123-4567')
INSERT INTO [User] VALUES('32', 'Emily Davis', '29', 'edavis@yahoo.com', '456 Oak Ave, LA', 'Female', '555-987-6543')
INSERT INTO [User] VALUES('33', 'Michael Johnson', '42', 'mjohnson@hotmail.com', '789 Elm St, CHI', 'Male', '555-111-2222')
INSERT INTO [User] VALUES('34', 'Samantha Lee', '31', 'slee@gmail.com', '345 Maple Rd, DAL', 'Female', '555-333-4444')
INSERT INTO [User] VALUES('35', 'David Rodriguez', '27', 'drodriguez@gmail.com', '678 Pine St, SF', 'Male', '555-555-5555')
INSERT INTO [User] VALUES('36', 'Maria Hernandez', '38', 'mhernandez@yahoo.com', '901 Oak St, MIA', 'Female', '555-777-8888')
INSERT INTO [User] VALUES('37', 'William Turner', '44', 'wturner@hotmail.com', '234 Cedar Ave, NY', 'Male', '555-999-0000')
INSERT INTO [User] VALUES('38', 'Jessica Brown', '33', 'jbrown@gmail.com', '567 Elm Rd, LA', 'Female', '555-222-3333')
INSERT INTO [User] VALUES('39', 'Daniel Kim', '30', 'dkim20@yahoo.com', '890 Maple St, CHI', 'Male', '555-444-5555')
INSERT INTO [User] VALUES('40', 'Jennifer Chen', '28', 'jchen20@gmail.com', '123 Oak Ave, DAL', 'Female', '555-666-7777')
----------------------------------DOCTOR
INSERT INTO [User] VALUES('41', 'Mark Williams', '36', 'mwilliams@yahoo.com', '456 Pine St, SF', 'Male', '555-101-2222')
INSERT INTO [User] VALUES('42', 'Sarah Davis', '27', 'sdavis@gmail.com', '789 Maple Rd, DAL', 'Female', '555-303-4444')
INSERT INTO [User] VALUES('43', 'Christopher Brown', '44', 'cbrown100@hotmail.com', '901 Oak St, CHI', 'Male', '555-505-5555')
INSERT INTO [User] VALUES('44', 'Alexandra Perez', '31', 'aperez@yahoo.com', '234 Elm St, MIA', 'Female', '555-707-8888')
INSERT INTO [User] VALUES('45', 'Ethan Johnson', '28', 'ejohnson@gmail.com', '567 Cedar Ave, NY', 'Male', '555-909-0000')
INSERT INTO [User] VALUES('46', 'Madison Lee', '39', 'mlee@gmail.com', '890 Pine Rd, LA', 'Female', '555-222-3303')
INSERT INTO [User] VALUES('47', 'Jason Kim', '32', 'jkim@hotmail.com', '123 Maple St, SF', 'Male', '555-444-5055')
INSERT INTO [User] VALUES('48', 'Julia Rodriguez', '29', 'jrodriguez@gmail.com', '456 Oak Ave, CHI', 'Female', '555-666-7707')
INSERT INTO [User] VALUES('49', 'William Taylor', '45', 'wtaylor@yahoo.com', '789 Cedar St, MIA', 'Male', '555-888-9009')
INSERT INTO [User] VALUES('50', 'Olivia Hernandez', '26', 'ohernandez@gmail.com', '901 Maple Rd, DAL', 'Female', '555-000-1111')

INSERT INTO [Roles] VALUES ('1', 'User', 'Has no special permissions', 'buy, appointment, admit')
INSERT INTO [Roles] VALUES ('2', 'Seller', 'Can sell company products', 'sell')
INSERT INTO [Roles] VALUES ('3', 'Driver', 'Can drive company vehicles', 'drive')
INSERT INTO [Roles] VALUES ('4', 'Doctor', 'Can provide medical treatment', 'treatment')

INSERT INTO [Access] VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('1', '4'), ('1', '5'), ('1', '6'), ('1', '7'), ('1', '8'), ('1', '9'), ('1', '10'),
('1', '11'), ('1', '12'), ('1', '13'), ('1', '14'), ('1', '15'), ('1', '16'), ('1', '17'), ('1', '18'),('1', '19'), ('1', '20'),
('1', '21'), ('1', '22'), ('1', '23'), ('1', '24'), ('1', '25'), ('1', '26'), ('1', '27'), ('1', '28'),('1', '29'), ('1', '30'),
('1', '31'), ('1', '32'), ('1', '33'), ('1', '34'), ('1', '35'), ('1', '36'), ('1', '37'), ('1', '38'),('1', '39'), ('1', '40'),
('1', '41'), ('1', '42'), ('1', '43'), ('1', '44'), ('1', '45'), ('1', '46'), ('1', '47'), ('1', '48'), ('1', '49'), ('1', '50'),
('2', '26'), ('2', '27'), ('2', '28'), ('2', '29'), ('2', '30'),
('3', '31'), ('3', '32'), ('3', '33'), ('3', '34'), ('3', '35'), ('3', '36'), ('3', '37'), ('3', '38'),('3', '39'), ('3', '40'),
('4', '41'), ('4', '42'), ('4', '43'), ('4', '44'), ('4', '45'), ('4', '46'), ('4', '47'), ('4', '48'), ('4', '49'), ('4', '50');

INSERT INTO [Doctor] VALUES('41', 'Cardiologist', 'Available', 'New York', 250, 'Mon-Sat', '09:00:00', '17:00:00', 4.5)
INSERT INTO [Doctor] VALUES('42', 'Family medicine', 'Available', 'Los Angeles', 200, 'Mon-Fri', '08:00:00', '16:00:00', 4.2)
INSERT INTO [Doctor] VALUES('43', 'Dermatologist', 'Available', 'Chicago', 150, 'Mon-Sun', '10:00:00', '18:00:00', 4.7)
INSERT INTO [Doctor] VALUES('44', 'Dermatologist', 'Unavailable', 'Houston', 300, 'Mon-Wed', '11:00:00', '19:00:00', 4.8)
INSERT INTO [Doctor] VALUES('45', 'Family medicine', 'Available', 'Philadelphia', 350, 'Tue-Sat', '09:00:00', '17:00:00', 4.1)
INSERT INTO [Doctor] VALUES('46', 'Family medicine', 'Available', 'Phoenix', 400, 'Mon-Thu', '08:00:00', '16:00:00', 4.9)
INSERT INTO [Doctor] VALUES('47', 'Internal medicine', 'Available', 'San Antonio', 220, 'Mon-Sat', '09:00:00', '17:00:00', 4.4)
INSERT INTO [Doctor] VALUES('48', 'Pediatrician', 'Available', 'San Diego', 280, 'Tue-Sun', '10:00:00', '18:00:00', 4.6)
INSERT INTO [Doctor] VALUES('49', 'Pediatrician', 'Unavailable', 'Dallas', 320, 'Mon-Thu', '08:00:00', '16:00:00', 4.3)
INSERT INTO [Doctor] VALUES('50', 'Orthopedic Surgeon', 'Available', 'San Jose', 380, 'Mon-Fri', '11:00:00', '19:00:00', 4.0)

INSERT INTO [Appointment] VALUES('1', 'Online', '2023-05-06 10:00:00', 4.5, '1', '41')
INSERT INTO [Appointment] VALUES('2', 'Offline', '2023-05-07 11:00:00', 4.0, '2', '42')
INSERT INTO [Appointment] VALUES('3', 'Online', '2023-05-08 12:00:00', 4.2, '3', '45')
INSERT INTO [Appointment] VALUES('4', 'Online', '2023-05-09 13:00:00', 4.7, '4', '41')
INSERT INTO [Appointment] VALUES('5', 'Online', '2023-05-10 14:00:00', 4.8, '5', '41')
INSERT INTO [Appointment] VALUES('6', 'Offline', '2023-05-11 15:00:00', 4.9, '6', '42')
INSERT INTO [Appointment] VALUES('7', 'Online', '2023-05-12 14:00:00', 4.4, '7', '42')
INSERT INTO [Appointment] VALUES('8', 'Offline', '2023-05-13 17:00:00', 4.6, '8', '43')
INSERT INTO [Appointment] VALUES('9', 'Online', '2023-05-14 11:00:00', 4.3, '9', '43')
INSERT INTO [Appointment] VALUES('10', 'Offline', '2023-05-15 13:00:00', 4.1, '10', '45')
INSERT INTO [Appointment] VALUES('11', 'Online', '2023-05-16 10:00:00', 4.2, '11', '45')
INSERT INTO [Appointment] VALUES('12', 'Offline', '2023-05-17 11:00:00', 4.7, '12', '46')
INSERT INTO [Appointment] VALUES('13', 'Online', '2023-05-18 12:00:00', 4.8, '13', '46')
INSERT INTO [Appointment] VALUES('14', 'Offline', '2023-05-19 13:00:00', 4.5, '14', '47')
INSERT INTO [Appointment] VALUES('15', 'Online', '2023-05-20 14:00:00', 4.1, '15', '47')
INSERT INTO [Appointment] VALUES('16', 'Online', '2023-05-21 15:00:00', 4.9, '16', '47')
INSERT INTO [Appointment] VALUES('17', 'Online', '2023-05-22 16:00:00', 4.6, '17', '48')
INSERT INTO [Appointment] VALUES('18', 'Offline', '2023-05-23 17:00:00', 4.3, '18', '48')
INSERT INTO [Appointment] VALUES('19', 'Online', '2023-05-24 18:00:00', 4.0, '19', '50')
INSERT INTO [Appointment] VALUES('20', 'Offline', '2023-05-25 1:00:00', 4.2, '20', '50')
INSERT INTO [Appointment] VALUES('21', 'Online', '2023-05-10 10:00:00', 3.5, '11', '50')
INSERT INTO [Appointment] VALUES('22', 'Offline', '2023-05-11 14:30:00', 4.2, '12', '45')
INSERT INTO [Appointment] VALUES('23', 'Offline', '2023-05-12 09:00:00', 4.9, '13', '41')
INSERT INTO [Appointment] VALUES('24', 'Offline', '2023-05-13 16:00:00', 3.8, '14', '43')
INSERT INTO [Appointment] VALUES('25', 'Online', '2023-05-14 11:30:00', 4.5, '15', '46')
INSERT INTO [Appointment] VALUES('26', 'Online', '2023-05-15 15:00:00', 4.1, '16', '47')
INSERT INTO [Appointment] VALUES('27', 'Offline', '2023-05-16 10:00:00', 3.7, '17', '42')
INSERT INTO [Appointment] VALUES('28', 'Online', '2023-05-17 11:00:00', 4.3, '18', '45')
INSERT INTO [Appointment] VALUES('29', 'Offline', '2023-05-18 14:00:00', 4.8, '19', '50')
INSERT INTO [Appointment] VALUES('30', 'Offline', '2023-05-19 12:00:00', 3.9, '20', '41')

INSERT INTO [Hospital] VALUES('101', 'St. Mary Hospital', 'New York City', '555-123-4567', 'Available', 'A+', 'B-', 'O+', 500);
INSERT INTO [Hospital] VALUES('102', 'Mount Sinai Hospital', 'New York City', '555-234-5678', 'Not Available', 'B+', 'AB-', 'O-', 750);
INSERT INTO [Hospital] VALUES('103', 'Johns Hopkins Hospital', 'Baltimore', '555-345-6789', 'Available', 'A+', 'A-', 'AB-', 1000);
INSERT INTO [Hospital] VALUES('104', 'Massachusetts General Hospital', 'Boston', '555-456-7890', 'Available', 'AB+', 'B+', 'O+', 800);
INSERT INTO [Hospital] VALUES('105', 'Cleveland Clinic', 'Cleveland', '555-567-8901', 'Not Available', 'O+', 'O-', 'B-', 900);
INSERT INTO [Hospital] VALUES('106', 'Mayo Clinic', 'Rochester', '555-678-9012', 'Available', 'A+', 'B+', 'O-', 1200);
INSERT INTO [Hospital] VALUES('107', 'Stanford Hospital', 'Stanford', '555-789-0123', 'Available', 'AB-', 'O+', 'A-', 1100);
INSERT INTO [Hospital] VALUES('108', 'UCLA Medical Center', 'Los Angeles', '555-890-1234', 'Not Available', 'B+', 'A-', 'AB+', 850);
INSERT INTO [Hospital] VALUES('109', 'Texas Medical Center', 'Houston', '555-901-2345', 'Not Available', 'O+', 'AB+', 'O-', 950);
INSERT INTO [Hospital] VALUES('110', 'Mercy Hospital', 'Chicago', '555-012-3456', 'Available', 'O+', 'A-', 'B-', 600);
INSERT INTO [Hospital] VALUES('111', 'Brigham and Womens Hospital', 'Boston', '555-123-4057', 'Not Available', 'AB-', 'A+', 'B-', 900);
INSERT INTO [Hospital] VALUES('112', 'University of Colorado Hospital', 'Aurora', '555-234-5078', 'Available', 'O+', 'B+', 'O-', 800);
INSERT INTO [Hospital] VALUES('113', 'Duke University Hospital', 'Durham', '555-345-6089', 'Available', 'B-', 'O+', 'AB+', 1000);
INSERT INTO [Hospital] VALUES('114', 'New York-Presbyterian Hospital', 'New York City', '555-456-7090', 'Not Available', 'A+', 'O-', 'B+', 850);
INSERT INTO [Hospital] VALUES('115', 'UCSF Medical Center', 'San Francisco', '555-567-8001', 'Available', 'A+', 'AB+', 'O-', 1100);

INSERT INTO [Admit] VALUES('101', '1'),('102', '2'),('103', '3'),('104', '4')
,('105', '5'),('106', '6'),('107', '7'),('108', '8'),('109', '9'),('110', '10')
,('101', '11'),('102', '12'),('103', '13'),('104', '14'),('105', '15')
,('106', '16'),('107', '17'),('108', '18'),('109', '19'),('110', '20'),
('101', '21'),('102', '22'),('103', '23'),('104', '24'),('105', '25'),
('106', '26'),('107', '27'),('108', '28'),('109', '29'),('110', '30');

INSERT INTO [Ambulence] VALUES
('1', 'Type A', 50, '123 Main St, SF', 'Available', 'SF-111', '31'),
('2', 'Type A', 50, '456 Oak St, NY', 'Available', 'NY-111', '32'),
('3', 'Type B', 75, '789 Pine St, NY', 'Unavailable', 'NY-222', '33'),
('4', 'Type A', 50, '111 Market St, SF', 'Available', 'SF-222', '34'),
('5', 'Type C', 100, '222 Geary St, FL', 'Available', 'FL-111', '35'),
('6', 'Type B', 75, '333 Howard St, DA', 'Available', 'DA-111', '36'),
('7', 'Type A', 50, '444 Mission St, DA', 'Available', 'DA-222', '37'),
('8', 'Type B', 75, '555 Montgomery St, SF', 'Available', 'SF-333', '38'),
('9', 'Type A', 50, '666 Broadway St, FL', 'Unavailable', 'FL-222', '39'),
('10', 'Type C', 100, '777 Valencia St, SF', 'Available', 'SF-444', '40')

INSERT INTO [Takes] VALUES 
('1', '1'),('2', '1'),('3', '2'),('4', '2'),('5', '4'),
('6', '4'),('7', '5'),('8', '5'),('9', '5'),('10', '6'),
('11', '6'),('12', '7'),('13', '7'),('14', '7'),('15', '8'),
('16', '8'),('17', '8'),('18', '10'),('19', '10'),('20', '10');

INSERT INTO [Goes] VALUES 
('101', '1'), ('102', '2'),('103', '4'),('104', '5'),('105', '6'),
('106', '7'),('107', '8'),('108', '10'),('109', '1'),('110', '2'),
('111', '4'),('112', '5'),('113', '6'),('114', '7'),('115', '8'),
('101', '10'),('102', '1'),('103', '2'),('104', '4'),('105', '5');

INSERT INTO [Medical Accessories] VALUES('1', 'Surgical gloves', 'Protection', 50, 100, '26')
INSERT INTO [Medical Accessories] VALUES('2', 'Surgical masks', 'Protection', 30, 200, '27')
INSERT INTO [Medical Accessories] VALUES('3', 'Face shields', 'Protection', 75, 50, '28')
INSERT INTO [Medical Accessories] VALUES('4', 'Sterilization trays', 'Equipment', 500, 10, '29')
INSERT INTO [Medical Accessories] VALUES('5', 'Stethoscope', 'Equipment', 150, 25, '30')
INSERT INTO [Medical Accessories] VALUES('6', 'Thermometer', 'Equipment', 100, 50, '26')
INSERT INTO [Medical Accessories] VALUES('7', 'Paracetamol', 'Medicine', 200, 20, '27')
INSERT INTO [Medical Accessories] VALUES('8', 'Blood pressure monitor', 'Equipment', 250, 15, '28')
INSERT INTO [Medical Accessories] VALUES('9', 'Digital weighing scale', 'Equipment', 300, 10, '29')
INSERT INTO [Medical Accessories] VALUES('10', 'Wheelchair', 'Mobility aid', 1000, 5, '30')
INSERT INTO [Medical Accessories] VALUES('11', 'Crutches', 'Mobility aid', 150, 15, '26')
INSERT INTO [Medical Accessories] VALUES('12', 'Walking cane', 'Mobility aid', 50, 20, '27')
INSERT INTO [Medical Accessories] VALUES('13', 'Orthopedic shoes', 'Mobility aid', 500, 8, '28')
INSERT INTO [Medical Accessories] VALUES('14', 'Oxygen tank', 'Emergency', 1000, 3, '29')
INSERT INTO [Medical Accessories] VALUES('15', 'Paracetamol', 'Medicine', 5000, 2, '30')
INSERT INTO [Medical Accessories] VALUES('16', 'Paracetamol', 'Medicine', 200, 5, '26')
INSERT INTO [Medical Accessories] VALUES('17', 'Vitamins', 'Medicine', 50, 50, '27')
INSERT INTO [Medical Accessories] VALUES('18', 'Antacid', 'Medicine', 250, 10, '28')
INSERT INTO [Medical Accessories] VALUES('19', 'Vitamins', 'Medicine', 150, 30, '29')
INSERT INTO [Medical Accessories] VALUES('20', 'Antibiotics', 'Medicine', 75, 100, '30')

INSERT INTO [Buys] VALUES
  ('1', '1', 2, (SELECT [acc_cost] * 2 FROM [Medical Accessories] WHERE [acc_id] = '1')),
  ('2', '2', 1, (SELECT [acc_cost] * 1 FROM [Medical Accessories] WHERE [acc_id] = '2')),
  ('3', '3', 4, (SELECT [acc_cost] * 4 FROM [Medical Accessories] WHERE [acc_id] = '3')),
  ('4', '4', 5, (SELECT [acc_cost] * 5 FROM [Medical Accessories] WHERE [acc_id] = '4')),
  ('5', '5', 3, (SELECT [acc_cost] * 3 FROM [Medical Accessories] WHERE [acc_id] = '5')),
  ('6', '6', 2, (SELECT [acc_cost] * 2 FROM [Medical Accessories] WHERE [acc_id] = '6')),
  ('7', '7', 1, (SELECT [acc_cost] * 1 FROM [Medical Accessories] WHERE [acc_id] = '7')),
  ('8', '8', 3, (SELECT [acc_cost] * 3 FROM [Medical Accessories] WHERE [acc_id] = '8')),
  ('9', '9', 4, (SELECT [acc_cost] * 4 FROM [Medical Accessories] WHERE [acc_id] = '9')),
  ('10', '10', 2, (SELECT [acc_cost] * 2 FROM [Medical Accessories] WHERE [acc_id] = '10')),
  ('11', '11', 1, (SELECT [acc_cost] * 1 FROM [Medical Accessories] WHERE [acc_id] = '11')),
  ('12', '12', 3, (SELECT [acc_cost] * 3 FROM [Medical Accessories] WHERE [acc_id] = '12')),
  ('13', '13', 2, (SELECT [acc_cost] * 2 FROM [Medical Accessories] WHERE [acc_id] = '13')),
  ('14', '14', 4, (SELECT [acc_cost] * 4 FROM [Medical Accessories] WHERE [acc_id] = '14')),
  ('15', '15', 5, (SELECT [acc_cost] * 5 FROM [Medical Accessories] WHERE [acc_id] = '15')),
  ('16', '16', 3, (SELECT [acc_cost] * 3 FROM [Medical Accessories] WHERE [acc_id] = '16')),
  ('17', '17', 2, (SELECT [acc_cost] * 2 FROM [Medical Accessories] WHERE [acc_id] = '17')),
  ('18', '18', 1, (SELECT [acc_cost] * 1 FROM [Medical Accessories] WHERE [acc_id] = '18')),
  ('19', '19', 4, (SELECT [acc_cost] * 4 FROM [Medical Accessories] WHERE [acc_id] = '19')),
  ('20', '20', 2, (SELECT [acc_cost] * 2 FROM [Medical Accessories] WHERE [acc_id] = '20'));

  select * from [dbo].[User]
  select * from [dbo].[Roles]
  select * from [dbo].[Access]
  select * from [dbo].[Doctor]
  select * from [dbo].[Appointment]
  select * from [dbo].[Takes]
  select * from [dbo].[Ambulence]
  select * from [dbo].[Goes]
  select * from [dbo].[Hospital]
  select * from [dbo].[Admit]
  select * from [dbo].[Medical Accessories]
  select * from [dbo].[Buys]

 -- 1.	What is the total number of users and categorize them by roles?
SELECT r_name AS Role, r_description AS Description,
(SELECT COUNT(*) 
    FROM Access 
    WHERE Access.r_id = Roles.r_id ) AS Total
FROM Roles

--2.	Find users whose age is greater than or equal to 40 and lives in New York?
SELECT *
FROM [User]
WHERE [u_age] >= 40 AND [u_address] LIKE '%NY%';

--3.	Select the name and email of the user with a specific mobile number 555-987-6543?
SELECT [u_name], [u_email] 
FROM [User] WHERE [u_mobile] = '555-987-6543'; 

--4.	Select all doctors who have a rating greater than or equal to 4.5 and is available also sort them according to their rating.
SELECT *
FROM Doctor
WHERE d_rating >= 4.5 and d_status = 'Available'
order by d_rating desc;

--5.	Select the name and specialties of doctors who work on Monday to Thursday and have a cost less than or equal to 500.
SELECT u_name as Doctor_name ,d_speciality as Speciality
from [User], [Doctor]
where [Doctor].d_id = [User].u_id 
and [Doctor].d_days LIKE '%Mon-Thu%' AND [Doctor].d_cost <= 500;

--6.	Select the doctor ID, name, and cost for doctors whose cost is less than the average cost of all doctors.
SELECT d_id, u_name, d_cost
FROM Doctor ,[User]
WHERE [Doctor].d_id = [User].u_id
and d_cost < (SELECT AVG(d_cost) FROM Doctor);

--7.	Select the number of doctors who are ' Dermatologist'.
SELECT COUNT(*) AS num_doctors
FROM Doctor
WHERE d_speciality = 'Dermatologist';

--8.	What is the average rating of all appointments made by male patients?
SELECT AVG(indv_rating) as Average_rating
FROM Appointment
WHERE u_id IN (
  SELECT u_id FROM [User]
  WHERE u_gender = 'Male'
);

--9.	How many times online appointment happened?
select count(*) as Total
from Appointment 
where app_type ='Online'

--10.	Show all the doctor names and their appointment count and sort them in descending order?
select u_name as DocName, count(d_id) as AppointmentCount
from Appointment, [User]
where [Appointment].d_id = [User].u_id
group by d_id,u_name 
order by AppointmentCount desc

--11.	Find hospital details if they have ICU available and sort them by cost?
Select * from Hospital 
where h_icuStatus = 'Available' 
order by h_cost

--12.	Find hospital details where O+ blood is available?
select * from Hospital
where h_bloodGroup1 ='O+' or h_bloodGroup2 = 'O+' or h_bloodGroup3 = 'O+'

--13.	Which hospital holds how many users/patients?
select h_name as HospitalName, count(Admit.h_id) as UserCount
from Admit, Hospital
where Admit.h_id = Hospital.h_id
group by h_name, Admit.h_id

--14.	Find all the ambulances in San Francisco?
Select * from Ambulence
where a_location like '%SF%';

--15.	Find out the names of the sellers and count of the products they sell?
select u_name, count(acc_id) as ProductCount
from [Medical Accessories], [User]
where seller_id = [User].u_id
group by u_name, seller_id

--16.	What distinct type of products are available to purchase?
select distinct(acc_type)
from [Medical Accessories]

--17.	What products does 'Christina Brown' sell?
select acc_name 
from [Medical Accessories]
where seller_id in
	(select u_id from [User]
		where u_name = 'Christina Brown')

--18.	Show the total cost of all purchases made?
SELECT SUM(totalCost) AS total_cost
FROM Buys;

--19.	Show the name of the user and total number of medical accessories purchased by them?
SELECT u_name, SUM(quantity) AS total_quantity ,totalCost as cost
FROM Buys, [User]
where [User].u_id = Buys.u_id
GROUP BY  u_name,totalCost;
