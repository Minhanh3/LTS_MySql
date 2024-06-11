SELECT * FROM DUAN ;
SELECT * FROM NHANVIEN ;
SELECT * FROM phancong ;
-- Đếm tổng số nhân viên trong công ty
SELECT COUNT(*) AS employees FROM nhanvien;
-- Đếm tổng số dự án đã được đề ra
SELECT COUNT(*) AS projects FROM duan;
-- Đếm tổng số nhân viên tham gia dự án số 1
SELECT COUNT(*) AS employees_in_project_1 
FROM phancong 
WHERE DuanID = 1;
-- Đếm số nhân viên tham gia mỗi dự án
SELECT DuanID, COUNT(*) AS employees 
FROM phancong 
GROUP BY DuanID;
-- Tính tổng giờ làm của nhân viên 1
SELECT SUM(Sogiolam) AS hours_worked 
FROM phancong 
WHERE NhanvienID = 1;
-- Tính tổng giờ làm của mỗi nhân viên
SELECT NhanvienID, SUM(Sogiolam) AS hours_worked
FROM phancong
GROUP BY NhanvienID;
-- Tìm nhân viên có tổng số giờ làm cao nhất dự án 1
SELECT NhanvienID, SUM(Sogiolam) AS hours_worked
FROM phancong
WHERE DuanID = 1
GROUP BY NhanvienID
ORDER BY hours_worked DESC LIMIT 1;
-- Tìm dự án có ít nhân viên tham gia nhất
SELECT DuanID, COUNT(DISTINCT NhanvienID) AS num_employees
FROM phancong
GROUP BY DuanID
ORDER BY num_employees ASC LIMIT 1;
-- Tìm nhân viên có số giờ làm cao nhất công ty
SELECT NhanvienID, SUM(Sogiolam) AS total_hours_worked
FROM phancong
GROUP BY NhanvienID
ORDER BY total_hours_worked DESC LIMIT 1;
-- Tính tổng giờ làm của mỗi dự án
SELECT DuanID, SUM(Sogiolam) AS hours_worked
FROM phancong
GROUP BY DuanID;
-- Tính số giờ làm trung bình trong mỗi dự án
SELECT DuanID, AVG(Sogiolam) AS avg_hours
FROM phancong
GROUP BY DuanID;
-- Tính số giờ làm trung bình mỗi nhân viên (mỗi dự án làm trung bình bao nhiêu giờ)
SELECT NhanvienID, DuanID, AVG(Sogiolam) AS avg_hours_project
FROM phancong
GROUP BY NhanvienID, DuanID 
ORDER BY NhanvienID, DuanID DESC ;
-- Tìm 3 dự án có tổng số giờ làm của nhân viên là cao nhất
SELECT DuanID, SUM(Sogiolam) AS hours_worked
FROM phancong
GROUP BY DuanID
ORDER BY hours_worked DESC
LIMIT 3;
-- Tìm 3 nhân viên có số giờ làm cao nhất công ty
SELECT NhanvienID, SUM(Sogiolam) AS total_hours_worked
FROM phancong
GROUP BY NhanvienID
ORDER BY total_hours_worked DESC
LIMIT 3;
-- Tìm những nhân viên có tổng giờ làm trên 300 giờ
SELECT NhanvienID, SUM(Sogiolam) AS total_hours_worked 
FROM phancong
GROUP BY NhanvienID
HAVING total_hours_worked > 300 ;
-- Tìm những nhân viên có tổng giờ làm từ 150 – 200 giờ
SELECT NhanvienID, SUM(Sogiolam) AS total_hours_worked 
FROM phancong
GROUP BY NhanvienID
HAVING total_hours_worked between 150 and 200 ;
-- Đếm mỗi thành phố có bao nhiêu nhân viên
SELECT COUNT(NHANVIENID) AS TOTAL_NHANVIEN, DIACHI  FROM NHANVIEN 
GROUP BY DIACHI ; 
-- Tìm 3 nhân viên có số giờ làm thấp nhất công ty (không tính những nhân viên chưa tham gia dự án nào)
SELECT NHANVIENID , SUM(SOGIOLAM) AS GIO_LAM FROM PHANCONG
GROUP BY NHANVIENID 
ORDER BY GIO_LAM LIMIT 3 ;
-- Tìm những thành phố nào có ít hơn 3 nhân viên
SELECT COUNT(NHANVIENID) AS TOTAL_NHANVIEN, DIACHI  FROM NHANVIEN 
GROUP BY DIACHI 
HAVING TOTAL_NHANVIEN < 3; 
-- Tìm nhân viên tham gia nhiều dự án nhất
SELECT NHANVIENID , COUNT(DUANID) AS SO_DU_AN FROM PHANCONG
GROUP BY NHANVIENID LIMIT 1 ; 