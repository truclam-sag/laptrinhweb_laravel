-- 1. Liệt kê các hóa đơn của khách hàng: mã user, tên user, mã hóa đơn
SELECT u.user_id, u.user_name, o.order_id
FROM users_BKE u
JOIN orders_BKE o ON u.user_id = o.user_id;

-- 2. Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
FROM users_BKE u
LEFT JOIN orders_BKE o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name;

-- 3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm
SELECT o.order_id, COUNT(od.order_detail_id) AS so_san_pham
FROM orders_BKE o
JOIN order_details_BKE od ON o.order_id = od.order_id
GROUP BY o.order_id;

-- 4. Liệt kê thông tin mua hàng: mã user, tên user, mã đơn hàng, tên sản phẩm
SELECT u.user_id, u.user_name, o.order_id, p.product_name
FROM users_BKE u
JOIN orders_BKE o ON u.user_id = o.user_id
JOIN order_details_BKE od ON o.order_id = od.order_id
JOIN products_BKE p ON od.product_id = p.product_id
ORDER BY o.order_id;

-- 5. Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
FROM users_BKE u
LEFT JOIN orders_BKE o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY so_don_hang DESC
LIMIT 7;

-- 6. Liệt kê 7 người dùng mua sản phẩm Samsung hoặc Apple
SELECT DISTINCT u.user_id, u.user_name, o.order_id, p.product_name
FROM users_BKE u
JOIN orders_BKE o ON u.user_id = o.user_id
JOIN order_details_BKE od ON o.order_id = od.order_id
JOIN products_BKE p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
LIMIT 7;

-- 7. Liệt kê danh sách mua hàng kèm tổng tiền mỗi đơn hàng
SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien
FROM users_BKE u
JOIN orders_BKE o ON u.user_id = o.user_id
JOIN order_details_BKE od ON o.order_id = od.order_id
JOIN products_BKE p ON od.product_id = p.product_id
GROUP BY u.user_id, u.user_name, o.order_id;

-- 8. Mỗi user chỉ lấy 1 đơn hàng có giá tiền lớn nhất
SELECT t.user_id, t.user_name, t.order_id, t.tong_tien
FROM (
    SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien,
           RANK() OVER (PARTITION BY u.user_id ORDER BY SUM(p.product_price) DESC) AS rnk
    FROM users_BKE u
    JOIN orders_BKE o ON u.user_id = o.user_id
    JOIN order_details_BKE od ON o.order_id = od.order_id
    JOIN products_BKE p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
) t
WHERE t.rnk = 1;

-- 9. Mỗi user chỉ lấy 1 đơn hàng có giá tiền nhỏ nhất (thêm số sản phẩm)
SELECT t.user_id, t.user_name, t.order_id, t.tong_tien, t.so_san_pham
FROM (
    SELECT u.user_id, u.user_name, o.order_id,
           SUM(p.product_price) AS tong_tien,
           COUNT(od.order_detail_id) AS so_san_pham,
           RANK() OVER (PARTITION BY u.user_id ORDER BY SUM(p.product_price) ASC) AS rnk
    FROM users_BKE u
    JOIN orders_BKE o ON u.user_id = o.user_id
    JOIN order_details_BKE od ON o.order_id = od.order_id
    JOIN products_BKE p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
) t
WHERE t.rnk = 1;

-- 10. Mỗi user chỉ lấy 1 đơn hàng có số sản phẩm nhiều nhất (kèm tổng tiền)
SELECT t.user_id, t.user_name, t.order_id, t.tong_tien, t.so_san_pham
FROM (
    SELECT u.user_id, u.user_name, o.order_id,
           SUM(p.product_price) AS tong_tien,
           COUNT(od.order_detail_id) AS so_san_pham,
           RANK() OVER (PARTITION BY u.user_id ORDER BY COUNT(od.order_detail_id) DESC) AS rnk
    FROM users_BKE u
    JOIN orders_BKE o ON u.user_id = o.user_id
    JOIN order_details_BKE od ON o.order_id = od.order_id
    JOIN products_BKE p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
) t
WHERE t.rnk = 1;
