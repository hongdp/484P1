CREATE TABLE Location(
	location_ID INTEGER,
	city VARCHAR2(100),
	state VARCHAR2(100),
	country VARCHAR2(100),
	PRIMARY KEY (location_ID)
);

CREATE TABLE FB_User(
	user_ID VARCHAR2(100),
	first_name VARCHAR2(100),
	last_name VARCHAR2(100),
	year_of_birth INTEGER,
	month_of_birth INTEGER,
	date_of_birth INTEGER,
	gender VARCHAR2(100),
	home_town_ID INTEGER,
	current_location_ID INTEGER,
	PRIMARY KEY (user_ID),
	FOREIGN KEY (home_town_ID) REFERENCES Location,
	FOREIGN KEY (current_location_ID) REFERENCES Location
);

CREATE TABLE Event(
	Event_ID VARCHAR2(100),
	Event_creator_ID VARCHAR2(100),
	Event_location_ID INTEGER,
	Event_host VARCHAR2(100),
	Event_name VARCHAR2(100),
	Event_tagline VARCHAR2(1000),
	Event_description VARCHAR2(4000),
	Event_type VARCHAR2(100),
	Event_subtype VARCHAR2(100),
	Event_start_time TIMESTAMP(6),
	Event_end_time TIMESTAMP(6),
	Event_location VARCHAR2(100),
    PRIMARY KEY (Event_ID),
    FOREIGN KEY (Event_creator_ID) REFERENCES FB_User,
    FOREIGN KEY (Event_location_ID) REFERENCES Location
);

CREATE TABLE Participate(
	Event_ID VARCHAR2(100),
	user_ID VARCHAR2(100),
	confirmation VARCHAR2(100),
	PRIMARY KEY (Event_ID, user_ID),
	FOREIGN KEY (Event_ID) REFERENCES Event,
	FOREIGN Key (user_ID) REFERENCES FB_User
);

CREATE TABLE Education_program(
	program_ID INTEGER,
	institution_name VARCHAR2(100),
	concentration VARCHAR2(100),
	degree VARCHAR2(100),
	PRIMARY KEY (program_ID)
);

CREATE TABLE Attended_program(
	user_ID VARCHAR2(100),
	program_ID INTEGER,
	PRIMARY KEY (user_ID, program_ID),
	FOREIGN KEY (user_ID) REFERENCES FB_User,
	FOREIGN KEY (program_ID) REFERENCES Education_program,
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
	photo_ID VARCHAR2(100),
	album_ID VARCHAR2(100),
	photo_caption VARCHAR2(2000),
	photo_created_time TIMESTAMP(6),
	photo_modified_time TIMESTAMP(6),
	photo_linke VARCHAR2(2000),
	PRIMARY KEY (photo_ID),
	FOREIGN KEY (album_ID) REFERENCES Album
);

CREATE TABLE Album(
	album_ID VARCHAR2(100),
	cover_photo_ID VARCHAR2(100),
	owner_user_ID VARCHAR2(100),
	album_name VARCHAR2(100),
	album_created_time TIMESTAMP(6),
	album_modified_time TIMESTAMP(6),
	album_link VARCHAR2(2000),
	album_visibility VARCHAR2(100),
	PRIMARY Key (album_ID),
	FOREIGN Key (cover_photo_ID) REFERENCES Photo,
	FOREIGN Key (owner_user_ID) REFERENCES FB_User
);

CREATE TABLE Tag(
	photo_ID VARCHAR2(100),
	user_ID VARCHAR2(100),
	tag_x_coordinate Number,
	tag_y_coordinate Number,
	tag_created_time TIMESTAMP(6),
	PRIMARY Key (photo_ID, user_ID),
	FOREIGN Key (photo_ID) REFERENCES Photo,
	FOREIGN Key (user_ID) REFERENCES FB_User,
);
