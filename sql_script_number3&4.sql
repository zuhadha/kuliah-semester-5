/* membuat skema dengan nama salam */
create schema salam;

/* masuk ke skema salam untuk membuat tabel */
SET search_path TO salam;

/* membuat tabel dengan nama mahasiswas */
create table mahasiswas (
mahasiswa_id serial primary key,
nim VARCHAR(10) unique not null,
nama VARCHAR(50) not null,
/* membatasi input golongan ukt karena tidak ada golongan ukt negatif dan lebih dari 7 */
gol_ukt INT check(gol_ukt>=0 and gol_ukt<=7)
);

/* memasukkan data dummy yang memenuhi constraint */
insert into mahasiswas (nim, nama, gol_ukt)
values
	('1217050148', 'zuhad', 5),
	('1224070063', 'liza', 3),
	('2213040001', 'harkasy', 0);

/* melihat isi tabel */
select * from mahasiswas; 

/* cek unique key berhasil dibuat, memasukkan data dengan nim yang telah ada (1217050148) */
insert into mahasiswas (nim, nama, gol_ukt)
values ('1217050148', 'hikam', 8)

/* cek check constraint, memasukkan nilai gol_ukt di atas 7 */
insert into mahasiswas (nim, nama, gol_ukt)
values ('1217050150', 'hikam', 8)

/* cek check constraint, memasukkan nilai gol_ukt di atas 7 */
insert into mahasiswas (nim, nama, gol_ukt)
values ('1217050150', 'hikam', -1)

/* membuat user baru dalam basis data ini dengan nama backend_dev */
create user backend_dev;
/* memberikan akses user backend_dev CRUD ke semua tabel */
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO backend_dev; 

/* membuat user baru dalam basis data ini dengan nama bi_dev */
create user bi_dev
/* memberikan akses read/select semua table/view */
grant select on all tables in schema PUBLIC to bi_dev

/* melihat daftar user */
SELECT usename FROM pg_user;

/* melihat daftar role */
SELECT rolname FROM pg_roles;
