//添加索引
ALTER TABLE `shop_order_list` ADD INDEX shop_order_id ( `shop_order_id` );
//添加外建
ALTER TABLE `shop_order_list` ADD CONSTRAINT `shop_order_id` FOREIGN KEY (`shop_order_id`) REFERENCES `shop_orders` (`id`);