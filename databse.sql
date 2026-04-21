-- #################################################
-- KIMVPS - Database Schema
-- System: MySQL / MariaDB
-- Developer: TheOfficialKim
-- #################################################

-- สร้างฐานข้อมูล KimVPS
CREATE DATABASE IF NOT EXISTS kimvps_db;
USE kimvps_db;

-- 1. ตารางเก็บข้อมูลเซิร์ฟเวอร์ (Nodes)
CREATE TABLE IF NOT EXISTS vps_nodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    node_name VARCHAR(50) NOT NULL,
    ip_address VARCHAR(45) UNIQUE,
    location VARCHAR(100) DEFAULT 'Loei, Thailand',
    status ENUM('ONLINE', 'OFFLINE', 'MAINTENANCE') DEFAULT 'ONLINE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. ตารางเก็บ Log การใช้งาน (Resource Logs)
CREATE TABLE IF NOT EXISTS system_logs (
    log_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    node_id INT,
    cpu_load DECIMAL(5,2),
    ram_usage DECIMAL(5,2),
    net_traffic DECIMAL(10,2),
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (node_id) REFERENCES vps_nodes(id)
);

-- 3. ตารางเก็บข้อมูล Admin (สำหรับระบบที่คุณเคยอยากได้)
CREATE TABLE IF NOT EXISTS admin_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    last_login DATETIME,
    role VARCHAR(20) DEFAULT 'admin'
);

-- #################################################
-- จำลองการเพิ่มข้อมูลเบื้องต้น (Mock Data)
-- #################################################

INSERT INTO vps_nodes (node_name, ip_address, status) 
VALUES ('KIM-NODE-01', '192.168.1.10', 'ONLINE');

INSERT INTO admin_users (username, password_hash) 
VALUES ('TheOfficialKim', 'HASHED_PASSWORD_EXAMPLE_12345');

-- คำสั่งสำหรับดึงข้อมูลดูสถานะล่าสุด
-- SELECT * FROM vps_nodes WHERE status = 'ONLINE';
