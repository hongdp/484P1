INSERT INTO Location(CITY,STATE,COUNTRY)
SELECT DISTINCT city, state, country
FROM(
	SELECT hometown_city as city, hometown_state as state, hometown_country as country
	FROM keykholt.PUBLIC_USER_INFORMATION;
	UNION
	SELECT DISTINCT current_city as city, current_state as state, hometown_country as country
	FROM keykholt.PUBLIC_USER_INFORMATION;
	UNION
	SELECT DISTINCT event_city as city, event_state as state, event_country as country
	FROM keykholt.PUBLIC_EVENT_INFORMATION;
)


INSERT INTO Education_program(institution_name, concentration, degree)
SELECT DISTINCT institution_name, program_concentration, program_degree
FROM keykholt.PUBLIC_USER_INFORMATION;

INSERT INTO FB_USER(USER_ID, FIRST_NAME, YEAR_OF_BIRTH, MONTH_OF_BIRTH, DATE_OF_BIRTH, GENDER, home_town_id, current_location_id)
SELECT DISTINCT u.USER_ID, u.FIRST_NAME, u.YEAR_OF_BIRTH, u.MONTH_OF_BIRTH, u.DAY_OF_BIRTH, u.GENDER, h.location_id, c.location_id
FROM keykholt.PUBLIC_USER_INFORMATION u, Location h, Location c
WHERE u.hometown_city=h.city and u.hometown_state=h.state and u.hometown_country=h.country 
  and u.current_city=c.city and u.current_state=c.state and u.current_country=c.country;

INSERT INTO Event(Event_ID, Event_creator_ID, Event_location_ID, Event_host, Event_name, Event_tagline, Event_description,
	Event_type, Event_subtype, Event_start_time, Event_end_time, Event_location)
SELECT DISTINCT e.Event_ID, e.Event_creator_ID, l.location_ID, e.Event_host, e.Event_name, e.Event_tagline, e.Event_description,
	e.Event_type, e.Event_subtype, e.Event_start_time, e.Event_end_time, e.Event_location
FROM keykholt.PUBLIC_EVENT_INFORMATION e, Location l
WHERE e.EVENT_CITY=l.CITY AND e.EVENT_STATE=l.STATE AND e.EVENT_COUNTRY=l.COUNTRY;

