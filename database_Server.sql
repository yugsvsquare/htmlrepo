-- Database schema (DDL)
CREATE DATABASE DownloadServer;
USE DownloadServer;

CREATE TABLE Files (
    FileID INT PRIMARY KEY IDENTITY(1,1),
    FileName VARCHAR(255) NOT NULL,
    FilePath VARCHAR(255) NOT NULL,
    FileSize INT NOT NULL,
    UploadDate DATETIME DEFAULT GETDATE()
);

-- Sample data (DML)
INSERT INTO Files (FileName, FilePath, FileSize) 
VALUES 
    ('document.pdf', '/uploads/document.pdf', 102400), 
    ('image.jpg', '/uploads/image.jpg', 51200),
    ('video.mp4', '/uploads/video.mp4', 1000000); 

-- Stored procedure to download a file
CREATE PROCEDURE DownloadFile (@FileID INT)
AS
BEGIN
    SELECT FilePath, FileSize
    FROM Files
    WHERE FileID = @FileID;
END; 
