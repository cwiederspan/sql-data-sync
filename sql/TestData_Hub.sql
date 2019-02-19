/*
INSERT INTO Users (FirstName, LastName) VALUES ('Chris', 'Wiederspan')

INSERT INTO Scans_WithGuid (UserId, Source, Location) VALUES ('438558cf-04f1-4b86-9fe6-83946a93f60a', 'Hub', 'Vail')
INSERT INTO Scans_WithGuid (UserId, Source, Location) VALUES ('438558cf-04f1-4b86-9fe6-83946a93f60a', 'Hub', 'Breckenridge')
INSERT INTO Scans_WithGuid (UserId, Source, Location) VALUES ('438558cf-04f1-4b86-9fe6-83946a93f60a', 'Hub', 'Keystone')

INSERT INTO Scans_WithInt (UserId, Source, Location) VALUES ('438558cf-04f1-4b86-9fe6-83946a93f60a', 'Hub', 'Vail')
INSERT INTO Scans_WithInt (UserId, Source, Location) VALUES ('438558cf-04f1-4b86-9fe6-83946a93f60a', 'Hub', 'Breckenridge')
INSERT INTO Scans_WithInt (UserId, Source, Location) VALUES ('438558cf-04f1-4b86-9fe6-83946a93f60a', 'Hub', 'Keystone')
*/

SELECT * FROM Users
SELECT * FROM Scans_WithGuid ORDER BY Timestamp
SELECT * FROM Scans_WithInt ORDER BY Timestamp
