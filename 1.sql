 CREATE TABLE Task1_Db.dbo.Lectures (
  Id INT PRIMARY KEY,
  Topic CHAR(10) NOT NULL,
  StartTime DATETIME NOT NULL
);

CREATE TABLE Task1_Db.dbo.LectureSeats (
  Id INT PRIMARY KEY,
  lectureId INT NOT NULL,
  SeatNumber CHAR(10) NOT NULL,
  IsOccupied BIT NOT NULL,

  CONSTRAINT FK_LectureSeats_Lectures 
    FOREIGN KEY (lectureId) REFERENCES Task1_Db.dbo.Lectures(Id),

  CONSTRAINT UQ_LectureSeats_lectureId_SeatNumber 
    UNIQUE (lectureId, SeatNumber)
);

CREATE TABLE Task1_Db.dbo.LectureBookings (
  Id INT PRIMARY KEY,
  SeatId INT NOT NULL,
  StudentName CHAR(10) NOT NULL,
  BookedAt DATETIME NOT NULL,

  CONSTRAINT FK_LectureBookings_LectureSeats
    FOREIGN KEY (SeatId) REFERENCES Task1_Db.dbo.LectureSeats(Id),

  CONSTRAINT UQ_LectureBookings_SeatId 
    UNIQUE (SeatId)
);

INSERT INTO Task1_Db.dbo.Lectures (Id, Topic, StartTime) 
VALUES (1, 'Math', '2025-01-01 10:00:00');

INSERT INTO Task1_Db.dbo.LectureSeats (Id, lectureId, SeatNumber, IsOccupied) 
VALUES 
(1, 1, 'A1', 0),
(2, 1, 'A2', 0),
(3, 1, 'A3', 0),
(4, 1, 'A4', 0),
(5, 1, 'A5', 0);

BEGIN TRY
  BEGIN TRANSACTION;

  UPDATE Task1_Db.dbo.LectureSeats
  SET IsOccupied = 1
  WHERE Id = 1
  AND SeatNumber = 'A1'
  AND IsOccupied = 0;

  IF @@ROWCOUNT = 0
  BEGIN
    THROW 50000, 'Seat is already occupied or does not exist.', 1;
  END

  INSERT INTO Task1_Db.dbo.LectureBookings (Id, SeatId, StudentName, BookedAt)
  SELECT 1, Id, 'John Doe', GETDATE()
  FROM Task1_Db.dbo.LectureSeats
  WHERE Id = 1 AND SeatNumber = 'A1';

  COMMIT TRANSACTION;
END TRY

BEGIN CATCH
  ROLLBACK TRANSACTION;
  PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;

SELECT * FROM Task1_Db.dbo.Lectures;
SELECT * FROM Task1_Db.dbo.LectureSeats;
SELECT * FROM Task1_Db.dbo.LectureBookings;