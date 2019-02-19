--DROP TABLE [dbo].[Users]
CREATE TABLE [dbo].[Users]
(
    [Id] UNIQUEIDENTIFIER NOT NULL DEFAULT(NEWID()) PRIMARY KEY, -- Primary Key column
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [Timestamp] NVARCHAR(50) NOT NULL DEFAULT(GETUTCDATE())
)

--DROP TABLE [dbo].[Scans_WithGuid]
CREATE TABLE [dbo].[Scans_WithGuid]
(
    [Id] UNIQUEIDENTIFIER NOT NULL DEFAULT(NEWID()) PRIMARY KEY,
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [Location] NVARCHAR(50) NOT NULL,
    [Source] NVARCHAR(50) NOT NULL,
    [Timestamp] NVARCHAR(50) NOT NULL DEFAULT(GETUTCDATE())
)

--DROP TABLE [dbo].[Scans_WithInt]
CREATE TABLE [dbo].[Scans_WithInt]
(
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [Location] NVARCHAR(50) NOT NULL,
    [Source] NVARCHAR(50) NOT NULL,
    [Timestamp] NVARCHAR(50) NOT NULL DEFAULT(GETUTCDATE())
)

/*
INSERT INTO Users (Id, FirstName, LastName) VALUES ('438558cf-04f1-4b86-9fe6-83946a93f60a', 'Chris', 'Wiederspan')
INSERT INTO Users (Id, FirstName, LastName) VALUES ('1fdfbb94-d575-499c-9ef1-bfacead5205d', 'Puneet', 'Arora')
INSERT INTO Users (Id, FirstName, LastName) VALUES ('afc1e1fe-255d-4ed1-a30c-95b37671f9dc', 'Amanda', 'Howard')
INSERT INTO Users (Id, FirstName, LastName) VALUES ('bbe5e854-fc1c-4226-94d6-f31cabf0eb9e', 'Craig', 'Hendrickson')
INSERT INTO Users (Id, FirstName, LastName) VALUES ('bffb3e96-b528-48f3-9054-55897884f286', 'Alan', 'Reno')
*/

SELECT * FROM Users