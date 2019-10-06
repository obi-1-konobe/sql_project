-- query 1
SELECT 
    products.product, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    input_stock_id = 1
        AND action_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY products.product
ORDER BY products.product;

-- query 2
SELECT 
    products.product, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    output_stock_id = 1
        AND action_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY products.product
ORDER BY products.product;

-- query 3
SELECT 
    categories.category, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    categories ON products.category_id = categories.id
WHERE
    input_stock_id = 2
        AND action_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY categories.category
ORDER BY categories.category;
	
-- query 4
SELECT 
    brands.brand, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        LEFT JOIN
    brands ON products.brand_id = brands.id
WHERE
    input_stock_id = 1
        AND action_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY brands.brand
ORDER BY brands.brand;
	
-- query 5
SELECT 
    product, SUM(input) - SUM(output) AS result
FROM
    (SELECT 
        products.product,
            IF(output_stock_id = 1, qty, 0) AS output,
            IF(input_stock_id = 1, qty, 0) AS input
    FROM
        actions
    INNER JOIN products ON actions.product_id = products.id
    WHERE
        output_stock_id = 1
            OR input_stock_id = 1
            AND action_date < '2019-12-31') AS some_table
GROUP BY product
ORDER BY product;

-- query 6
SELECT 
    products.product, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    output_partner_id = 2
        AND action_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY products.product
ORDER BY products.product;
	
-- query 7
SELECT 
    products.product, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    output_partner_id = 2
        AND input_stock_id = 1
        AND action_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY products.product
ORDER BY products.product;
	
-- query 8
SELECT 
    products.product, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    output_stock_id = 1
        AND input_partner_id = 1
        AND action_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY products.product
ORDER BY products.product;
	
-- query 9
SELECT 
    partners.partner, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    partners ON actions.output_partner_id = partners.id
WHERE
    product_id = 1
        AND action_date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY partners.partner
ORDER BY total DESC , partners.partner;
	
-- query 10
SELECT 
    partners.partner, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
        INNER JOIN
    partners ON actions.input_partner_id = partners.id
WHERE
    product_id = 4
        AND action_date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY partners.partner
ORDER BY total DESC, partners.partner;
	
-- query 11
SELECT 
    products.product, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    input_stock_id = 1
        AND output_stock_id IN (2 , 3)
        AND action_date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY products.product
ORDER BY products.product;
	
-- query 12
SELECT 
    products.product, SUM(qty) AS total
FROM
    actions
        INNER JOIN
    products ON actions.product_id = products.id
WHERE
    output_stock_id = 1
        AND input_stock_id IN (2 , 3)
        AND action_date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY products.product
ORDER BY products.product;
	

	