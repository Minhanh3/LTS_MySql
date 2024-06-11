create database banhang_sql08

use banhang_sql08

create table khach_hang(
	khach_hang_id int primary key auto_increment ,
    ho_ten nvarchar(50) , 
    dia_chi nvarchar(50) ,
    so_dien_thoai varchar(20 ),
    ghi_chu nvarchar(50) ,
    email nvarchar(20)
)
create table loai_san_pham(
	loai_san_pham_id int primary key auto_increment , 
    ten_loai nvarchar(50) ,
    ghi_chu nvarchar(250) 
)

create table san_pham(
	san_pham_id int primary key auto_increment ,
    loai_san_pham_id int ,
    ky_hieu_san_pham varchar(10) ,
    ten_san_pham nvarchar(50) ,
    mo_ta nvarchar(250) , 
    nha_san_xuat nvarchar(50) ,
    ngay_dang date ,
    gia_ban float ,
    la_san_pham_moi boolean ,
    CONSTRAINT loaisanpham foreign key (loai_san_pham_id) references loai_san_pham(loai_san_pham_id)
)

create table don_dat_hang(
	don_dat_hang_id int primary key auto_increment ,
    khach_hang_id int ,
    so_hieu_don int ,
    ngay_dat date ,
    ngay_gio_tra_thuc_te datetime,
    ghi_chu nvarchar(200),
    tinh_trang nvarchar(20),
    constraint khachhangid foreign key (khach_hang_id) references khach_hang(khach_hang_id)
)

create table chi_tiet_don_dat_hang(
	chi_tiet_don_dat_hang_id int primary key auto_increment ,
    khach_hang_id int ,
    don_dat_hang_id int ,
	san_pham_id int,
	so_luong int,
    constraint fk_KH_CT foreign key (khach_hang_id) references khach_hang(khach_hang_id),
    constraint dondathangid foreign key (don_dat_hang_id) references don_dat_hang(don_dat_hang_id),
	constraint sanphamid foreign key (san_pham_id) references san_pham(san_pham_id)
)



