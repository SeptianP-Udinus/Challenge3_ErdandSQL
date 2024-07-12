-- Create Db
create database db_challenge;

-- Use Db
-- Use db_challenge

-- Create table
-- Customers
create table db_challenge.public.Customers (
	CustomersID SERIAL primary key,
	Nama_Depan varchar(100) not null,
	Nama_Belakang varchar(100) not null,
	Alamat varchar(200) not null,
	NoHP varchar(20) not null,
	Email varchar(100) null,
	TanggalLahir date not null
);

-- Akun
create table db_challenge.public.akun (
	AkunID SERIAl primary key,
	CustomersID int not null,
	TipeAkun varchar(100) not null, -- TABUNGAN EXPRESS/ REGULER / PREMIUM / GIRO / DSB
	Saldo money not null,
	TanggalBuat date not null,
	
	foreign key (CustomersID) references db_challenge.public.Customers(CustomersID)
);

-- Transaksi
create table db_challenge.public.transaksi (
	TransaksiID SERIAL primary key,
	AkunID int not null,
	TipeTransansaksi varchar (100) not null, -- DEPOSIT / WD
	Jumlah money not null,
	TanggalTransaksi date not null,
	Deskripsi varchar(50) null, 
	
	foreign key (AkunID) references db_challenge.public.akun(AkunID)
);

-- Create CRUD
-- Create
insert into db_challenge.public.customers (nama_depan, nama_belakang, alamat, nohp, email, tanggallahir)
values ('Pegi','Santoso','Jalan anumaningrum NO 213','+62817381728191','pegisantoso21@xyz.com','25/10/1993');

-- READ
select *
from db_challenge.public.customers c 
;

-- UPDATE
update db_challenge.public.customers 
set nama_depan = 'julian', nohp = '0817381728191'
where customersid = 1
;

-- DELETE
delete from db_challenge.public.customers 
where customersid  = 1
;

-- Tambahan INSERT
insert into db_challenge.public.customers (nama_depan, nama_belakang, alamat, nohp, email, tanggallahir)
values ('Pegi','Santoso','Jalan anumaningrum NO 213','+62817381728191','pegisantoso21@xyz.com','25/10/1993'),
('Ilham','Nugroho','Jalan kumala Gang 7 no 111','+6218902371289','ilhamGanteng@abc.com','13/01/2001')
;

select * 
from db_challenge.public.customers c 

delete from db_challenge.public.customers 
where customersid = 4;

---------------------------------------------

-- Create
insert into db_challenge.public.akun (customersid, tipeakun, saldo, tanggalbuat)
values ('2','Tabungan','100000','10/12/2017'),('3','Giro','200000','21/09/2020');

-- READ
select *
from db_challenge.public.akun a 
;

-- UPDATE
update db_challenge.public.akun 
set tipeakun = 'tabungan'
where customersid = 3
;

-- DELETE
delete from db_challenge.public.akun 
where customersid  = 1
;

-- Create
insert into db_challenge.public.transaksi (akunid, tipetransansaksi, jumlah, tanggaltransaksi, deskripsi)
values ('1','Deposit','100000','10/12/2017','Jajan'),('2','Deposit','200000','21/09/2020','NaruhUang');

-- READ
select *
from db_challenge.public.transaksi t 
;

-- UPDATE
update db_challenge.public.transaksi 
set deskripsi = 'Uang main'
where transaksiid = 1
;

-- DELETE
delete from db_challenge.public.transaksi 
where transaksiid  = 1;
