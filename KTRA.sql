-- 1. Lấy tất cả các sản phẩm có tên bắt đầu bằng chữ "Sản phẩm" trong bảng sanPhams
SELECT * FROM sanphams
WHERE TenSanPham LIKE '%Sản Phẩm_%' ;
-- 2. Lấy thông tin hoá đơn (ID và thời gian tạo) của khách hàng có KhachHangID là 2 trong bảng hoaDons
SELECT * FROM hoadons
WHERE KhachHangID = 2 ;
-- 3. Lấy tên và địa chỉ của tất cả khách hàng
SELECT HOTEN , DIACHI FROM khachhangs ;
-- 4. Lấy tên sản phẩm và số lượng tương ứng của tất cả các sản phẩm trong bảng chiTietHoaDons
SELECT SP.TENSANPHAM , CTHD.SOLUONG FROM SANPHAMS SP
JOIN chitiethoadons CTHD ON  CTHD.SanPhamID = SP.SANPHAMID ;
-- 5. Lấy tên của các sản phẩm thuộc loại sản phẩm có LoaiSanPhamID là 1 trong bảng sanPhams
SELECT SP.TENSANPHAM  FROM SANPHAMS SP
WHERE LoaiSanPhamID = 1 ;
-- 6. Lấy tên loại sản phẩm và tên sản phẩm của tất cả các sản phẩm trong bảng sanPhams
SELECT LSP.TENLOAI , SP.TENSANPHAM FROM SANPHAMS SP
JOIN loaisanphams LSP ON LSP.LOAISANPHAMID = SP.LOAISANPHAMID ;
-- 7. Lấy tên loại sản phẩm và số lượng tương ứng của sản phẩm có SanPhamID là 2 trong bảng sanPhams
SELECT LSP.TenLoai , CTHD.SoLuong FROM SANPHAMS SP
JOIN loaisanphams LSP ON LSP.LOAISANPHAMID = SP.LOAISANPHAMID 
JOIN chitiethoadons CTHD ON CTHD.SanPhamID = SP.SANPHAMID
WHERE SP.SANPHAMID = 2
;
-- 8. Lấy tên khách hàng và thời gian tạo hoá đơn của tất cả hoá đơn
SELECT KH.HoTen , HD.ThoiGianTao FROM khachhangs KH 
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID ;
-- 9. Lấy tên khách hàng và tổng số lượng sản phẩm trong mỗi hoá đơn
SELECT KH.HoTen , CTHD.SoLuong FROM khachhangs KH 
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID
JOIN chitiethoadons CTHD ON HD.HoaDonID = CTHD.HoaDonID ;
-- 10. Lấy tất cả sản phẩm thuộc loại sản phẩm có TenLoai là 'Loại sản phẩm 1' trong bảng sanPhams
SELECT * FROM sanphams SP
JOIN loaisanphams LSP ON LSP.LoaiSanPhamID = SP.LoaiSanPhamID
WHERE LSP.TenLoai = 'Loại sản phẩm 1';
-- 11. Lấy danh sách các hoá đơn được tạo vào ngày hôm nay
SELECT * FROM hoadons
WHERE day(THOIGIANTAO) = 20
 ;
-- 12. Lấy tên và email của tất cả khách hàng có địa chỉ bắt đầu bằng '123 Đường' trong bảng khachHangs
SELECT HOTEN , EMAIL FROM KHACHHANGS
WHERE DIACHI LIKE '%123 Đường_%' ;
-- 13. Lấy tên loại sản phẩm và tổng số lượng sản phẩm thuộc loại đó trong bảng chiTietHoaDons
SELECT LSP.TenLoai , CTHD.SoLuong FROM chitiethoadons CTHD 
JOIN sanphams SP ON SP.SanPhamID = CTHD.SanPhamID
JOIN loaisanphams LSP ON LSP.LoaiSanPhamID = SP.LoaiSanPhamID ;
-- 14. Lấy tên khách hàng và số lượng sản phẩm mua trong mỗi hoá đơn của khách hàng có KhachHangID là 1
SELECT KH.HoTen , SUM(CTHD.SoLuong) FROM khachhangs KH
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID
JOIN chitiethoadons CTHD ON CTHD.HoaDonID = HD.HoaDonID
WHERE KH.KhachHangID = 1 ;
-- 15. Lấy tên khách hàng và tổng số lượng sản phẩm đã mua theo từng loại sản phẩm, sắp xếp theo tên khách hàng và loại sản phẩm
SELECT KH.HoTen , CTHD.SoLuong , SP.LoaiSanPhamID FROM khachhangs KH
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID 
JOIN chitiethoadons CTHD ON CTHD.HoaDonID = HD.HoaDonID
JOIN sanphams SP ON SP.SanPhamID = CTHD.SanPhamID
GROUP BY KH.HoTen , SP.LoaiSanPhamID , CTHD.SoLuong
ORDER BY KH.HoTen , SP.LoaiSanPhamID;
-- 16. Lấy tên khách hàng và tổng giá trị của mỗi hoá đơn, trong đó giá trị được tính bằng việc nhân số lượng sản phẩm từ bảng chiTietHoaDons với giá sản phẩm từ bảng sanPhams, và sau đó tổng hợp theo khách hàng và hoá đơn, nhưng chỉ lấy những hoá đơn có tổng giá trị lớn hơn 1000
SELECT KH.HoTen ,HD.HoaDonID , SUM(CTHD.SoLuong * SP.GiaSanPham) GIAHD FROM khachhangs KH
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID
JOIN chitiethoadons CTHD ON CTHD.HoaDonID = HD.HoaDonID
JOIN sanphams SP ON SP.SanPhamID = CTHD.SanPhamID
GROUP BY KH.HoTen , HD.HoaDonID
HAVING GIAHD > 20000
;
-- 17. Lấy danh sách các sản phẩm có giá bán cao nhất trong mỗi loại sản phẩm từ bảng sanPhams
SELECT LoaiSanPhamID , max(GiaSanPham) GIA FROM sanphams
GROUP BY LoaiSanPhamID ;
-- 18. Lấy tên khách hàng và tổng giá trị của mỗi hoá đơn, trong đó giá trị được tính bằng việc nhân số lượng sản phẩm từ bảng chiTietHoaDons với giá sản phẩm từ bảng sanPhams, và sau đó tổng hợp theo khách hàng và hoá đơn
SELECT KH.HoTen , HD.HoaDonID,SUM(CTHD.SoLuong * SP.GiaSanPham) GIAHD FROM khachhangs KH
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID
JOIN chitiethoadons CTHD ON CTHD.HoaDonID = HD.HoaDonID
JOIN sanphams SP ON SP.SanPhamID = CTHD.SanPhamID
GROUP BY KH.HoTen , HD.HoaDonID
;
-- 19. Lấy tất cả khách hàng không có mua sản phẩm 'Sản phẩm A' trong bất kỳ hoá đơn nào
SELECT * FROM khachhangs KH
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID
JOIN chitiethoadons CTHD ON CTHD.HoaDonID = HD.HoaDonID
JOIN sanphams SP ON SP.SanPhamID = CTHD.SanPhamID
WHERE SP.TenSanPham NOT IN ('Sản phẩm A') ;
-- 20. Lấy tên khách hàng và tổng số tiền đã chi tiêu từ bảng chiTietHoaDons, nhưng chỉ lấy những khách hàng đã mua ít nhất 2 sản phẩm trong một hoá đơn và tổng giá trị đơn hàng của họ vượt quá 1000
SELECT KH.HoTen , SUM(CTHD.SoLuong * SP.GiaSanPham) TONGHD FROM khachhangs KH
JOIN hoadons HD ON HD.KhachHangID = KH.KhachHangID
JOIN chitiethoadons CTHD ON CTHD.HoaDonID = HD.HoaDonID
JOIN sanphams SP ON SP.SanPhamID = CTHD.SanPhamID
WHERE CTHD.SoLuong >= 2 
GROUP BY KH.HoTen
HAVING TONGHD > 10000 ;
