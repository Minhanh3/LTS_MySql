-- Create the QuanLyDonDatHang database
CREATE DATABASE QuanLyDonDatHang;

-- Use the QuanLyDonDatHang database
USE QuanLyDonDatHang;

-- Create the loaiSanPhams table
CREATE TABLE loaiSanPhams (
    LoaiSanPhamID INT PRIMARY KEY NOT NULL,
    TenLoai VARCHAR(200) NOT NULL
);

-- Create the khachHangs table
CREATE TABLE khachHangs (
    KhachHangID INT PRIMARY KEY NOT NULL,
    HoTen VARCHAR(200) NOT NULL,
    NgaySinh DATE NOT NULL,
    DiaChi VARCHAR(200) NOT NULL,
    TenDangNhap VARCHAR(200) NOT NULL,
    MatKhau VARCHAR(200) NOT NULL,
    Email VARCHAR(200) NOT NULL,
    SoDienThoai VARCHAR(200) NOT NULL
);

-- Create the sanPhams table
CREATE TABLE sanPhams (
    SanPhamID INT PRIMARY KEY NOT NULL,
    LoaiSanPhamID INT NOT NULL,
    TenSanPham VARCHAR(200) NOT NULL,
    GiaSanPham INT NOT NULL,
    FOREIGN KEY (LoaiSanPhamID) REFERENCES loaiSanPhams(LoaiSanPhamID)
);

-- Create the hoaDons table
CREATE TABLE hoaDons (
    HoaDonID INT PRIMARY KEY NOT NULL,
    KhachHangID INT NOT NULL,
    ThoiGianTao DATE NOT NULL,
    ThoiGianCapNhat DATE NOT NULL,
    FOREIGN KEY (KhachHangID) REFERENCES khachHangs(KhachHangID)
);

-- Create the chiTietHoaDons table
CREATE TABLE chiTietHoaDons (
    ChiTietHoaDonID INT PRIMARY KEY NOT NULL,
    HoaDonID INT NOT NULL,
    SanPhamID INT NOT NULL,
    SoLuong INT NOT NULL,
    FOREIGN KEY (HoaDonID) REFERENCES hoaDons(HoaDonID),
    FOREIGN KEY (SanPhamID) REFERENCES sanPhams(SanPhamID)
);

-- Insert data into loaiSanPhams table
INSERT INTO loaiSanPhams (LoaiSanPhamID, TenLoai)
VALUES
    (1, 'Loại sản phẩm 1'),
    (2, 'Loại sản phẩm 2'),
    (3, 'Loại sản phẩm 3'),
    (4, 'Loại sản phẩm 4'),
    (5, 'Loại sản phẩm 5'),
    (6, 'Loại sản phẩm 6'),
    (7, 'Loại sản phẩm 7'),
    (8, 'Loại sản phẩm 8'),
    (9, 'Loại sản phẩm 9'),
    (10, 'Loại sản phẩm 10');

-- Insert data into khachHangs table
INSERT INTO khachHangs (KhachHangID, HoTen, NgaySinh, DiaChi, TenDangNhap, MatKhau, Email, SoDienThoai)
VALUES
    (1, 'Nguyễn Văn A', '1990-01-15', '123 Đường ABC, Quận XYZ', 'user1', 'password1', 'user1@example.com', '123456789'),
    (2, 'Trần Thị B', '1985-03-20', '456 Đường DEF, Quận UVW', 'user2', 'password2', 'user2@example.com', '987654321'),
    (3, 'Nguyễn Văn C', '1995-04-15', '789 Đường TYU, Quận HJK', 'user3', 'password3', 'user3@example.com', '0273273234'),
    (4, 'Nguyễn Thị D', '1992-08-25', '101 Đường KLM, Quận PQR', 'user4', 'password4', 'user4@example.com', '456789012'),
    (5, 'Lê Văn E', '1988-06-12', '202 Đường STU, Quận XYZ', 'user5', 'password5', 'user5@example.com', '987012345'),
    (6, 'Phạm Thị F', '1997-03-03', '303 Đường VWX, Quận ABC', 'user6', 'password6', 'user6@example.com', '123345678'),
    (7, 'Trần Văn G', '1990-12-19', '404 Đường YZQ, Quận MNO', 'user7', 'password7', 'user7@example.com', '345678901'),
    (8, 'Lý Thị H', '1995-11-08', '505 Đường HIJ, Quận RST', 'user8', 'password8', 'user8@example.com', '567890123'),
    (9, 'Hoàng Văn I', '1993-09-21', '606 Đường KLP, Quận UVW', 'user9', 'password9', 'user9@example.com', '234567890'),
    (10, 'Vũ Thị K', '1987-02-14', '707 Đường OPQ, Quận GHI', 'user10', 'password10', 'user10@example.com', '678901234'),
    (11, 'Nguyễn Văn L', '1989-07-31', '808 Đường XYZ, Quận DEF', 'user11', 'password11', 'user11@example.com', '890123456');

-- Insert data into sanPhams table
INSERT INTO sanPhams (SanPhamID, LoaiSanPhamID, TenSanPham, GiaSanPham)
VALUES
    (1, 1, 'Sản phẩm A', 5000),
    (2, 2, 'Sản phẩm B', 2000),
    (3, 3, 'Sản phẩm C', 8000),
    (4, 1, 'Sản phẩm D', 6000),
    (5, 2, 'Sản phẩm E', 2500),
    (6, 3, 'Sản phẩm F', 9000),
    (7, 1, 'Sản phẩm G', 7000),
    (8, 2, 'Sản phẩm H', 3200),
    (9, 3, 'Sản phẩm I', 8500),
    (10, 1, 'Sản phẩm J', 7500),
    (11, 2, 'Sản phẩm K', 2900),
    (12, 3, 'Sản phẩm L', 9200),
    (13, 1, 'Sản phẩm M', 6800);

-- Insert data into hoaDons table
INSERT INTO hoaDons (HoaDonID, KhachHangID, ThoiGianTao, ThoiGianCapNhat)
VALUES
    (1, 1, '2023-09-18', '2023-09-18'),
    (2, 2, '2023-09-18', '2023-09-17'),
    (3, 3, '2023-09-17', '2023-09-16'),
    (4, 4, '2023-09-19', '2023-09-19'),
    (5, 5, '2023-09-19', '2023-09-18'),
    (6, 6, '2023-09-18', '2023-09-17'),
    (7, 7, '2023-09-18', '2023-09-16'),
    (8, 8, '2023-09-17', '2023-09-15'),
    (9, 9, '2023-09-17', '2023-09-14'),
    (10, 10, '2023-09-16', '2023-09-13'),
    (11, 11, '2023-09-16', '2023-09-12'),
    (12, 4, '2023-09-15', '2023-09-11'),
    (13, 5, '2023-09-15', '2023-09-10');

-- Insert data into chiTietHoaDons table
INSERT INTO chiTietHoaDons (ChiTietHoaDonID, HoaDonID, SanPhamID, SoLuong)
VALUES
    (1, 1, 1, 5),
    (2, 1, 2, 3),
    (3, 2, 3, 2),
    (4, 3, 3, 6),
    (5, 4, 4, 3),
    (6, 4, 5, 2),
    (7, 5, 6, 4),
    (8, 5, 7, 1),
    (9, 6, 8, 2),
    (10, 6, 9, 3),
    (11, 7, 10, 5),
    (12, 7, 11, 2),
    (13, 8, 12, 4),
    (14, 8, 13, 3);