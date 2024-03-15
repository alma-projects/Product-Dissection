CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Full_Name VARCHAR(255),
    Bio TEXT,
    Registration_Date DATE
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    UserID INT,
    Caption TEXT,
    Image_URL VARCHAR(255),
    Location VARCHAR(255),
    Post_Date DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Comment (
    CommentID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Text TEXT,
    Comment_Date DATE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE `Like` (
    LikeID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Like_Date DATE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Follower (
    FollowerID INT PRIMARY KEY,
    FollowingUserID INT,
    FollowerUserID INT,
    Follow_Date DATE,
    FOREIGN KEY (FollowingUserID) REFERENCES User(UserID),
    FOREIGN KEY (FollowerUserID) REFERENCES User(UserID)
);

CREATE TABLE Hashtag (
    HashtagID INT PRIMARY KEY,
    Tag VARCHAR(255) UNIQUE
);

CREATE TABLE PostHashtag (
    PostHashtagID INT PRIMARY KEY,
    PostID INT,
    HashtagID INT,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (HashtagID) REFERENCES Hashtag(HashtagID)
);
