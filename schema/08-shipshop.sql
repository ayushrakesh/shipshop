/*
1) Import the recent order_items and order_item_refunds data into the database. 
Verify the order summary trigger you created previously still works. 
If not, recreate it.                                                                     
-- 17.order_items_2014_Mar          -- 19.order_item_refunds_2014_Mar                                                                    
-- 18.order_items_2014_Apr          -- 20.order_item_refunds_2014_Apr
*/ 


/*
2) Import the website_sessions and website_pageviews data for March and April.
-- 21.website_sessions_2014_Mar     -- 23.website_pageviews_2014_Mar                                                                   
-- 22.website_sessions_2014_Apr     -- 24.website_pageviews_2014_Apr
*/


/*
3) The company is adding chat support to the website. 
You’ll need to design a database plan to track which customers and sessions 
utilize chat, and which chat representatives serve each customer.
*/


/*
4) Based on your tracking plan for chat support, 
create an EER diagram that incorporates your new tables 
into the existing database schema. Include table relationships.
*/


/*
5) Create the tables from your chat support tracking plan in the database. 
Include relationships to existing tables where applicable.  
*/


/*
6) Using the new tables, create a stored procedure that will allow 
the CEO to pull a count of chats handled by chat representative 
for a given time period, with a simple CALL statement that includes two dates. 
*/


/*
7) The potential acquirers need some data. Create two Views, one detailing 
monthly order volume and revenue, the other showing monthly website traffic. 
Create a new User, with access just to these Views.
*/


/*
8) The potential acquirers are commissioning a third-party security study. 
Your CEO wants to get in front of it. Provide her with a list of your 
top data security threats and anything you think you could do to mitigate risk. 
*/
use shipshop;

select count(*) from order_items;
select count(*) from order_item_refunds;
select * from products;
select  count(*) from orders;
select count(*) from website_sessions;
select count(*) from website_pageviews;

create table users(
	user_id bigint,
    created_at datetime,
    first_name varchar (50),
    last_name varchar (50),
    primary key (user_id)
);

create table support_members(
	support_member_id bigint,
    created_at datetime,
    first_name varchar(50),
    last_name varchar(50),
    primary key (support_member_id)
);

create table chat_sessions(
	chat_session_id bigint,
    created_at datetime,
    user_id bigint,
    support_member_id bigint,
    website_session_id bigint,
    primary key (chat_session_id)
);

create table chat_messages(
	chat_message_id bigint,
    created_at datetime,
	chat_session_id bigint,
	user_id bigint,
	support_member_id bigint,
	message_text varchar(200),
	primary key (chat_message_id)	
);

delimiter //
create procedure support_member_chats (in sup_mem_id bigint, in startDate date, in endDate date)
begin
	select count(*) as number_of_chats from chat_sessions where support_member_id = sup_mem_id and (date(created_at) between startDate and endDate);
end //
delimiter ;

call support_member_chats(1,'2014-01-01','2014-01-31');

create view monthly_orders as
select year(created_at) as year,month(created_at) as month , sum(price_usd) as revenue 
from orders
group by 1,2 
order by 1,2;

select * from monthly_orders;
drop view monthly_orders;


create view monthly_website_sessions as
select year(created_at) as year,month(created_at) as month , count(website_session_id) as traffic
from website_sessions
group by 1,2 
order by 1,2;

drop view monthly_website_sessions;
select * from monthly_website_sessions;
