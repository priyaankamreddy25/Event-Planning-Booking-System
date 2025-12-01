-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 30, 2022 at 09:54 AM
-- Server version: 8.0.24
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE event_organized_details (
    organizer_ID INT PRIMARY KEY,
    organizer_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    organization_name VARCHAR(150),
    address TEXT
);



CREATE TABLE event_details (
    event_ID INT PRIMARY KEY,
    organizer_ID INT NOT NULL,
    event_name VARCHAR(200) NOT NULL,
    event_type VARCHAR(100),
    event_description TEXT,
    location VARCHAR(255),
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    estimated_budget DECIMAL(12,2),
    status VARCHAR(50),

    FOREIGN KEY (organizer_ID) REFERENCES event_organized_details(organizer_ID)
);


CREATE TABLE event_attendee_details (
    attendee_ID INT PRIMARY KEY,
    event_ID INT NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(20),
    invitation_status VARCHAR(50),
    guest_type VARCHAR(50),
    notes TEXT,

    FOREIGN KEY (event_ID) REFERENCES event_details(event_ID)
);







INSERT INTO event_organized_details 
(organizer_ID, organizer_name, email, phone, organization_name, address)
VALUES
(1, 'Alice Johnson', 'alice@eventco.com', '1234567890', 'EventCo', '123 Main St, City A'),
(2, 'Michael Smith', 'm.smith@plannerhub.com', '9876543210', 'PlannerHub', '45 Central Ave, City B'),
(3, 'Priya Patel', 'priya@elitevents.com', '5551234567', 'Elite Events', '78 Rose Street, City C'),
(4, 'John Wilson', 'john@starsolutions.com', '7778889999', 'Star Solutions', '90 Sunset Blvd, City D');





INSERT INTO event_details 
(event_ID, organizer_ID, event_name, event_type, event_description, location, start_datetime, end_datetime, estimated_budget, status)
VALUES
(101, 1, 'Tech Innovation Summit', 'Conference', 'A conference about future technologies.', 'City A Convention Center', '2025-01-15 09:00:00', '2025-01-15 17:00:00', 25000.00, 'Scheduled'),

(102, 2, 'Music Fiesta 2025', 'Festival', 'Outdoor music and entertainment festival.', 'City B Stadium', '2025-03-20 15:00:00', '2025-03-20 23:00:00', 40000.00, 'Scheduled'),

(103, 3, 'Corporate Leadership Meeting', 'Business Meeting', 'Leadership & strategy planning.', 'Elite Towers, City C', '2025-02-10 10:00:00', '2025-02-10 16:00:00', 15000.00, 'Completed'),

(104, 4, 'Wedding Reception – Wilson Family', 'Wedding', 'Wedding celebration event.', 'City D Grand Hall', '2025-04-05 18:00:00', '2025-04-06 00:00:00', 30000.00, 'Scheduled'),

(105, 1, 'Startup Pitch Night', 'Networking', 'Event for startups to pitch ideas.', 'Innovation Hub, City A', '2025-05-12 17:00:00', '2025-05-12 21:00:00', 8000.00, 'Planning');



INSERT INTO event_attendee_details
(attendee_ID, event_ID, full_name, email, phone, invitation_status, guest_type, notes)
VALUES
-- Event 101 Attendees
(1, 101, 'Robert King', 'robertk@example.com', '1112223333', 'Accepted', 'VIP', 'Keynote Guest'),
(2, 101, 'Sara Lee', 'saralee@example.com', '2223334444', 'Pending', 'General', ''),
(3, 101, 'Tom Harris', 'tomh@example.com', '3334445555', 'Accepted', 'Speaker', 'Panel Discussion'),

-- Event 102 Attendees
(4, 102, 'Emily Carter', 'emilyc@example.com', '4445556666', 'Accepted', 'VIP', 'Performer'),
(5, 102, 'George Brown', 'georgeb@example.com', '5556667777', 'Declined', 'General', ''),
(6, 102, 'Natalie Green', 'natalie@example.com', '6667778888', 'Pending', 'General', ''),

-- Event 103 Attendees
(7, 103, 'Chris Walker', 'chrisw@example.com', '7778889999', 'Accepted', 'Staff', 'Organizer team'),
(8, 103, 'Helen Stone', 'helenstone@example.com', '8889990000', 'Accepted', 'General', ''),
(9, 103, 'Daniel Ross', 'danielr@example.com', '9990001111', 'Pending', 'General', ''),

-- Event 104 Attendees
(10, 104, 'Linda Wilson', 'lindaw@example.com', '1110009999', 'Accepted', 'Family', 'Bride aunt'),
(11, 104, 'Kevin Moore', 'kevinm@example.com', '2221110000', 'Accepted', 'Family', 'Groom cousin'),
(12, 104, 'Sophia Turner', 'sophiat@example.com', '3332221111', 'Pending', 'General', ''),

-- Event 105 Attendees
(13, 105, 'Jason Patel', 'jasonp@example.com', '4443332222', 'Accepted', 'Investor', ''),
(14, 105, 'Megan Foster', 'meganf@example.com', '5554443333', 'Declined', 'General', ''),
(15, 105, 'Ava Martin', 'avam@example.com', '6665554444', 'Pending', 'General', '');
