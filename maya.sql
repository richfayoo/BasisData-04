INSERT INTO users (nama, email, password, role, tanggal_lahir, jenis_kelamin) 
VALUES ('Maya', 'maya@example.com', 'password123', 'ibu', '1987-01-15', 'wanita');

INSERT INTO meal_planner (user_id, tanggal, makanan, kalori, status) 
VALUES (1, '2024-09-26', 'Salad Sayur', 200, 'direncanakan');

SELECT * FROM activity_scheduler WHERE user_id = 1;

CREATE VIEW view_meal_planner AS
SELECT users.nama, meal_planner.tanggal, meal_planner.makanan, meal_planner.kalori, meal_planner.status
FROM meal_planner
JOIN users ON meal_planner.user_id = users.user_id;
