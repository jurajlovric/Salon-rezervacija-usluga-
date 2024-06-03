CREATE TABLE "User" (
    "Id" UUID primary key not null,
    "UserName" VARCHAR(100),
    "Email" VARCHAR(100),
    "Phone" VARCHAR(20)
);

CREATE TABLE "Service" (
    "Id" UUID primary key not null,
    "ServiceName" VARCHAR(100),
    "Duration" INT,
    "Price" DECIMAL(10, 2)
);

CREATE TABLE "Employee" (
    "Id" UUID primary key not null,
    "EmployeeName" VARCHAR(100),
    "Email" VARCHAR(100),
    "Phone" VARCHAR(20)
);

CREATE TABLE "Reservation" (
    "Id" UUID primary key,
    "UserId" UUID,
    "ServiceId" UUID,
    "EmployeeId" UUID,
    "ReservationTime" TIMESTAMP,
    "Status" VARCHAR(50),
    constraint "FK_UserId_Reservation" foreign key ("UserId") references "User"("Id") on delete set null,
    constraint "FK_ServiceId_Reservation" foreign key ("ServiceId") references "Service"("Id") on delete set null,
    constraint "FK_EmployeeId_Reservation" foreign key ("EmployeeId") references "Employee"("Id") on delete set null
);

CREATE TABLE "WorkingHour" (
    "Id" UUID primary key,
    "EmployeeId" UUID,
    "DayOfWeek" INT,
    "StartTime" TIME,
    "EndTime" TIME,
    constraint "FK_EmployeeId_WorkingHour" foreign key ("EmployeeId") references "Employee"("Id") on delete set null
);

CREATE TABLE "Payment" (
    "Id" UUID PRIMARY KEY,
    "ReservationId" UUID,
    "Amount" DECIMAL(10, 2),
    "PaymentDate" TIMESTAMP,
    constraint "FK_ReservationId_Payment" foreign key ("ReservationId") references "Reservation"("Id") on delete set null
);
