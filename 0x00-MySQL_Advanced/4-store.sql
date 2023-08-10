-- SQL Script to Create Trigger to Decrease Item Quantity After Adding a New Order

DELIMITER //

CREATE TRIGGER decrease_quantity_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Decrease the item quantity by the order quantity
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE id = NEW.item_id;
END;
//

DELIMITER ;