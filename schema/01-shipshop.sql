use shipshop;

create table order_items(
	order_item_id bigint,
    created_at datetime,
    order_id bigint,
    price_usd decimal(6,2),
    cogs_usd decimal(6,2),
    website_session_id bigint,
    primary key (order_item_id)
);

create table order_items_refunds(
	order_item_refund_id bigint,
    created_at datetime,
    order_item_id bigint,
    order_id bigint,
    refund_amount_usd decimal(6,2),
    primary key (order_item_refund_id),
    foreign key (order_item_id) references order_items(order_item_id)
);

select * from order_items;
alter table order_items_refunds rename to order_item_refunds;
select * from order_item_refunds;

delete from order_item_refunds where order_item_refund_id between 6 and 10;

select count(*),min(created_at),max(created_at) from order_item_refunds;
select count(*),min(created_at),max(created_at) from order_items;
