use shipshop;

-- one time query for populating data into orders table from order_items table 
insert into orders
	select
	order_id, 
	min(created_at) as created_at, 
	min(website_session_id) as  website_session_id, 
	sum(case
		when is_primary_item =1 then product_id else null end ) as primary_product_id,
	count(order_item_id) as items_purchased,
	sum(price_usd) as price_usd,
	sum(cogs_usd) as cogs_usd
	from order_items
	group by 1
	order by 1;
    
-- trigger for inserting new records into orders table
create trigger insert_orders
after insert
on order_items
for each row

replace into orders
	select
	order_id, 
	min(created_at) as created_at, 
	min(website_session_id) as  website_session_id, 
	sum(case
		when is_primary_item =1 then product_id else null end ) as primary_product_id,
	count(order_item_id) as items_purchased,
	sum(price_usd) as price_usd,
	sum(cogs_usd) as cogs_usd
	from order_items
    where order_id = new.order_id
	group by 1
	order by 1;

show triggers;

select * from orders;
select * from products;
select * from order_items;
select * from order_item_refunds;


