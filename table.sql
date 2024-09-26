CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('ibu', 'anak') NOT NULL,
    tanggal_lahir DATE,
    jenis_kelamin ENUM('pria', 'wanita') NOT NULL
);

CREATE TABLE meal_planner (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    tanggal DATE NOT NULL,
    makanan VARCHAR(255) NOT NULL,
    kalori INT,
    status ENUM('direncanakan', 'dimakan') DEFAULT 'direncanakan',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE grocery_list (
    list_id INT AUTO_INCREMENT PRIMARY KEY,
    meal_id INT,
    item VARCHAR(255) NOT NULL,
    kuantitas INT NOT NULL,
    status_pembelian ENUM('belum', 'dibeli') DEFAULT 'belum',
    FOREIGN KEY (meal_id) REFERENCES meal_planner(meal_id) ON DELETE CASCADE
);

CREATE TABLE activity_scheduler (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    nama_kegiatan VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    tanggal DATE NOT NULL,
    waktu TIME NOT NULL,
    status ENUM('terjadwal', 'selesai') DEFAULT 'terjadwal',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE health_tracker (
    tracker_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    tanggal DATE NOT NULL,
    jenis_aktivitas VARCHAR(255) NOT NULL,
    durasi INT,  -- Durasi dalam menit
    kalori_burned INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE personal_goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    nama_tujuan VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    target_tanggal DATE,
    status ENUM('dalam proses', 'tercapai') DEFAULT 'dalam proses',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
