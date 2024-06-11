-- Lấy thông tin sinh viên có học bổng cao nhất.
SELECT * FROM SINHVIEN
WHERE HOCBONG = ( SELECT MAX(HOCBONG) FROM SINHVIEN ) ;
-- Cho biết những sinh viên điểm thi lần 1 cao nhất môn học 1.
SELECT * FROM KETQUA
WHERE LANTHI = 1 AND MONHOCID = 1 AND DIEMTHI = 
( SELECT MAX(DIEMTHI) FROM KETQUA ) ;
-- Cho biết sinh viên có điểm thi lần 2 môn bất kỳ lớn hơn tất cả điểm thi lần 1 của những sinh viên khác.
select * from sinhvien sv1
where not exists ( select * from ketqua k1 where k1.sinhvienid = sv1.SinhvienID and k1.lanthi = 1 
and exists (select * from ketqua k2 where k2.SinhvienID = sv1.SinhvienID and k2.Lanthi = 2 and k2.Diemthi > k1.Diemthi  )                                -- NOTE 
); 
-- Cho biết sinh viên có nơi sinh cùng với Minh.
SELECT * FROM SINHVIEN 
WHERE NOISINH = (SELECT NOISINH FROM SINHVIEN WHERE Hoten = 'Trần Quang Minh');
-- Cho biết điểm thi cao nhất mỗi môn học.
SELECT MONHOCID , MAX(DIEMTHI) DIEM FROM KETQUA
GROUP BY MONHOCID;
-- Cho biết sinh viên có học bổng cao nhất mỗi khoa
SELECT KHOAID ,HOTEN, MAX(HOCBONG) HB FROM SINHVIEN
GROUP BY KHOAID , HOTEN ;
-- Môn học nào có nhiều sinh viên học nhất.
SELECT M.TENMONHOC , K.SLSVIEN FROM MONHOC M , (
	SELECT MONHOCID , COUNT(SINHVIENID) SLSVIEN
    FROM KETQUA
    GROUP BY MONHOCID
    ORDER BY SLSVIEN DESC 
    LIMIT 1
) K
WHERE M.MONHOCID = K.MONHOCID ;
-- Khoa nào có đông sinh viên nam nhất.
SELECT K.TENKHOA , SV.SLSVIENNAM FROM KHOA K , (
	SELECT KHOAID , COUNT(SINHVIENID) SLSVIENNAM FROM SINHVIEN 
    WHERE GIOITINH = 'NAM'
    GROUP BY KHOAID 
    ORDER BY SLSVIENNAM DESC 
    LIMIT 1
) SV 
WHERE K.KHOAID = SV.KHOAID 
;
-- Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
select tenmonhoc , k1.svienrot from monhoc mh , ( select monhocid , count(sinhvienid) svienrot from ketqua where diemthi < 5 and lanthi = 1 group by monhocid order by svienrot desc limit 1) k1
where  k1.MonhocID = mh.monhocid                                                                                                                                                               -- NOTE
;
-- Cho biết sinh viên chưa thi môn học 1 ,  
SELECT * FROM KETQUA
WHERE SINHVIENID NOT IN ( SELECT SINHVIENID FROM KETQUA  WHERE MONHOCID = 1 );
-- Cho biết những môn không có sinh viên rớt ở lần 1.
SELECT * FROM MONHOC 
WHERE MONHOCID NOT IN ( SELECT MONHOCID FROM KETQUA WHERE DIEMTHI < 5 AND LANTHI = 1);
-- Cho biết những sinh viên không có học bổng hoặc bị rớt môn học trong lần thi 1
select * from sinhvien sv
where hocbong = 0 or sinhvienid in
( select sinhvienid from ketqua kq 
where kq.diemthi < 5 and kq.lanthi = 1 group by sinhvienid ) ;
-- Cho biết những sinh viên có học bổng hoặc không trượt môn nào trong lần thi 1
select * from sinhvien sv
where hocbong != 0 or sinhvienid in
( select sinhvienid from ketqua kq 
where kq.diemthi < 5 and kq.lanthi = 1 group by sinhvienid ) ;
-- Điểm cao nhất và thấp nhất mỗi môn học.
SELECT MH.TENMONHOC , KQ.IDIEM , KQ.ADIEM FROM MONHOC MH , ( 
SELECT MONHOCID, MIN(DIEMTHI) IDIEM , MAX(DIEMTHI) ADIEM 
FROM KETQUA 
GROUP BY MONHOCID ) KQ
WHERE MH.MONHOCID = KQ.MONHOCID;
-- Tìm những môn mà tất cả sinh viên trong danh sách sinh viên đều học
select * from monhoc 
where monhocid IN ( select monhocid from (SELECT MONHOCID , count(distinct SINHVIENID) TTSVIEN FROM KETQUA 
WHERE SINHVIENID IN (SELECT SINHVIENID FROM SINHVIEN) GROUP BY MONHOCID) SUBMH
WHERE TTSVIEN = ( SELECT COUNT(*) FROM SINHVIEN )
);
-- Tìm những sinh viên học những môn giống sinh viên 1 (có thể nhiều hơn) SVID 1 = 1 5 6 7 10
SELECT DISTINCT K1.SINHVIENID
FROM KETQUA K1
WHERE NOT EXISTS (
	SELECT MONHOCID FROM KETQUA K2
    WHERE K2.SINHVIENID = 1 AND NOT EXISTS (
		SELECT 1 FROM KETQUA K3
        WHERE K3.SINHVIENID = K1.SINHVIENID
        AND K3.MONHOCID = K2.MONHOCID
    )
)
AND K1.SINHVIENID != 1 ;
-- Tìm những sinh viên học những môn bằng đúng sinh viên 1 (không hơn không kém môn nào) 
SELECT K1.SINHVIENID
FROM KETQUA K1
group by K1.SINHVIENID
HAVING COUNT(DISTINCT k1.MonhocID) = (
    SELECT COUNT(DISTINCT k2.MonhocID)
    FROM ketqua k2
    WHERE k2.SinhvienID = 1
)and not exists (
	select k3.monhocid
    from ketqua k3
    where sinhvienid = 1
    and k3.MonhocID not in(
		select monhocid from ketqua k4
        where k4.sinhvienid = k1.sinhvienid
    )
)
AND K1.SINHVIENID != 1

