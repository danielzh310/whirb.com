-- schema.sql

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    Content TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE Connections (
    ConnectionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID1 INT NOT NULL,
    UserID2 INT NOT NULL,
    Status ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (UserID2) REFERENCES Users(UserID) ON DELETE CASCADE
);
