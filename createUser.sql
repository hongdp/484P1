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
	PRIMARY KEY (user_ID)
);
