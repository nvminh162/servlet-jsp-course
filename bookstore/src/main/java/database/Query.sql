-- =================================================
-- SCRIPT TẠO CƠ SỞ DỮ LIỆU QUẢN LÝ BÁN SÁCH
-- MariaDB Database Schema
-- =================================================

-- Tạo database
CREATE DATABASE IF NOT EXISTS servlet_jsp_bookstore 
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE servlet_jsp_bookstore;

-- =================================================
-- TẠO CÁC BẢNG
-- =================================================

-- Bảng Tác giả
CREATE TABLE tacgia (
    ma_tac_gia VARCHAR(10) PRIMARY KEY,
    ho_va_ten NVARCHAR(100) NOT NULL,
    ngay_sinh DATE,
    tieu_su TEXT
);

-- Bảng Thể loại
CREATE TABLE theloai (
    ma_the_loai VARCHAR(10) PRIMARY KEY,
    ten_the_loai NVARCHAR(100) NOT NULL
);

-- Bảng Sản phẩm (Sách)
CREATE TABLE sanpham (
    ma_san_pham VARCHAR(15) PRIMARY KEY,
    ten_san_pham NVARCHAR(200) NOT NULL,
    ma_tac_gia VARCHAR(10),
    nam_xuat_ban INT,
    gia_nhap DECIMAL(15,2) DEFAULT 0,
    gia_goc DECIMAL(15,2) DEFAULT 0,
    gia_ban DECIMAL(15,2) DEFAULT 0,
    so_luong INT DEFAULT 0,
    ma_the_loai VARCHAR(10),
    ngon_ngu NVARCHAR(50),
    mo_ta TEXT,
    FOREIGN KEY (ma_tac_gia) REFERENCES tacgia(ma_tac_gia),
    FOREIGN KEY (ma_the_loai) REFERENCES theloai(ma_the_loai)
);

-- Bảng Khách hàng
CREATE TABLE khachhang (
    ma_khach_hang VARCHAR(15) PRIMARY KEY,
    ten_dang_nhap VARCHAR(50) UNIQUE NOT NULL,
    mat_khau VARCHAR(255) NOT NULL,
    ho_va_ten NVARCHAR(100) NOT NULL,
    gioi_tinh NVARCHAR(10),
    dia_chi NVARCHAR(200),
    dia_chi_nhan_hang NVARCHAR(200),
    dia_chi_mua_hang NVARCHAR(200),
    ngay_sinh DATE,
    so_dien_thoai VARCHAR(15),
    email VARCHAR(100),
    dang_ky_nhan_bang_tin BOOLEAN DEFAULT FALSE
);

-- Bảng Đơn hàng
CREATE TABLE donhang (
    ma_don_hang VARCHAR(15) PRIMARY KEY,
    ma_khach_hang VARCHAR(15),
    dia_chi_mua_hang NVARCHAR(200),
    dia_chi_nhan_hang NVARCHAR(200),
    trang_thai NVARCHAR(50) DEFAULT 'Mới tạo',
    hinh_thuc_thanh_toan NVARCHAR(50),
    trang_thai_thanh_toan NVARCHAR(50) DEFAULT 'Chưa thanh toán',
    so_tien_da_thanh_toan DECIMAL(15,2) DEFAULT 0,
    so_tien_con_thieu DECIMAL(15,2) DEFAULT 0,
    ngay_dat_hang DATE NOT NULL,
    ngay_giao_hang DATE,
    FOREIGN KEY (ma_khach_hang) REFERENCES khachhang(ma_khach_hang)
);

-- Bảng Chi tiết đơn hàng
CREATE TABLE chitietdonhang (
    ma_chi_tiet_don_hang VARCHAR(20) PRIMARY KEY,
    ma_don_hang VARCHAR(15),
    ma_san_pham VARCHAR(15),
    so_luong DECIMAL(10,2) NOT NULL,
    gia_goc DECIMAL(15,2) DEFAULT 0,
    giam_gia DECIMAL(15,2) DEFAULT 0,
    gia_ban DECIMAL(15,2) DEFAULT 0,
    thue_vat DECIMAL(15,2) DEFAULT 0,
    tong_tien DECIMAL(15,2) DEFAULT 0,
    FOREIGN KEY (ma_don_hang) REFERENCES donhang(ma_don_hang),
    FOREIGN KEY (ma_san_pham) REFERENCES sanpham(ma_san_pham)
);

-- =================================================
-- DỮ LIỆU MẪU
-- =================================================

-- Dữ liệu mẫu cho bảng Tác giả
INSERT INTO tacgia (ma_tac_gia, ho_va_ten, ngay_sinh, tieu_su) VALUES
('TG001', 'Nguyễn Nhật Ánh', '1955-05-07', 'Nhà văn nổi tiếng Việt Nam, tác giả nhiều tác phẩm văn học thiếu nhi được yêu thích'),
('TG002', 'Tô Hoài', '1920-09-27', 'Nhà văn Việt Nam, tác giả của nhiều tác phẩm văn học thiếu nhi nổi tiếng'),
('TG003', 'Paulo Coelho', '1947-08-24', 'Nhà văn người Brazil, tác giả cuốn "Nhà giả kim" nổi tiếng thế giới'),
('TG004', 'Dale Carnegie', '1888-11-24', 'Tác giả và diễn giả người Mỹ về phát triển bản thân và kỹ năng giao tiếp'),
('TG005', 'Haruki Murakami', '1949-01-12', 'Tiểu thuyết gia và dịch giả người Nhật Bản nổi tiếng thế giới');

-- Dữ liệu mẫu cho bảng Thể loại
INSERT INTO theloai (ma_the_loai, ten_the_loai) VALUES
('TL001', 'Văn học thiếu nhi'),
('TL002', 'Tiểu thuyết'),
('TL003', 'Sách kỹ năng sống'),
('TL004', 'Sách kinh doanh'),
('TL005', 'Văn học nước ngoài'),
('TL006', 'Sách giáo khoa'),
('TL007', 'Triết học'),
('TL008', 'Lịch sử');

-- Dữ liệu mẫu cho bảng Sản phẩm
INSERT INTO sanpham (ma_san_pham, ten_san_pham, ma_tac_gia, nam_xuat_ban, gia_nhap, gia_goc, gia_ban, so_luong, ma_the_loai, ngon_ngu, mo_ta) VALUES
('SP001', 'Kính vạn hoa', 'TG001', 2019, 45000, 65000, 58500, 50, 'TL001', 'Tiếng Việt', 'Tập truyện ngắn hay nhất của Nguyễn Nhật Ánh'),
('SP002', 'Tôi thấy hoa vàng trên cỏ xanh', 'TG001', 2010, 55000, 75000, 67500, 30, 'TL001', 'Tiếng Việt', 'Tiểu thuyết nổi tiếng về tuổi thơ ở miền quê Việt Nam'),
('SP003', 'Dế Mèn phiêu lưu ký', 'TG002', 2015, 35000, 50000, 45000, 25, 'TL001', 'Tiếng Việt', 'Tác phẩm kinh điển của văn học thiếu nhi Việt Nam'),
('SP004', 'Nhà giả kim', 'TG003', 2020, 70000, 95000, 85500, 40, 'TL005', 'Tiếng Việt', 'Cuốn sách triết lý nổi tiếng thế giới về hành trình tìm kiếm ước mơ'),
('SP005', 'Đắc nhân tâm', 'TG004', 2018, 60000, 85000, 76500, 60, 'TL003', 'Tiếng Việt', 'Cuốn sách kinh điển về kỹ năng giao tiếp và làm việc với con người'),
('SP006', 'Rừng Na Uy', 'TG005', 2019, 80000, 110000, 99000, 20, 'TL005', 'Tiếng Việt', 'Tiểu thuyết nổi tiếng của Haruki Murakami'),
('SP007', 'Cho tôi xin một vé đi tuổi thơ', 'TG001', 2017, 48000, 68000, 61200, 35, 'TL001', 'Tiếng Việt', 'Tác phẩm đầy cảm xúc về ký ức tuổi thơ');

-- Dữ liệu mẫu cho bảng Khách hàng
INSERT INTO khachhang (ma_khach_hang, ten_dang_nhap, mat_khau, ho_va_ten, gioi_tinh, dia_chi, dia_chi_nhan_hang, dia_chi_mua_hang, ngay_sinh, so_dien_thoai, email, dang_ky_nhan_bang_tin) VALUES
('KH001', 'nguyenvana', 'password123', 'Nguyễn Văn A', 'Nam', '123 Đường ABC, Quận 1, TP.HCM', '123 Đường ABC, Quận 1, TP.HCM', '123 Đường ABC, Quận 1, TP.HCM', '1990-05-15', '0901234567', 'nguyenvana@email.com', TRUE),
('KH002', 'tranthib', 'mypassword', 'Trần Thị B', 'Nữ', '456 Đường XYZ, Quận 3, TP.HCM', '456 Đường XYZ, Quận 3, TP.HCM', '456 Đường XYZ, Quận 3, TP.HCM', '1988-10-20', '0987654321', 'tranthib@email.com', FALSE),
('KH003', 'lequangc', 'securepass', 'Lê Quang C', 'Nam', '789 Đường DEF, Quận 7, TP.HCM', '789 Đường DEF, Quận 7, TP.HCM', '789 Đường DEF, Quận 7, TP.HCM', '1995-03-08', '0912345678', 'lequangc@email.com', TRUE),
('KH004', 'phamthid', 'password456', 'Phạm Thị D', 'Nữ', '321 Đường GHI, Quận 5, TP.HCM', '321 Đường GHI, Quận 5, TP.HCM', '321 Đường GHI, Quận 5, TP.HCM', '1992-12-03', '0934567890', 'phamthid@email.com', TRUE);

-- Dữ liệu mẫu cho bảng Đơn hàng
INSERT INTO donhang (ma_don_hang, ma_khach_hang, dia_chi_mua_hang, dia_chi_nhan_hang, trang_thai, hinh_thuc_thanh_toan, trang_thai_thanh_toan, so_tien_da_thanh_toan, so_tien_con_thieu, ngay_dat_hang, ngay_giao_hang) VALUES
('DH001', 'KH001', '123 Đường ABC, Quận 1, TP.HCM', '123 Đường ABC, Quận 1, TP.HCM', 'Đã giao hàng thành công', 'Chuyển khoản', 'Đã thanh toán', 144000, 0, '2024-06-01', '2024-06-03'),
('DH002', 'KH002', '456 Đường XYZ, Quận 3, TP.HCM', '456 Đường XYZ, Quận 3, TP.HCM', 'Đang giao hàng', 'COD', 'Chưa thanh toán', 0, 130500, '2024-06-05', NULL),
('DH003', 'KH003', '789 Đường DEF, Quận 7, TP.HCM', '789 Đường DEF, Quận 7, TP.HCM', 'Đang xử lý', 'Chuyển khoản', 'Đã thanh toán', 85500, 0, '2024-06-07', NULL),
('DH004', 'KH004', '321 Đường GHI, Quận 5, TP.HCM', '321 Đường GHI, Quận 5, TP.HCM', 'Mới tạo', 'COD', 'Chưa thanh toán', 0, 203700, '2024-06-08', NULL);

-- Dữ liệu mẫu cho bảng Chi tiết đơn hàng
INSERT INTO chitietdonhang (ma_chi_tiet_don_hang, ma_don_hang, ma_san_pham, so_luong, gia_goc, giam_gia, gia_ban, thue_vat, tong_tien) VALUES
('CTDH001', 'DH001', 'SP001', 2, 65000, 6500, 58500, 5850, 122850),
('CTDH002', 'DH001', 'SP003', 1, 50000, 5000, 45000, 4500, 49500),
('CTDH003', 'DH002', 'SP002', 1, 75000, 7500, 67500, 6750, 74250),
('CTDH004', 'DH002', 'SP005', 1, 85000, 8500, 76500, 7650, 84150),
('CTDH005', 'DH003', 'SP004', 1, 95000, 9500, 85500, 8550, 94050),
('CTDH006', 'DH004', 'SP006', 2, 110000, 11000, 99000, 9900, 207900),
('CTDH007', 'DH004', 'SP007', 1, 68000, 6800, 61200, 6120, 67320);

-- =================================================
-- TẠO CÁC INDEX ĐỂ TỐI ƯU HIỆU SUẤT
-- =================================================

-- Index cho các trường thường xuyên tìm kiếm
CREATE INDEX idx_sanpham_ten ON sanpham(ten_san_pham);
CREATE INDEX idx_sanpham_theloai ON sanpham(ma_the_loai);
CREATE INDEX idx_sanpham_tacgia ON sanpham(ma_tac_gia);
CREATE INDEX idx_khachhang_email ON khachhang(email);
CREATE INDEX idx_khachhang_sdt ON khachhang(so_dien_thoai);
CREATE INDEX idx_donhang_ngaydat ON donhang(ngay_dat_hang);
CREATE INDEX idx_donhang_trangthai ON donhang(trang_thai);

-- =================================================
-- TẠO CÁC VIEW HỮU ÍCH
-- =================================================

-- View thông tin sản phẩm chi tiết
CREATE VIEW v_sanpham_chitiet AS
SELECT 
    sp.ma_san_pham,
    sp.ten_san_pham,
    tg.ho_va_ten as ten_tac_gia,
    sp.nam_xuat_ban,
    tl.ten_the_loai,
    sp.gia_ban,
    sp.so_luong,
    sp.ngon_ngu,
    sp.mo_ta
FROM sanpham sp
LEFT JOIN tacgia tg ON sp.ma_tac_gia = tg.ma_tac_gia
LEFT JOIN theloai tl ON sp.ma_the_loai = tl.ma_the_loai;

-- View thông tin đơn hàng chi tiết
CREATE VIEW v_donhang_chitiet AS
SELECT 
    dh.ma_don_hang,
    kh.ho_va_ten as ten_khach_hang,
    kh.so_dien_thoai,
    dh.ngay_dat_hang,
    dh.trang_thai,
    dh.hinh_thuc_thanh_toan,
    dh.trang_thai_thanh_toan,
    dh.so_tien_da_thanh_toan,
    dh.so_tien_con_thieu,
    dh.dia_chi_nhan_hang
FROM donhang dh
JOIN khachhang kh ON dh.ma_khach_hang = kh.ma_khach_hang;

-- =================================================
-- STORED PROCEDURES HỮU ÍCH
-- =================================================

DELIMITER //

-- Procedure tính tổng tiền đơn hàng
CREATE PROCEDURE sp_TinhTongTienDonHang(IN p_ma_don_hang VARCHAR(15))
BEGIN
    DECLARE v_tong_tien DECIMAL(15,2) DEFAULT 0;
    
    SELECT SUM(tong_tien) INTO v_tong_tien
    FROM chitietdonhang 
    WHERE ma_don_hang = p_ma_don_hang;
    
    SELECT IFNULL(v_tong_tien, 0) as tong_tien_don_hang;
END //

-- Procedure cập nhật số lượng sản phẩm khi đặt hàng
CREATE PROCEDURE sp_CapNhatSoLuongSanPham(
    IN p_ma_san_pham VARCHAR(15), 
    IN p_so_luong_dat DECIMAL(10,2)
)
BEGIN
    UPDATE sanpham 
    SET so_luong = so_luong - p_so_luong_dat 
    WHERE ma_san_pham = p_ma_san_pham AND so_luong >= p_so_luong_dat;
END //

DELIMITER ;

-- =================================================
-- HIỂN THỊ THÔNG TIN TÓM TẮT
-- =================================================

SELECT 'Database bookstore_db đã được tạo thành công!' as Status;
SELECT COUNT(*) as 'Số lượng tác giả' FROM tacgia;
SELECT COUNT(*) as 'Số lượng thể loại' FROM theloai;
SELECT COUNT(*) as 'Số lượng sản phẩm' FROM sanpham;
SELECT COUNT(*) as 'Số lượng khách hàng' FROM khachhang;
SELECT COUNT(*) as 'Số lượng đơn hàng' FROM donhang;
SELECT COUNT(*) as 'Số lượng chi tiết đơn hàng' FROM chitietdonhang;sp_CapNhatSoLuongSanPhamsp_CapNhatSoLuongSanPhamsp_CapNhatSoLuongSanPham