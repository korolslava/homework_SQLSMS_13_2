CREATE TABLE Task2_Db.dbo.Events (
	Id INT PRIMARY KEY,
	Title CHAR(20) NOT NULL,
	EventDate DATETIME NOT NULL
);

CREATE TABLE Task2_Db.dbo.Users (
	Id INT PRIMARY KEY,
	Username CHAR(20) NOT NULL,
);

CREATE TABLE Task2_Db.dbo.Registrations (
	Id INT PRIMARY KEY,
	EventId INT NOT NULL,
	UserId INT NOT NULL,
	RegisteredAt DATETIME NOT NULL,

	CONSTRAINT FK_Registrations_Events
		FOREIGN KEY (EventId) REFERENCES Task2_Db.dbo.Events(Id),

	CONSTRAINT FK_Registrations_Users
		FOREIGN KEY (UserId) REFERENCES Task2_Db.dbo.Users(Id),

	CONSTRAINT UQ_Registrations_EventId_UserId 
		UNIQUE (EventId, UserId),	
);

INSERT INTO Task2_Db.dbo.Events (Id, Title, EventDate) 
VALUES (1, 'Tech Conference', '2025-02-01 09:00');

INSERT INTO Task2_Db.dbo.Users (Id, Username) 
VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Bon');

BEGIN TRY
	BEGIN TRANSACTION;
	IF NOT EXISTS (
		SELECT 1 
		FROM Task2_Db.dbo.Registrations
		WHERE EventId = 1 AND UserId = 1
	)
	BeGIN
		INSERT INTO Task2_Db.dbo.Registrations (Id, EventId, UserId, RegisteredAt)
		VALUES (1, 1, 1, GETDATE());
	END
	ELSE
	BEGIN
		THROW 50001, 'User is already registered for this event.', 1;
	END
	COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION;
	PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;

SELECT * FROM Task2_Db.dbo.Events;
SELECT * FROM Task2_Db.dbo.Users;
SELECT * FROM Task2_Db.dbo.Registrations;