CREATE TABLE Person (
    Id SERIAL primary key not null,
    UserName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Service (
    Id SERIAL primary key not null,
    ServiceName VARCHAR(100),
    Duration INT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Employee (
    Id SERIAL primary key not null,
    EmployeeName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Reservation (
    Id SERIAL primary key,
    PersonId SERIAL,
    ServiceId SERIAL,
    EmployeeId SERIAL,
    ReservationTime TIMESTAMP,
    Status VARCHAR(50),
    constraint FK_PersonId_Reservation foreign key (PersonId) references Person(Id) on delete set null,
    constraint FK_ServiceId_Reservation foreign key (ServiceId) references Service(Id) on delete set null,
    constraint FK_EmployeeId_Reservation foreign key (EmployeeId) references Employee(Id) on delete set null
);

CREATE TABLE WorkingHour (
    Id SERIAL primary key,
    EmployeeId SERIAL,
    DayOfWeek INT,
    StartTime TIME,
    EndTime TIME,
    constraint FK_EmployeeId_WorkingHour foreign key (EmployeeId) references Employee(Id) on delete set null
);

CREATE TABLE Payment (
    Id SERIAL PRIMARY KEY,
    ReservationId SERIAL,
    Amount DECIMAL(10, 2),
    PaymentDate TIMESTAMP,
    constraint FK_ReservationId_Payment foreign key (ReservationId) references Reservation(Id) on delete set null
);