IF EXISTS (SELECT*FROM sys.databases WHERE Name='Example5')
	DROP DATABASES Example5
GO

CREATE DATABASE Example5
GO

USE Example5
GO

--TẠO BẢNG LỚP HỌC
CREATE TABLE LopHoc(
	MaLopHoc INT PRIMARY KEY IDENTITY,
	TenLopHoc VARCHAR(10)
	)
	GO
	--TẠO BẢNG SINH VIÊN CÓ KHÓA NGOẠI LÀ CỘT MaLopHoc, nối với bảng LopHoc
	CREATE TABLE SinhVien(
		MaSV int PRIMARY KEY,
		TenSV varchar(40),
		MaLopHoc int,
		CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
		)
		GO
		--TẠO BẢNG SANPHAM VỚI MỘT NULL
		CREATE TABLE SanPham(
		MaSP int NOT NULL,
		TenSP varchar(40) NULL
		)
		GO
		--TẠO BẢN CÓ THUỘC DEFAULT CHO CỘT PRICE
		CREATE TABLE StoreProduct(
		ProductID int NOT NULL,
		Name varchar(40) NOT NULL,
		Price money NOT NULL DEFAULT (100)
		)
		--THỬ KIỂM TRA GIÁ TRỊ DEFAULT CÓ SỬ DỤNG HAY KO
		INSERT INTO StoreProduct (Price, Name) values(111,Rivets)
		go
		--tạo bảng Contact PHone với thuộc tính identity
		CREATE TABLE ContactPhone(
		Person_ID int Identity(500,1) NOT NULL,
		MobileNumber bigint NOT NULL
		)
		GO
		--Tạo cột nhận dạng duy nhất tổng thể
		CREATE TABLE CellularPhone(
		Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
		PersonName varchar(60) NOT NULL
		)
		--CHÈN MỘT RECORD VÒA
		INSERT INTO CellularPhone(PersonName) VALUES('WILLIAM SMITH')
		GO
		--KIỂM TRA GIÁ TRỊ CỦA CỘT PERSON_ID TỰ ĐỘNG SINH RA
		SELECT*FROM CellularPhone
		GO
		--TẠO BẢN CONTACTPHONE VỚI CỘT MBLIENUMABER CÓ THUỘC TÍNH UNIQUE
		CREATE TABLE ContactPhone(
		Person_ID int PRIMARY KEY,
		MobileNumber bigint UNIQUE,
		ServiceProvider varchar(30),
		LandlineNumber bigint UNIQUE
		)
		--Chèn 2 bản ghi có giá trji giống nha ở cột MobileNumber và LanlieNUmber đẻ quan sát lỗi
		INSERT INTO ContactPhone Values (101,98334284,'Hutch',Null)
		INSERT INTO ContactPhone VALUES (102,10121,'ALEX',NULL)
		GO
		--TẠO BẢN PHONEEXXPESES CỌT 1 CỘT CHECK Ở CỘT AMOUNT
		CREATE TABLE PhoneExpenses(
		Expense_ID int PRIMARY KEY,
		MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone(MobilePhone),
		Amount bigint CHECK (Amount>0)
		)
		GO
		--CHỈNH SỬA CỘT TRONG BẢN
		ALTER TABLE ContactPhone
		Alter COLUMN ServiceProvider varchar(45)
		go
		--xóa cột trong bảng
		ALTER TABLE ContactPhone
		DROP COLUMN ServiceProvider
		go
		--them một ràng buộc vào bảng
		ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharge)
		GO
		--XÓA MỘT RNAGF BUỘC
		ALTER TABLE Person.ContactPhone
		DROP CONSTRAINT CHK_RC

		-- create a table with different date and time fieldsCREATE TABLE Users (  id INT,  full_name VARCHAR(50),  date_of_birth DATE,  last_login DATETIME,  registered_at TIMESTAMP);SELECT*FROM Users-- insert values into the Users table.INSERT INTO UsersVALUES(1, 'Harry Potter', '1999-04-14', '2022-04-22 10:34:53.44', DEFAULT);