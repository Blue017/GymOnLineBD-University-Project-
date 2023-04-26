CREATE TABLE Department (
  Id_Department INT NOT NULL AUTO_INCREMENT UNIQUE,
  Department VARCHAR(50),
  PRIMARY KEY (Id_Department)
);

CREATE TABLE Admin (
  Id_Admin INT NOT NULL AUTO_INCREMENT,
  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) UNIQUE NOT NULL,
  Password VARCHAR(50) NOT NULL,
  Phone VARCHAR(15),
  Start_Date DATE,
  Permissions VARCHAR(50),
  Id_Department INT,
  PRIMARY KEY (Id_Admin),
  FOREIGN KEY (Id_Department) REFERENCES Department(Id_Department)
);

CREATE TABLE Articles (
  Id_Articles INT NOT NULL AUTO_INCREMENT,
  Product_Name VARCHAR(50),
  Price DECIMAL(10, 2),
  Description TEXT,
  Quantity INT,
  PRIMARY KEY (Id_Articles),
  UNIQUE (Product_Name)
);

CREATE TABLE Customer (
  Id_Customer INT PRIMARY KEY AUTO_INCREMENT,
  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) UNIQUE NOT NULL,
  Password VARCHAR(50) NOT NULL,
  Phone VARCHAR(15)
);

CREATE TABLE Membership (
  Id_Membership INT PRIMARY KEY AUTO_INCREMENT,
  Type VARCHAR(50) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  Description TEXT,
  Duration INT NOT NULL
);

CREATE TABLE Purchase (
  Id_Purchase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Date DATE,
  Payment_Method VARCHAR(50),
  Total_Price DECIMAL(10, 2)
);

CREATE TABLE Login (
  Id_Customer INT,
  Id_Admin INT,
  PRIMARY KEY (Id_Customer, Id_Admin),
  FOREIGN KEY (Id_Customer) REFERENCES Customer(Id_Customer),
  FOREIGN KEY (Id_Admin) REFERENCES Admin(Id_Admin)
);

CREATE TABLE Trainer (
  Id_Trainer INT PRIMARY KEY AUTO_INCREMENT,
  Name_Trainer VARCHAR(50) NOT NULL,
  Salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Customer_Membership (
  Id_Customer INT,
  Id_Membership INT,
  PRIMARY KEY (Id_Customer, Id_Membership),
  FOREIGN KEY (Id_Customer) REFERENCES Customer(Id_Customer),
  FOREIGN KEY (Id_Membership) REFERENCES Membership(Id_Membership)
);


CREATE TABLE Routines (
  Id_Routines INT PRIMARY KEY,
  Description TEXT,
  Id_Membership INT,
  FOREIGN KEY (Id_Membership) REFERENCES Membership(Id_Membership)
);

CREATE TABLE Purchase_Articles (
  Id_Purchase_Articles INT PRIMARY KEY,
  Quantity INT,
  Id_Article INT,
  Id_Purchase INT,
  FOREIGN KEY (Id_Article) REFERENCES Articles(Id_Articles),
  FOREIGN KEY (Id_Purchase) REFERENCES Purchase(Id_Purchase)
);


CREATE TABLE Customer_Purchase (
  Id_Customer INT,
  Id_Purchase INT,
  PRIMARY KEY (Id_Customer, Id_Purchase),
  FOREIGN KEY (Id_Customer) REFERENCES Customer(Id_Customer),
  FOREIGN KEY (Id_Purchase) REFERENCES Purchase(Id_Purchase)
);

CREATE TABLE Membership_Routines (
  Id_Membership INT,
  Type_Routine VARCHAR(50),
  PRIMARY KEY (Id_Membership, Type_Routine),
  FOREIGN KEY (Id_Membership) REFERENCES Membership(Id_Membership)
);


CREATE TABLE Trainer_Membership_Association (
  Id_Membership INT,
  Id_Trainer INT,
  PRIMARY KEY (Id_Membership, Id_Trainer),
  FOREIGN KEY (Id_Membership) REFERENCES Membership(Id_Membership),
  FOREIGN KEY (Id_Trainer) REFERENCES Trainer(Id_Trainer)
);

INSERT INTO Login (Id_Customer, Id_Admin)
VALUES (101, 1), (102, 2), (103, 3), (104, 4), (105, 5);

INSERT INTO Admin (Id_Admin, First_Name, Last_Name, Email, Password, Phone, Start_Date, Permissions, Id_Department)
VALUES (1, 'Michell', 'Smith', 'smith1@email.com', '33331', '5555556', '2022-02-14', 'Tables, Control to a user, edit tables, upload data', 21),
       (2, 'Caroline', 'Johnson', 'johnson@email.com', '44441', '5555557', '2022-03-15', 'tables', 22),
       (3, 'Frank', 'Walker', 'frank2@email.com', '55551', '5555558', '2022-04-16', 'tables', 23),
       (4, 'Emile', 'Shapman', 'emile3@email.com', '66661', '5555559', '2022-05-17', 'tables', 22),
       (5, 'Caroline', 'Reaper', 'caroline4@email.com', '77771', '5555550', '2022-06-18', 'tables', 21);

INSERT INTO Department (Id_Department, Department)
VALUES (21, 'Logic'), (22, 'Data'), (23, 'Support');

INSERT INTO Customer (Id_Customer, First_Name, Last_Name, Email, Password, Phone)
VALUES (101, 'Sheldon', 'Cooper', 'sheldon1@email.com', '88882', '5555557'),
       (102, 'Rose', 'Baker', 'rose2@email.com', '88883', '5555558'),
       (103, 'David', 'Bennet', 'david3@email.com', '88884', '5555559'),
       (104, 'Sylvanas', 'Windrunner', 'sylvie@email.com', '88885', '5555550'),
       (105, 'Cairne', 'Bloodhoof', 'carine4@email.com', '88886', '5555516');

