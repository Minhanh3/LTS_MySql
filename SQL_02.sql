-- họ tên bắt đầu bằng chữ T
select *  from hocsinh  
where Hoten LIKE 'T%' ;
-- Liệt kê danh sách những học sinh có chữ cái cuối cùng trong tên là I 
select *  from hocsinh  
where Hoten LIKE '%I' ;
-- Danh sách những học sinh có ký tự thứ hai của họ tên là chữ N
select *  from hocsinh  
where Hoten LIKE '_N%' ;
 -- Liệt kê những học sinh mà họ tên có chứa chữ Thị.
select *  from hocsinh  
where Hoten like '%Thị%';
-- Cho biết danh sách những học sinh có ký tự đầu tiên của họ tên nằm trong khoảng từ a đến m
select *  from hocsinh  
where Hoten like 'a%m';
-- Liệt kê các học sinh có địa chỉ ở Hà Nội
select *  from hocsinh  
where Diachi = 'Hà Nội';
-- Danh sách các học sinh nữ có địa chỉ ở Hà Nội
select *  from hocsinh  
where Diachi = 'Hà Nội' AND Gioitinh = 'Nữ';
-- Cho biết những học sinh có ngày sinh từ ngày 01/01/2005 đến ngày 05/06/2005
select *  from hocsinh  
where Ngaysinh between '2005-01-01' and '2005-06-05' ;
-- Danh sách những học sinh thuộc 1 trong các tỉnh Hà Nội, Thái Bình, Cao Bằng
select *  from hocsinh  
where Diachi in ('hà nội','thái bình','Cao bằng') ; -- or Diachi = 'hà nội'
-- Cho biết những lớp có trên 30 học sinh và có giáo viên chủ nhiệm tên Quỳnh
select *  from lop 
where GVCN like '%Quỳnh%' and Siso > 30;
-- Danh sách học sinh nam ở Hà Giang thuộc lớp số 5
select lopID , Hoten , Gioitinh , diachi
from hocsinh
where gioitinh = 'nam' and lopid = 5 and diachi = 'hà giang' ;
-- inner join hocsinh on lop.lopID =  Hocsinh.LopID 
select *  from lop ;
select *  from hocsinh ;  
-- Danh sách học sinh chưa có địa chỉ email
select * from hocsinh
where email is null ;
-- Danh sách những học sinh không sinh năm 2005
select * from hocsinh
where not ngaysinh like '%2005%' ;
-- Liệt kê danh sách học sinh, họ tên sắp xếp theo thứ tự trong bảng chữ cái
select * from hocsinh
order by hoten ; 
-- Liệt kê danh sách học sinh, sắp xếp theo thứ tự giảm dần của ID học sinh
select * from hocsinh
order by hocsinhid desc ;
-- Liệt kê danh sách học sinh, sắp xếp theo thứ tự ngày sinh tăng dần và lớp giảm dần.
select * from hocsinh
order by ngaysinh asc , lopid desc ;
-- Liệt kê danh sách lớp tăng dần theo sĩ số
select * from lop
order by siso ;
-- Liệt kê danh sách học sinh nữ ở Hà Nội, sắp xếp tăng dần theo ngày sinh
select * from hocsinh
where gioitinh = 'nữ' and diachi = 'hà nội' 
order by ngaysinh ;
-- Liệt kê những học sinh mà địa chỉ không thuộc 1 trong các tỉnh Hà Nội, Lào Cai, Thanh Hóa, sắp xếp lớp tăng dần
select * from hocsinh
where diachi in ( 'hà nội' , 'Lào Cai' , 'Thanh Hóa') 
order by lopid ;
-- Liệt kê tất cả địa chỉ quê quán của học sinh (không được liệt kê trùng lặp)
select DISTINCT diachi as Diachihocsinh from hocsinh
