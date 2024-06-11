-- Danh sách những sinh viên có tuổi từ 21 đến 23
SELECT HOTEN , YEAR(curdate()) - year(NGAYSINH) AS TUOI FROM SINHVIEN
HAVING TUOI between 21 AND 23 ;
-- Danh sách sinh viên sinh vào mùa xuân
SELECT HOTEN , month(NGAYSINH) AS THANGSINH FROM SINHVIEN
HAVING THANGSINH between 1 AND 3 ;
-- Cho biết thông tin về mức học bổng của các sinh viên. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của học bổng lớn hơn 150,000 và ngược lại hiển thị là “Mức trung bình”
SELECT HOTEN , NOISINH , HOCBONG ,
CASE 
	WHEN HOCBONG > 150000 THEN 'Học bổng cao'
    ELSE 'Mức trung bình'
END AS MUCHOCBONG
FROM sinhvien ;
-- Cho biết kết quả điểm thi của các sinh viên (Qua môn, trượt).
SELECT SINHVIENID ,MONHOCID, DIEMTHI ,
CASE
	WHEN DIEMTHI > 5 THEN 'QUA MON'
    ELSE 'TRUOT'
END AS KETQUATHI
FROM KETQUA ;
-- Cho biết tổng số sinh viên, số sinh viên nam và số sinh viên nữ của mỗi khoa.
SELECT KHOAID , COUNT(SINHVIENID) AS IDSV, COUNT(CASE WHEN GIOITINH = 'NAM' THEN 1 END ) AS nam ,
COUNT(CASE WHEN GIOITINH = N'NỮ' THEN 1 END ) AS NU  FROM SINHVIEN
GROUP BY KHOAID ;
-- Cho biết số lượng sinh viên theo từng tuổi [19-23]
SELECT year(curdate()) - year(NGAYSINH) AS TuoiSV, COUNT(*) AS SoLuongSinhVien
FROM sinhvien
GROUP BY TuoiSV
HAVING TuoiSV BETWEEN 19 AND 23
ORDER BY TuoiSV;
;
-- Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1.
SELECT COUNT( CASE WHEN DIEMTHI >= 5 THEN 1 END ) AS SVDAU ,COUNT( CASE WHEN DIEMTHI < 5 THEN 1 END ) AS SVROT 
FROM KETQUA
where LANTHI = 1 ;
-- Cho biết danh sách sinh viên rớt 2 môn trở lên ở lần thi 1. 
SELECT SINHVIENID , COUNT(MONHOCID) MH
FROM KETQUA 
WHERE DIEMTHI < 5 AND LANTHI = 1 
GROUP BY SINHVIENID
HAVING MH >= 2;
-- Cho biết khoa nào có 2 sinh viên nam trở lên.
SELECT KHOAID  , COUNT(CASE WHEN GIOITINH = 'NAM' THEN 1 END) AS GTNAM FROM SINHVIEN
GROUP BY KHOAID 
HAVING GTNAM > 2 ;
-- Cho biết môn không có sinh viên rớt ở lần 1.
SELECT MONHOCID , LANTHI , DIEMTHI ,
CASE WHEN DIEMTHI < 5 THEN 1 ELSE 0 END AS DIEM 
FROM KETQUA 
WHERE LANTHI = 1 
ORDER BY MONHOCID ;
-- Cho biết sinh viên có điểm trung bình lần 1 từ 7 trở lên và không rớt môn nào ở lần 1.
SELECT DISTINCT SINHVIENID FROM KETQUA
WHERE LANTHI = 1 
GROUP BY SINHVIENID
HAVING AVG(DIEMTHI) >= 7 AND MIN(DIEMTHI) >= 5 ;
-- Cho biết sinh viên đăng ký học hơn 3 môn mà thi lần 1 không bị rớt môn nào.
SELECT SINHVIENID , COUNT(MONHOCID) AS MH  FROM KETQUA 
WHERE LANTHI = 1 
GROUP BY SINHVIENID 
HAVING MIN(DIEMTHI) >= 5 AND MH >= 3;
-- Tìm những sinh viên nam 20 tuổi có học bổng mà quê quán không phải 1 trong các tỉnh Hà Nội, Đà Nẵng, Hải Phòng, Thái Bình.
SELECT HOTEN , GIOITINH , year(curdate()) - year(NGAYSINH) AS TUOI FROM SINHVIEN 
WHERE GIOITINH ='NAM' AND HOCBONG > 1 AND NOISINH NOT IN ('Hà Nội', 'Đà Nẵng', 'Hải Phòng', 'Thái Bình') 
HAVING TUOI = 20 -- NĂM 20 TUOI KH CO AI 
; 
-- Tìm những sinh viên nữ thuộc khoa số 1 sinh vào mùa hè và có học bổng
SELECT GIOITINH , month(NGAYSINH) AS MONTH FROM SINHVIEN
WHERE KHOAID = 1 AND HOCBONG IS NOT NULL AND GIOITINH = N'NỮ'
HAVING MONTH BETWEEN 4 AND 6 ;
-- Tìm môn học có điểm trung bình trên 7 mà không có sinh viên trượt ở lần thi 1
SELECT MONHOCID , AVG(DIEMTHI) AS TBDIEM FROM KETQUA
WHERE LANTHI = 1
GROUP BY MONHOCID
HAVING TBDIEM >= 7 ;
-- Tìm những sinh viên trượt 3 môn học trở lên
SELECT SINHVIENID , COUNT(MONHOCID) AS MH
FROM KETQUA 
WHERE DIEMTHI < 5
GROUP BY SINHVIENID
HAVING MH >= 3 ;
-- Tìm những sinh viên học 5 môn trở lên mà điểm trung bình thi lần 1 trên 8
SELECT sinhvienid , COUNT(MONHOCID) AS MH FROM ketqua
where LANTHI = 1 
group by sinhvienid 
HAVING MH >= 5 AND AVG(DIEMTHI) >= 8;
-- Điểm thi cao nhất và thấp nhất môn học 1
SELECT MONHOCID , MAX(DIEMTHI) , MIN(DIEMTHI) FROM KETQUA
WHERE MONHOCID = 1;
-- Tìm những sinh viên có điểm thi lần 2 cao hơn hoặc bằng điểm cao nhất trong lần thi 1
SELECT distinct KQ2.SINHVIENID FROM KETQUA AS KQ2
WHERE KQ2.LANTHI = 2 AND KQ2.DIEMTHI >= 
( SELECT MAX(KQ1.DIEMTHI) FROM KETQUA AS KQ1 
WHERE KQ1.SINHVIENID = KQ2.SINHVIENID AND KQ1.LANTHI = 1 ) 

