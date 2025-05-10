use shipshop;

create table website_sessions(
	website_session_id bigint,
	created_at datetime,
    user_id bigint,
    is_repeat_session bool,
    utm_source varchar(50),
    utm_campaign varchar(50),
    utm_content varchar(50),
    device_type varchar(25),
    http_referer varchar(100),
    primary key (website_session_id)
);

select * from website_sessions;

create view monthly_sessions as
select 
	year(created_at) as  year,
	month(created_at) as month,
	utm_source,
	utm_campaign,
	count(website_session_id)
from website_sessions
group by 1,2,3,4;

select * from monthly_sessions;