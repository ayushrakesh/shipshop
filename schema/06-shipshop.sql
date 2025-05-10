use shipshop;

select * from order_items;
select * from orders where items_purchased >= 2;

delimiter //

create procedure order_performance
(in startDate date, in endDate date)
begin
	select count(*) as total_orders,sum(price_usd) as total_revenue from orders where date(created_at) between startDate and endDate;
end //

delimiter ;

show procedure status where db = 'shipshop';
drop procedure order_performance;

call order_performance('2013-12-01','2013-12-31');
