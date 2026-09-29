USE music_band_db;
SELECT * FROM band_member;
INSERT INTO band_member
(FirstName, LastName, Role, Email, JoinDate)
VALUES
('Daniel', 'Smith', 'Lead Singer', 'daniel@example.com', '2022-01-10');
INSERT INTO band_member
(FirstName, LastName, Role, Email, JoinDate)
VALUES
('Michael', 'Brown', 'Guitarist', 'michael@example.com', '2022-02-15');
INSERT INTO band_member
(FirstName, LastName, Role, Email, JoinDate)
VALUES
('James', 'Wilson', 'Drummer', 'james@example.com', '2022-03-20');
INSERT INTO band_member
(FirstName, LastName, Role, Email, JoinDate)
VALUES
('Chris', 'Taylor', 'Bassist', 'chris@example.com', '2022-04-12');
SELECT * FROM band_member;
INSERT INTO album
(AlbumTitle, ReleaseDate)
VALUES
('New Beginning', '2024-05-10');
INSERT INTO album
(AlbumTitle, ReleaseDate)
VALUES
('City Lights', '2025-08-15');
SELECT * FROM album;
INSERT INTO song
(SongTitle, Duration, AlbumID)
VALUES
('New Day', '00:03:40', 1);
INSERT INTO song
(SongTitle, Duration, AlbumID)
VALUES
('Moving Forward', '00:04:05', 1);
INSERT INTO song
(SongTitle, Duration, AlbumID)
VALUES
('City Lights', '00:03:55', 2);
INSERT INTO song
(SongTitle, Duration, AlbumID)
VALUES
('Midnight Road', '00:04:20', 2);
SELECT * FROM song;
INSERT INTO venue
(VenueName, City, State, Capacity)
VALUES
('Central Music Hall', 'New York', 'NY', 1500);
INSERT INTO venue
(VenueName, City, State, Capacity)
VALUES
('Downtown Theater', 'Brooklyn', 'NY', 900);
SELECT * FROM venue;
INSERT INTO event
(EventName, EventDate, EventTime, VenueID)
VALUES
('Summer Concert', '2026-07-18', '19:00:00', 1);
INSERT INTO event
(EventName, EventDate, EventTime, VenueID)
VALUES
('Fall Music Night', '2026-10-15', '20:00:00', 2);
SELECT * FROM event;
INSERT INTO member_event
(MemberID, EventID, PerformanceRole)
VALUES
(1, 1, 'Lead Singer');
INSERT INTO member_event
(MemberID, EventID, PerformanceRole)
VALUES
(5, 1, 'Guitarist');
INSERT INTO member_event
(MemberID, EventID, PerformanceRole)
VALUES
(6, 1, 'Drummer');
INSERT INTO member_event
(MemberID, EventID, PerformanceRole)
VALUES
(7, 1, 'Bassist');
SELECT * FROM member_event;
SELECT 
    song.SongTitle,
    album.AlbumTitle
FROM song
JOIN album
ON song.AlbumID = album.AlbumID;
SELECT
    event.EventName,
    event.EventDate,
    venue.VenueName,
    venue.City
FROM event
JOIN venue
ON event.VenueID = venue.VenueID;
SELECT
    band_member.FirstName,
    band_member.LastName,
    member_event.PerformanceRole,
    event.EventName
FROM member_event
JOIN band_member
ON member_event.MemberID = band_member.MemberID
JOIN event
ON member_event.EventID = event.EventID;