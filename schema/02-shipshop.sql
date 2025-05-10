use shipshop;

create table products(
	product_id bigint,
    created_at datetime,
    product_name varchar(120),
    primary key (product_id)
);

select * from products;
select * from order_items;
select * from order_item_refunds;

insert into products values ( 1,'2012-03-19 09:00:00','The Original Mr. Fuzzy'), (2, '2013-01-06 13:00:00','The Forever Love Bear');
alter table order_items add column product_id bigint;

update order_items set product_id=1 where order_item_id between 1 and 1000;

alter table order_items add constraint foreign key (product_id) references products(product_id);


