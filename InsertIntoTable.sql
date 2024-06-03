INSERT INTO "User" ("Id", "UserName", "Email", "Phone") VALUES 
(uuid_generate_v4(), 'JohnDoe', 'john.doe@example.com', '123-456-7890'),
(uuid_generate_v4(), 'JaneSmith', 'jane.smith@example.com', '098-765-4321');

INSERT INTO "Service" ("Id", "ServiceName", "Duration", "Price") VALUES 
(uuid_generate_v4(), 'Haircut', 30, 20.00),
(uuid_generate_v4(), 'Manicure', 45, 25.00);

INSERT INTO "Employee" ("Id", "EmployeeName", "Email", "Phone") VALUES 
(uuid_generate_v4(), 'AliceJohnson', 'alice.johnson@example.com', '321-654-0987'),
(uuid_generate_v4(), 'BobBrown', 'bob.brown@example.com', '789-012-3456');

INSERT INTO "Reservation" ("Id", "UserId", "ServiceId", "EmployeeId", "ReservationTime", "Status") VALUES 
(uuid_generate_v4(), (SELECT "Id" FROM "User" WHERE "UserName" = 'JohnDoe'), (SELECT "Id" FROM "Service" WHERE "ServiceName" = 'Haircut'), (SELECT "Id" FROM "Employee" WHERE "EmployeeName" = 'AliceJohnson'), '2024-06-01 10:00:00', 'Confirmed'),
(uuid_generate_v4(), (SELECT "Id" FROM "User" WHERE "UserName" = 'JaneSmith'), (SELECT "Id" FROM "Service" WHERE "ServiceName" = 'Manicure'), (SELECT "Id" FROM "Employee" WHERE "EmployeeName" = 'BobBrown'), '2024-06-01 11:00:00', 'Pending');

INSERT INTO "WorkingHour" ("Id", "EmployeeId", "DayOfWeek", "StartTime", "EndTime") VALUES 
(uuid_generate_v4(), (SELECT "Id" FROM "Employee" WHERE "EmployeeName" = 'AliceJohnson'), 1, '09:00:00', '17:00:00'),
(uuid_generate_v4(), (SELECT "Id" FROM "Employee" WHERE "EmployeeName" = 'BobBrown'), 2, '10:00:00', '18:00:00');

INSERT INTO "Payment" ("Id", "ReservationId", "Amount", "PaymentDate") VALUES 
(uuid_generate_v4(), (SELECT "Id" FROM "Reservation" WHERE "Status" = 'Confirmed'), 20.00, '2024-06-01 12:00:00');
