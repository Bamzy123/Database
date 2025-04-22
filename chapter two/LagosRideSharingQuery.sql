-- 1.
CREATE TABLE IF NOT EXISTS Highest_Rated_Drivers AS
SELECT DriverID, Name, Rating, TotalRides
FROM Drivers
ORDER BY Rating DESC
LIMIT 5;

-- 2. 
CREATE TABLE IF NOT EXISTS constant_Riders AS
SELECT R.RiderID, R.Name, COUNT(Ri.RideID) AS RideCount
FROM Riders R
JOIN Rides Ri ON R.RiderID = Ri.RiderID
GROUP BY R.RiderID, R.Name
HAVING RideCount > 5;

-- 3. 
CREATE TABLE IF NOT EXISTS Total_Revenue_Last_Month AS
SELECT SUM(p.Amount) AS TotalRevenue
FROM Payments p
JOIN Rides Ri ON p.RideID = Ri.RideID;

-- 4.
CREATE TABLE IF NOT EXISTS Place_With_Most_Rides AS
SELECT R.City, COUNT(Ri.RideID) AS RideCount
FROM Riders R
JOIN Rides Ri ON R.RiderID = Ri.RiderID
GROUP BY R.City
ORDER BY RideCount DESC
LIMIT 1;

-- Driver with the highest revenue in Lagos
SELECT R.RiderID, R.Name, SUM(P.Amount) AS TotalRevenue 
FROM Riders R 
JOIN Payments P;


-- Find rides where the fare is more than 50% higher or lower than the average fare
SELECT r.RideID, r.Fare, avgFare.AvgFare AS 'Average Fare'
FROM Rides r
CROSS JOIN (SELECT AVG(Fare) AS AvgFare FROM Rides) avgFare
WHERE r.Fare > (avgFare.AvgFare * 1.5)
OR r.Fare < (avgFare.AvgFare * 0.5);


-- Find riders in Lagos who rated their drivers less than 3 on average
SELECT r.RiderID, r.Name, AVG(ri.Rating) AS 'Average Rating'
FROM Riders r
JOIN Rides ri ON r.RiderID = ri.RiderID
GROUP BY r.RiderID, r.Name
HAVING AVG(ri.Rating) < 3;

-- Find the top 5 Lagos neighborhoods with the highest average fare
SELECT r.City AS Area, ROUND(AVG(ri.Fare), 2) AS 'Average Fare'
FROM Riders r
JOIN Rides ri ON r.RiderID = ri.RiderID
GROUP BY r.City
ORDER BY 'Average Fare' DESC
LIMIT 5;

-- Drivers in Lagos who have not received any rides in the last 30 days
SELECT d.DriverID, d.Name
FROM Drivers d
LEFT JOIN Rides r ON d.DriverID = r.DriverID
WHERE r.RideID IS NULL;
