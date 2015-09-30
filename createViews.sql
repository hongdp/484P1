CREATE VIEW VIEW_USER_INFORMATION
AS
SELECT u.user_ID USER_ID,
	u.first_name FIRST_NAME,
	u.last_name LAST_NAME,
	u.year_of_birth YEAR_OF_BIRTH,
	u.month_of_birth MONTH_OF_BIRTH,
	u.date_of_birth DAY_OF_BIRTH,
	u.gender GENDER,
	c.city CURRENT_CITY,
	c.state CURRENT_STATE,
	c.country CURRENT_COUNTRY,
	h.city HOMETOWN_CITY,
	h.state HOMETOWN_STATE,
	h.country HOMETOWN_COUNTRY,
	e.institution_name INSTITUTION_NAME,
	a.year_of_graduation PROGRAM_YEAR,
	e.concentration PROGRAM_CONCENTRATION,
	e.degree PROGRAM_DEGREE
FROM FB_User u 
LEFT JOIN Location h ON u.home_town_ID = h.location_ID
LEFT JOIN Location c ON u.current_location_ID = c.location_ID
LEFT JOIN Attended_program a ON u.user_ID = a.user_ID
LEFT JOIN Education_program e ON a.program_ID = e.program_ID;

CREATE VIEW VIEW_ARE_FRIENDS
AS
SELECT user1_ID USER1_ID, user2_ID USER2_ID
FROM Friendship;

CREATE VIEW VIEW_PHOTO_INFORMATION
AS
SELECT a.album_ID ALBUM_ID,
	a.owner_user_ID OWNER_ID,
	a.cover_photo_ID COVER_PHOTO_ID,
	a.album_name ALBUM_NAME,
	a.album_created_time ALBUM_CREATED_TIME,
	a.album_modified_time ALBUM_MODIFIED_TIME,
	a.album_link ALBUM_LINK,
	a.album_visibility ALBUM_VISIBILITY,
	p.photo_ID PHOTO_ID,
	p.photo_caption PHOTO_CAPTION,
	p.photo_created_time PHOTO_CREATED_TIME,
	p.photo_modified_time PHOTO_MODIFIED_TIME,
	p.photo_link PHOTO_LINK
FROM Photo p
LEFT JOIN Album a ON p.album_ID = a.album_ID;

CREATE VIEW VIEW_TAG_INFORMATION
AS
SELECT photo_ID PHOTO_ID,
	user_ID TAG_SUBJECT_ID,
	tag_created_time TAG_CREATED_TIME,
	tag_x_coordinate TAG_X_COORDINATE,
	tag_y_coordinate TAG_Y_COORDINATE
FROM Tag;

CREATE VIEW VIEW_EVENT_INFORMATION
AS
SELECT e.Event_ID EVENT_ID,
	e.Event_creator_ID EVENT_CREATOR_ID,
	e.Event_name EVENT_NAME,
	e.Event_tagline EVENT_TAGLINE,
	e.Event_description EVENT_DESCRIPTION,
	e.Event_host EVENT_HOST,
	e.Event_type EVENT_TYPE,
	e.Event_subtype EVENT_SUBTYPE,
	e.Event_location EVENT_LOCATION,
	l.city EVENT_CITY,
	l.state EVENT_STATE,
	l.country EVENT_COUNTRY,
	e.Event_start_time EVENT_START_TIME,
	e.Event_end_time EVENT_END_TIME
FROM Event e
LEFT JOIN Location l
ON e.Event_location_ID = l.location_ID;