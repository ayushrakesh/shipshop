use shipshop;

select * from website_sessions where created_at >= '2014-02-01';

create table website_pageviews( 	
	website_pageview_id bigint,
    created_at datetime,
    website_session_id bigint,
    pageview_url varchar(50),
    primary key (website_pageview_id)
);

select count(*) from website_pageviews;
select count(*) from order_items;
select count(*) from orders;
select count(*) from website_sessions;

drop table website_pageviews;