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

INSERT INTO Department (Department)
VALUES ('Gimnasio');

INSERT INTO Admin (First_Name, Last_Name, Email, Password, Phone, Start_Date, Permissions, Id_Department)
VALUES ('Juan', 'Pérez', 'juanperez@gmail.com', 'password123', '123456789', '2022-01-01', 'Admin', 1);

INSERT INTO Articles (Product_Name, Price, Description, Quantity)
VALUES ('Pesa de 2kg', 20.99, 'Pesa de 2kg para entrenamiento', 10);

INSERT INTO Customer (First_Name, Last_Name, Email, Password, Phone)
VALUES ('Ana', 'González', 'anagonzalez@gmail.com', 'password123', '987654321');

INSERT INTO Membership (Type, Price, Description, Duration)
VALUES ('Membresía básica', 50.99, 'Acceso al gimnasio y a los entrenadores por un mes', 30);

INSERT INTO Purchase (Date, Payment_Method, Total_Price)
VALUES ('2022-02-01', 'Tarjeta de crédito', 70.98);

INSERT INTO Routines (Id_Routines, Description, Id_Membership)
VALUES (1, 'Rutina de fuerza para principiantes', 1);

INSERT INTO Customer_Membership (Id_Customer, Id_Membership)
VALUES (1, 1);

-- Agregar una compra
INSERT INTO Purchase (Date, Payment_Method, Total_Price) VALUES ('2022-04-26', 'Tarjeta de crédito', 100.00);

-- Agregar un cliente
INSERT INTO Customer (First_Name, Last_Name, Email, Password, Phone) VALUES ('Juan', 'Pérez', 'juan.perez@example.com', 'password', '555-1234');

-- Agregar una membresía
INSERT INTO Membership (Type, Price, Description, Duration) VALUES ('Básico', 50.00, 'Membresía básica de 1 mes', 30);

-- Asociar un cliente con una membresía
INSERT INTO Customer_Membership (Id_Customer, Id_Membership) VALUES (1, 1);

-- Asociar una rutina con una membresía
INSERT INTO Routines (Id_Routines, Description, Id_Membership) VALUES (1, 'Rutina de cardio', 1);

-- Asociar una compra con un cliente
INSERT INTO Customer_Purchase (Id_Customer, Id_Purchase) VALUES (1, 1);

-- Asociar una compra con un producto
INSERT INTO Purchase_Articles (Id_Purchase_Articles, Quantity, Id_Article, Id_Purchase) VALUES (1, 1, 1, 1);

SELECT Routines.Id_Routines, Routines.Description, COUNT(*) as Purchase_Count
FROM Purchase
INNER JOIN Customer_Purchase ON Purchase.Id_Purchase = Customer_Purchase.Id_Purchase
INNER JOIN Customer_Membership ON Customer_Purchase.Id_Customer = Customer_Membership.Id_Customer
INNER JOIN Routines ON Customer_Membership.Id_Membership = Routines.Id_Membership
GROUP BY Routines.Id_Routines
ORDER BY Purchase_Count DESC
LIMIT 1;
