use shipshop;

-- Create index on order_items.product_id
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- Create index on order_items.created_at
CREATE INDEX idx_order_items_created_at ON order_items(created_at);

-- Create index on order_item_refunds.order_item_id
CREATE INDEX idx_order_item_refunds_order_item_id ON order_item_refunds(order_item_id);

-- Create index on order_item_refunds.created_at
CREATE INDEX idx_order_item_refunds_created_at ON order_item_refunds(created_at);
