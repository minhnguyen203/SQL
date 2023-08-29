CREATE TABLE SanPham (
    ProductID INT PRIMARY KEY,
    TenSanPham VARCHAR(255),
    DanhMuc VARCHAR(100),
    GiaCa DECIMAL(10, 2),
    MoTa TEXT
);
CREATE TABLE KhachHang (
    IDKhachHang INT PRIMARY KEY,
    Ten VARCHAR(50),
    Ho VARCHAR(50),
    ThuDienTu VARCHAR(100),
    SoDienThoai VARCHAR(15),
    DiaChi TEXT
);
CREATE TABLE DonDatHang (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    NgayDatHang DATE,
    TongSoTien DECIMAL(10, 2),
    TrangThai VARCHAR(50)
);
CREATE TABLE ChiTietDonDatHang (
    OrderID INT,
    ProductID INT,
    SoLuong INT,
    GiaDonVi DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES DonDatHang(OrderID),
    FOREIGN KEY (ProductID) REFERENCES SanPham(ProductID)
);
SELECT 
    DDH.OrderID,
    KH.IDKhachHang,
    KH.Ten AS TenKhachHang,
    KH.Ho AS HoKhachHang,
    KH.ThuDienTu AS EmailKhachHang,
    KH.SoDienThoai AS SoDienThoaiKhachHang,
    KH.DiaChi AS DiaChiKhachHang,
    SP.TenSanPham,
    DDH.SoLuong,
    DDH.GiaDonVi,
    DDH.SoLuong * DDH.GiaDonVi AS TongGia,
    DH.NgayDatHang,
    DH.TongSoTien,
    DH.TrangThai
FROM ChiTietDonDatHang AS DDH
JOIN DonDatHang AS DH ON DDH.OrderID = DH.OrderID
JOIN KhachHang AS KH ON DH.CustomerID = KH.IDKhachHang
JOIN SanPham AS SP ON DDH.ProductID = SP.ProductID;
