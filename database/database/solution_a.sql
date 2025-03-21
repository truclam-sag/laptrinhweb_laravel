-- 1. Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users_BKE ORDER BY user_name ASC;

-- 2. Lấy ra 07 người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users_BKE ORDER BY user_name ASC LIMIT 7;

-- 3. Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z), trong đó tên người dùng có chữ a
SELECT * FROM users_BKE WHERE user_name LIKE '%a%' ORDER BY user_name ASC;

-- 4. Lấy ra danh sách người dùng trong đó tên người dùng bắt đầu bằng chữ m
SELECT * FROM users_BKE WHERE user_name LIKE 'm%';

-- 5. Lấy ra danh sách người dùng trong đó tên người dùng kết thúc bằng chữ i
SELECT * FROM users_BKE WHERE user_name LIKE '%i';

-- 6. Lấy ra danh sách người dùng trong đó email người dùng là Gmail
SELECT * FROM users_BKE WHERE user_email LIKE '%@gmail.com';

-- 7. Lấy ra danh sách người dùng là Gmail, tên bắt đầu bằng chữ m
SELECT * FROM users_BKE WHERE user_email LIKE '%@gmail.com' AND user_name LIKE 'm%';

-- 8. Lấy ra danh sách người dùng là Gmail, tên có chữ i và chiều dài tên > 5
SELECT * FROM users_BKE WHERE user_email LIKE '%@gmail.com' AND user_name LIKE '%i%' AND LENGTH(user_name) > 5;

-- 9. Lấy ra danh sách người dùng có tên chứa a, chiều dài từ 5 đến 9, Gmail và tên email có chữ I
SELECT * FROM users_BKE WHERE user_email LIKE '%@gmail.com' AND user_email LIKE '%i%@gmail.com' AND user_name LIKE '%a%' AND LENGTH(user_name) BETWEEN 5 AND 9;

-- 10. Lấy ra danh sách người dùng thỏa các điều kiện tổ hợp
SELECT * FROM users_BKE WHERE 
  (user_name LIKE '%a%' AND LENGTH(user_name) BETWEEN 5 AND 9)
  OR (user_name LIKE '%i%' AND LENGTH(user_name) < 9)
  OR (user_email LIKE '%i%@gmail.com');