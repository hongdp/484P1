INSERT INTO Location(CITY,STATE,COUNTRY)
SELECT DISTINCT city, state, country
FROM (
	SELECT hometown_city as city, hometown_state as state, hometown_country as country
	FROM keykholt.PUBLIC_USER_INFORMATION
	UNION 
	SELECT DISTINCT current_city as city, current_state as state, hometown_country as country
	FROM keykholt.PUBLIC_USER_INFORMATION
	UNION 
	SELECT DISTINCT event_city as city, event_state as state, event_country as country
	FROM keykholt.PUBLIC_EVENT_INFORMATION)
	;


INSERT INTO Education_program(institution_name, concentration, degree)
SELECT DISTINCT institution_name, program_concentration, program_degree
FROM keykholt.PUBLIC_USER_INFORMATION;

INSERT INTO FB_USER(USER_ID, FIRST_NAME, LAST_NAME, YEAR_OF_BIRTH, MONTH_OF_BIRTH, DATE_OF_BIRTH, GENDER, home_town_id, current_location_id)
SELECT DISTINCT u.USER_ID, u.FIRST_NAME, u.LAST_NAME, u.YEAR_OF_BIRTH, u.MONTH_OF_BIRTH, u.DAY_OF_BIRTH, u.GENDER, h.location_id, c.location_id
FROM keykholt.PUBLIC_USER_INFORMATION u
LEFT JOIN location h ON u.hometown_city=h.city and u.hometown_state=h.state and u.hometown_country=h.country 
LEFT JOIN location c ON u.current_city=c.city and u.current_state=c.state and u.current_country=c.country;

INSERT INTO Event(Event_ID, Event_creator_ID, Event_location_ID, Event_host, Event_name, Event_tagline, Event_description,
	Event_type, Event_subtype, Event_start_time, Event_end_time, Event_location)
SELECT DISTINCT e.Event_ID, e.Event_creator_ID, l.location_ID, e.Event_host, e.Event_name, e.Event_tagline, e.Event_description,
	e.Event_type, e.Event_subtype, e.Event_start_time, e.Event_end_time, e.Event_location
FROM keykholt.PUBLIC_EVENT_INFORMATION e
LEFT JOIN Location l ON e.EVENT_CITY=l.CITY AND e.EVENT_STATE=l.STATE AND e.EVENT_COUNTRY=l.COUNTRY;

INSERT INTO Attended_program(user_ID, program_ID, year_of_graduation)
SELECT DISTINCT u.user_ID, e.program_ID, u.program_year
FROM keykholt.PUBLIC_USER_INFORMATION u, Education_program e
WHERE u.institution_name=e.institution_name and u.program_concentration=e.concentration and u.program_degree=e.degree;

INSERT INTO Friendship(user1_ID, user2_ID)
SELECT DISTINCT u1.user_ID, u2.user_ID
FROM keykholt.PUBLIC_ARE_FRIENDS f, FB_USER u1, FB_USER u2
WHERE f.user1_ID=u1.user_ID and f.user2_ID=u2.user_ID;

INSERT INTO Photo(photo_ID, album_ID, photo_caption, photo_created_time, photo_modified_time, photo_link)
SELECT DISTINCT PHOTO_ID, ALBUM_ID, PHOTO_CAPTION, PHOTO_CREATED_TIME, PHOTO_MODIFIED_TIME, PHOTO_LINK
FROM keykholt.PUBLIC_PHOTO_INFORMATION;

INSERT INTO Album(album_ID, cover_photo_ID, owner_user_ID, album_name, album_created_time, album_modified_time, album_link, album_visibility)
SELECT DISTINCT album_ID, cover_photo_ID, owner_ID, album_name, album_created_time, album_modified_time, album_link, album_visibility
FROM keykholt.PUBLIC_PHOTO_INFORMATION;

INSERT INTO Tag(photo_ID, user_ID, tag_x_coordinate, tag_y_coordinate, tag_created_time)
SELECT DISTINCT photo_ID, tag_subject_ID, tag_x_coordinate, tag_y_coordinate, tag_created_time
FROM keykholt.PUBLIC_TAG_INFORMATION;