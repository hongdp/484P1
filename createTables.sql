CREATE TABLE Location(
	location_ID INTEGER NOT NULL,
	city VARCHAR2(100),
	state VARCHAR2(100),
	country VARCHAR2(100),
	PRIMARY KEY (location_ID)
);

CREATE TABLE FB_User(
	user_ID VARCHAR2(100) NOT NULL,
	first_name VARCHAR2(100) NOT NULL,
	last_name VARCHAR2(100) NOT NULL,
	year_of_birth NUMBER(38),
	month_of_birth NUMBER(38),
	date_of_birth NUMBER(38),
	gender VARCHAR2(100),
	home_town_ID INTEGER,
	current_location_ID INTEGER,
	PRIMARY KEY (user_ID),
	FOREIGN KEY (home_town_ID) REFERENCES Location,
	FOREIGN KEY (current_location_ID) REFERENCES Location
);

CREATE TABLE Event(
	Event_ID VARCHAR2(100) NOT NULL,
	Event_creator_ID VARCHAR2(100) NOT NULL,
	Event_location_ID INTEGER,
	Event_host VARCHAR2(100) NOT NULL,
	Event_name VARCHAR2(100) NOT NULL,
	Event_tagline VARCHAR2(1000),
	Event_description VARCHAR2(4000),
	Event_type VARCHAR2(100) NOT NULL,
	Event_subtype VARCHAR2(100) NOT NULL,
	Event_start_time TIMESTAMP(6) NOT NULL,
	Event_end_time TIMESTAMP(6) NOT NULL,
	Event_location VARCHAR2(100),
    PRIMARY KEY (Event_ID),
    FOREIGN KEY (Event_creator_ID) REFERENCES FB_User,
    FOREIGN KEY (Event_location_ID) REFERENCES Location
);

CREATE TABLE Participate(
	Event_ID VARCHAR2(100) NOT NULL,
	user_ID VARCHAR2(100) NOT NULL,
	confirmation VARCHAR2(100),
	PRIMARY KEY (Event_ID, user_ID),
	FOREIGN KEY (Event_ID) REFERENCES Event,
	FOREIGN Key (user_ID) REFERENCES FB_User
);

CREATE TABLE Education_program(
	program_ID INTEGER NOT NULL,
	institution_name VARCHAR2(100),
	concentration CHAR(100),
	degree VARCHAR2(100),
	PRIMARY KEY (program_ID)
);

CREATE TABLE Attended_program(
	user_ID VARCHAR2(100) NOT NULL,
	program_ID INTEGER NOT NULL,
	year_of_graduation NUMBER(38),
	PRIMARY KEY (user_ID, program_ID),
	FOREIGN KEY (user_ID) REFERENCES FB_User,
	FOREIGN KEY (program_ID) REFERENCES Education_program
);

CREATE TABLE Message(
	message_ID INTEGER,
	message_content VARCHAR2(4000),
	sent_time TIMESTAMP(6),
	sender_ID VARCHAR2(100),
	receiver_ID VARCHAR2(100),
	PRIMARY KEY (message_ID),
	FOREIGN KEY (sender_ID) REFERENCES FB_User,
	FOREIGN KEY (receiver_ID) REFERENCES FB_User
);


CREATE TABLE Friendship(
	user1_ID VARCHAR2(100),
	user2_ID VARCHAR2(100),
	FOREIGN KEY (user1_ID) REFERENCES FB_User,
	FOREIGN KEY (user2_ID) REFERENCES FB_User
);

CREATE TABLE Photo(
	photo_ID VARCHAR2(100) NOT NULL,
	album_ID VARCHAR2(100) NOT NULL,
	photo_caption VARCHAR2(2000),
	photo_created_time TIMESTAMP(6) NOT NULL,
	photo_modified_time TIMESTAMP(6) NOT NULL,
	photo_linke VARCHAR2(2000) NOT NULL,
	PRIMARY KEY (photo_ID)
);

CREATE TABLE Album(
	album_ID VARCHAR2(100) NOT NULL,
	cover_photo_ID VARCHAR2(100) NOT NULL,
	owner_user_ID VARCHAR2(100) NOT NULL,
	album_name VARCHAR2(100) NOT NULL,
	album_created_time TIMESTAMP(6) NOT NULL,
	album_modified_time TIMESTAMP(6) NOT NULL,
	album_link VARCHAR2(2000) NOT NULL,
	album_visibility VARCHAR2(100) NOT NULL,
	PRIMARY Key (album_ID),
	FOREIGN Key (owner_user_ID) REFERENCES FB_User
);

ALTER TABLE Photo ADD CONSTRAINT FK_AlbumIDInPhoto FOREIGN KEY (album_ID) REFERENCES Album INITIALLY DEFERRED DEFERRABLE;
ALTER TABLE Album ADD CONSTRAINT FK_CoverPhotoID FOREIGN Key (cover_photo_ID) REFERENCES Photo INITIALLY DEFERRED DEFERRABLE;
CREATE TABLE Tag(
	photo_ID VARCHAR2(100) NOT NULL,
	user_ID VARCHAR2(100) NOT NULL,
	tag_x_coordinate Number NOT NULL,
	tag_y_coordinate Number NOT NULL,
	tag_created_time TIMESTAMP(6) NOT NULL,
	PRIMARY Key (photo_ID, user_ID),
	FOREIGN Key (photo_ID) REFERENCES Photo,
	FOREIGN Key (user_ID) REFERENCES FB_User
);
