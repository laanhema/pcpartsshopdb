// 1. delete all nodes and relationships
MATCH (n) DETACH DELETE n;

// 2. delete constraints (including indexes created with them)
DROP CONSTRAINT customer_id_unique IF EXISTS;
DROP CONSTRAINT customer_email_unique IF EXISTS;
DROP CONSTRAINT product_id_unique IF EXISTS;
DROP CONSTRAINT product_name_unique IF EXISTS;
DROP CONSTRAINT order_id_unique IF EXISTS;
DROP CONSTRAINT order_ptn_unique IF EXISTS;
DROP CONSTRAINT review_id_unique IF EXISTS;

// 3. delete additional indexes
DROP INDEX idx_product_type IF EXISTS;
DROP INDEX idx_product_price_eur IF EXISTS;
DROP INDEX idx_product_manufacturer IF EXISTS;
DROP INDEX idx_review_rating_stars IF EXISTS;
DROP INDEX idx_order_total_price_eur IF EXISTS;