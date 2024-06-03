SELECT 
    u."UserName" AS "User",
    s."ServiceName" AS "Service",
    e."EmployeeName" AS "Employee",
    r."ReservationTime" AS "Reservation Time",
    r."Status" AS "Status"
FROM 
    "Reservation" r
JOIN 
    "User" u ON r."UserId" = u."Id"
JOIN 
    "Service" s ON r."ServiceId" = s."Id"
JOIN 
    "Employee" e ON r."EmployeeId" = e."Id";

  
   
   
SELECT 
    e."EmployeeName" AS "Employee",
    e."Email" AS "Email",
    e."Phone" AS "Phone",
    w."DayOfWeek" AS "Day of Week",
    w."StartTime" AS "Start Time",
    w."EndTime" AS "End Time"
FROM 
    "WorkingHour" w
JOIN 
    "Employee" e ON w."EmployeeId" = e."Id";

   
 
   
   
SELECT 
    u."UserName" AS "User",
    COUNT(r."Id") AS "Number of Reservations"
FROM 
    "User" u
LEFT JOIN 
    "Reservation" r ON u."Id" = r."UserId"
GROUP BY 
    u."UserName";

