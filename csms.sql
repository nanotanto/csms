-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.1.72-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for csms
CREATE DATABASE IF NOT EXISTS `csms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `csms`;

-- Dumping structure for table csms.bukti
CREATE TABLE IF NOT EXISTS `bukti` (
  `id` int(11) DEFAULT NULL,
  `evaluasi_id` int(11) DEFAULT NULL,
  `penilaian_id` int(11) DEFAULT NULL,
  `keterangan` text,
  `file` text,
  `tgl` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table csms.bukti: 0 rows
/*!40000 ALTER TABLE `bukti` DISABLE KEYS */;
/*!40000 ALTER TABLE `bukti` ENABLE KEYS */;

-- Dumping structure for table csms.elemen
CREATE TABLE IF NOT EXISTS `elemen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bagian` varchar(50) DEFAULT NULL,
  `penjelasan` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table csms.elemen: 8 rows
/*!40000 ALTER TABLE `elemen` DISABLE KEYS */;
INSERT INTO `elemen` (`id`, `bagian`, `penjelasan`) VALUES
	(1, 'Bagian 1:', 'Bagian 1: Manajemen, kepemimpinan dan komitmen'),
	(2, 'Bagian 2:', 'Bagian 2: Kebijakan HSE dan tujuan strategis'),
	(3, 'Bagian 3:', 'Bagian 3: Organisasi, tanggung jawab, sumber daya, standar dan dokumentasi'),
	(4, 'Bagian 4:', 'Bagian 4: Manajemen risiko, penanganan bahaya dan dampak'),
	(5, 'Bagian 5:', 'Bagian 5: Perencanaan dan prosedur'),
	(6, 'Bagian 6:', 'Bagian 6: Pelaksanaan dan pemantauan kinerja'),
	(7, 'Bagian 7:', 'Bagian 7: HSE audit dan manajemen HSE-MS'),
	(8, 'Bagian 8:', 'Bagian 8: Manajemen HSE-fitur tambahan');
/*!40000 ALTER TABLE `elemen` ENABLE KEYS */;

-- Dumping structure for table csms.evaluasi
CREATE TABLE IF NOT EXISTS `evaluasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perusahaan_id` int(11) DEFAULT NULL,
  `elemen_id` int(11) DEFAULT NULL,
  `subelemen_id` int(11) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_target` datetime DEFAULT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `kesimpulan` text,
  `score_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table csms.evaluasi: 31 rows
/*!40000 ALTER TABLE `evaluasi` DISABLE KEYS */;
INSERT INTO `evaluasi` (`id`, `perusahaan_id`, `elemen_id`, `subelemen_id`, `tgl_masuk`, `tgl_target`, `tgl_selesai`, `kesimpulan`, `score_id`) VALUES
	(1, 1, 1, 1, '2019-12-18', '2018-12-19 16:00:00', '2018-12-19 16:00:00', 'Semua contoh atau bukti elemen yang diperlukan dari point 1-5 dimiliki oleh Kontraktor, Untuk point 6 mengenai penilaian terhadap pegawai terutama untuk Anggota P2K3', 3),
	(2, 1, 2, 2, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Semua sub elemen telah terpenuhi dari sisi pemenuhan kelengkapan data', 4),
	(3, 1, 2, 3, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor telah melaksanakan perencanaan K3LL dan disosialisasikan', 4),
	(4, 1, 3, 4, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Pemenuhan nomor 4 tidak bisa dinilai untuk kehadiran peserta komitte meeting', 3),
	(5, 1, 3, 5, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Point 3 dan 5 tidak ditemukan dalam dokumen', 2),
	(6, 1, 3, 6, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Perencanaan induction untuk pegawai baru atau tamu telah dilaksanakan oleh kontraktor. Pemantauan dilakukan dengan baik dan lengkap', 4),
	(7, 1, 3, 7, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Training matrik telah ditetapkan secara umum melalui corporate QHSE Plan, pelaksanaan training untuk dibawah manager dilakukan dengan baik', 4),
	(8, 1, 3, 8, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Pengawasan untuk sub kontraktor telah ditrapkan dengan sistem penilaian yang telah disepakati oleh kebijakan perusahaan. Penilaian dilakukan dengan sistem  pembobotan', 4),
	(9, 1, 3, 9, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Terdapat prosedur untuk pemenuhan rule dan regulasi K3LL, dan telah disosialisasikan', 4),
	(10, 1, 4, 10, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Dokumen identifikasibahaya dan penilaian risiko telah diterapkan dan diimplementasikan ke prosedur lebih detail seperti JSA, Ijin Kerja Dll\r\n', 4),
	(11, 1, 4, 11, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Pemantauan kesehatan kontraktor melampirkan contoh yang ada di suatu project tertentu. Kontraktor belumbisa menjalankan pengawasan kesehatan secara rutin\r\n', 3),
	(12, 1, 4, 12, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Terdapat prosedur untuk mengendalikan risiko keselamatan ditempat kerja\r\n', 3),
	(13, 1, 4, 13, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor telah menerapkan prosedur pengendalian bahaya logistik terkait dengan aset manajemen\r\n', 4),
	(14, 1, 4, 14, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Tidak terdapat prosedur terkait dengan lingkungan sesuai dengan aktifitas perusahaan, pengendalian cenderung untuk memenuhi kebutuhan project\r\n', 3),
	(15, 1, 4, 15, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Tidak terdapat audit untuk meninjau prosedur pengamanan\r\n', 3),
	(16, 1, 4, 16, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', '"Belum terdapat pengendalian aspek sosial internal Tripatra, kebijakan hanya mengadop kebentingan project.\nKontraktor mempunyai pengalaman untuk kegiatan penanganan sosial dari prosedur dan implementasi"\r\n', 3),
	(17, 1, 4, 17, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor kurang memberikan bukti pemantauan ketersedian APD baik untuk rutin atau kegiatan non rutin seperti penanganan project\r\n', 3),
	(18, 1, 5, 18, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor telah mampu menterjemahkan pengendalian bahaya terhadap operasional project\r\n', 4),
	(19, 1, 5, 19, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor telah melakukan pengendalian untuk pemeliharaan infrastruktur \r\n', 4),
	(20, 1, 5, 20, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Terdapat contoh pelaksanaan MOC akan tetapi belum ada kanian efektifitas dari pelaksanaan MOC tersebut terkait dampak perubahan\r\n', 3),
	(21, 1, 5, 21, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor telah memiliki prosedur ERP dan sudah diterapkan\r\n', 4),
	(22, 1, 6, 22, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', '"Kontraktor telah menerapkan prosedur pemantauan kinerja K3LL sesuai dengan standard dan telah mendapat pengharagaan nil kecelakaan dari disnaker\nProsedur pelaporan kecelakaan kerja tidak dicantumkan"\r\n', 3),
	(23, 1, 6, 23, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor manandatangani pelaporan, contoh yang diberikan hanya satu tahun pada pelaporan 2019\r\n', 3),
	(24, 1, 6, 24, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Kontraktor telah melakukan pemantauan kinerja secara rutin dan struktur, Komponen mengenai keselamatan kerja belum dimasukan dalam prosedur pemantauan Kinerja QHSE\r\n', 3),
	(25, 1, 6, 25, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Terdapat tidak sesuaian antara pelporan kinerja rangkuman pertahun dengan laporan real pada laporan bulanan\r\n', 3),
	(26, 1, 6, 26, NULL, '2019-12-19 16:00:00', '2019-12-19 16:00:00', 'Melampirkan 5 tahun terakhir data akan tetapi tidak ada tanda tangan manajemen\r\n', 3),
	(27, 1, 7, 27, NULL, '2019-12-20 16:00:00', '2019-12-20 16:00:00', 'Kontraktor telah melaksanakan prosedur inspeksi dan audit full cycle, dimana tindaklanjut juga dipantau secara baik dan diketahui PIC nya\r\n', 4),
	(28, 1, 7, 28, NULL, '2019-12-20 16:00:00', '2019-12-20 16:00:00', 'Kontraktor telah melaksanakan monitoring tindaklanjut dari hasil audit secara lengkap\r\n', 4),
	(29, 1, 8, 29, NULL, '2019-12-20 16:00:00', '2019-12-20 16:00:00', 'Kontraktor memiliki 3 sertifikasi OHSAS 2007; ISO 14001 2015 dan ISO 9001 2015\r\n', 4),
	(30, 1, 8, 30, NULL, '2019-12-20 16:00:00', '2019-12-20 16:00:00', 'Ikut asosiasi Ahli Keselamatan dan Kesehatan Kerja Internasional Indonesia\r\n', 4),
	(31, 1, 8, 31, NULL, '2019-12-20 16:00:00', '2019-12-20 16:00:00', 'Memiliki 3 standar akan tetapi belum terintegrasi\r\n', 3);
/*!40000 ALTER TABLE `evaluasi` ENABLE KEYS */;

-- Dumping structure for table csms.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subelemen_id` int(11) DEFAULT NULL,
  `score_id` int(11) DEFAULT NULL,
  `angka` int(11) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

-- Dumping data for table csms.nilai: 124 rows
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
INSERT INTO `nilai` (`id`, `subelemen_id`, `score_id`, `angka`, `keterangan`) VALUES
	(1, 1, 1, 0, 'Tidak ada semua'),
	(2, 1, 2, 3, '1. Ada MWT & Rapat P2K3 \n2. Tapi tidak ada jadwal MWT & Rapat P2K3 \n3. Ada organisasi K3LL yang hanya diisi satu orang'),
	(3, 1, 3, 6, '1. Ada Organisasi K3LL dan diisi oleh minimal 2 orang \n2. SK Komite HSE (P2K3), \n3. Ada Jadwal MWT & Rapat P2K3, \n4. Minimal dua daftar hadir Rapat P2K3 & dua daftar hadir MWT \n5. Ada media promosi HSE (poster, leaflet, memo, dll) minimal 3 contoh'),
	(4, 1, 4, 10, 'Seperti C ditambah 1. Ada Jadwal Rapat dan Inspeksi Komite (P2K3), \n2. Ada penilaian kinerja HSE kepada pekerja minimal 3 contoh penilaian \n3. Ada media promosi HSE minimal 3 contoh"'),
	(5, 2, 1, 0, 'Tidak ada kebijakan K3LL'),
	(6, 2, 2, 3, 'Kebijakan K3LL ada namun tidak memuat unsur (keselamatan, kesehatan dan lingkungan)'),
	(7, 2, 3, 6, '1. Kebijakan K3LL ada memuat unsur (keselamatan, kesehatan dan lingkungan) \n2. Target K3LL tertuang dalam Kebijakan K3LL \n3. Sudah sosialisasi melalui media promosi namun tidak ada daftar hadir & MOM'),
	(8, 2, 4, 10, '1. Kebijakan K3LL ada memuat unsur (keselamatan, kesehatan dan lingkungan) \n2. Target K3LL tertuang dalam Kebijakan K3LL \n3. Sudah sosialisasi melalui media promosi, ada daftar hadir & MOM \n4. Ada review Kebijakan K3LL berkala \n5. Ada Komunikasi K3LL langsung melalui townhall, pelatihan, induction'),
	(9, 3, 1, 0, 'Tidak ada sasaran strategis :\n- zero accident\n- pengelolaan lingkungan'),
	(10, 3, 2, 3, '1. Ada sasaran strategis: leading & lagging tapi tidak kuantitatif 2. tidak ada bukti sosialisasi sasaran strategis'),
	(11, 3, 3, 6, ' 1. Ada sasaran strategis: berupa leading & lagging secara kuantitatif; ada objective (target) K3LL; ada program K3LL \n2. ada bukti sosialisasi sasaran strategis berupa MOM & daftar hadir'),
	(12, 3, 4, 10, '1. Ada sasaran strategis: berupa leading & lagging secara kuantitatif; ada objective K3LL; ada program K3LL \n2. ada bukti sosialisasi sasaran strategis berupa 2 MOM & 2 daftar hadir \n3. Ada evaluasi program K3LL setahun sekali'),
	(13, 4, 1, 0, 'Tidak ada organisasi'),
	(14, 4, 2, 3, '1. Ada Organisasi K3LL dan diisi oleh personil K3LL kerja paruh waktu \n2. personil K3LL status pekerja tetap tersedia namun tidak masuk kedalam struktur Organisasi \n3. personil ditunjuk tidak dibekali dengan kualifikasi (misal: AK3) \n4. Pertemuan K3LL dilaksanakan tidak terjadwal \n5. Pertemuan K3LL dilaksanakan secara rutin namun tidak dilengkapi dengan daftar hadir dan risalah rapat.'),
	(15, 4, 3, 6, '1. Organisasi K3LL tersedia dan diisi oleh personil K3LL kerja penuh waktu \n2. personil K3LL dilengkapi dengan kualifikasi AK3 3. Ada minimal 3 Pertemuan K3LL dengan daftar hadir dan MOM. \n4. 80% Seluruh personil hadir dalam Rapat K3LL (lihat daftar hadir bandingkan dengan daftar pekerja)'),
	(16, 4, 4, 10, ' \'1. Organisasi K3LL tersedia dan diisi oleh personil K3LL kerja penuh waktu \n2. personil K3LL dilengkapi dengan kualifikasi AK3 \n3. Ada minimal 3 Pertemuan K3LL dengan daftar hadir dan MOM. 4. 80% Seluruh personil hadir dalam Rapat K3LL (lihat daftar hadir bandingkan dengan dafter pekerja) \n5.Ada 2 daftar hadir & MOM pada Rapat Operasi yang membahas aspek K3LL'),
	(17, 5, 1, 0, 'Tidak ada kompetensi khusus untuk para manajer/penyelia/staff senior/penasihat K3LL '),
	(18, 5, 2, 3, '1. Ada Training Matrix aspek K3LL untuk jabatan manajer ke atas tapi tidak ada rencana pelatihan \n2. Pelatihan dilaksanakan namun tidak sesuai dengan kebutuhan dan rencana pelatihan \n3. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir'),
	(19, 5, 3, 6, '1. Ada Training Matrix aspek K3LL untuk jabatan manajer ke atas \n2. Ada Rencana Training \n3. Pelatihan dilaksanakan namun tidak sesuai dengan kebutuhan dan rencana pelatihan \n4. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir \n5. Tidak ada pelatihan penyegaran'),
	(20, 5, 4, 10, '1. Ada Training Matrix aspek K3LL untuk jabatan manajer ke atas 2. Ada Rencana Training \n3. Pelatihan dilaksanakan sesuai dengan kebutuhan dan rencana pelatihan \n4. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir \n5. Ada pelatihan penyegaran'),
	(21, 6, 1, 0, ' A. (Score: 0.00) 1. Tidak ada training K3LL -tidak ada induksi K3LL'),
	(22, 6, 2, 3, 'B. (Score: 3.00) 1. Induksi dan program training K3LL tersedia namun tidaktertulis \n2. Ada 3 bukti Orientasi/kelas induksi'),
	(23, 6, 3, 6, ' C. (Score: 6.00) 1. Ada Program tertulis yang mengatur orientasi/induksi dan/atau mentoring untuk pegawai baru atau penugasan baru. 2. Ada Buku saku/materi terkait peraturan perusahaan diberikan kepada karyawan 3. Ada 3 bukti Orientasi/kelas induksi'),
	(24, 6, 4, 10, ' D. (Score: 10.00) 1. Ada Program tertulis yang mengatur orientasi/induksi dan/atau mentoring untuk pegawai baru atau penugasan baru. 2. Ada Buku saku/materi terkait peraturan perusahaan diberikan kepada karyawan 3. Ada 3 bukti Orientasi/kelas induksi 4. Ada 3 Bukti pelatihan K3LL berupa daftar hadir /sertifikat 5. 3 Bukti tindak lanjuobservasi keselamatan/BBS'),
	(25, 7, 1, 0, ' A. (Score: 0.00) Tidak ada training matrix, rencana training dan implementasi training'),
	(26, 7, 2, 3, 'B. (Score: 3.00) 1. Ada Training Matrix aspek K3LL untukjabatan di bawah manajemer tapi tidak ada rencana pelatihan 2. Pelatihan dilaksanakan namun tidak sesuai dengan kebutuhan dan rencana pelatihan 3. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir'),
	(27, 7, 3, 6, 'C. (Score: 6.00) 1. Ada Training Matrix aspek K3LL untuk jabatan di bawah manajer 2. Ada Rencana Training 3. Pelatihan dilaksanakan namun tidak sesuai dengan kebutuhan dan rencana pelatihan 4. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir 5. Tidak ada pelatihan penyegaran'),
	(28, 7, 4, 10, ' D. (Score: 10.00) 1. Ada Training Matrix aspek K3LL untuk jabatan di bawah manajer 2. Ada Rencana Training 3. Pelatihan dilaksanakan sesuai dengan kebutuhan dan rencana pelatihan 4. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir 5. Ada pelatihan penyegaran'),
	(29, 8, 1, 0, 'A. (Score: 0.00) 1. Tidak ada proses/program untuk pengelolaan kontraktor 2. Prosedur tersedia namun tidak divalidasi kembali lebih dari 5 tahun 3 Ada prosedur pengelolaan kontraktor tapi tidak diperjelas)'),
	(30, 8, 2, 3, 'B. (Score: 3.00) 1. Ada Prosedur namun tidak diimplementasikan 2. Ada Prosedur namun tidak terupdate 3. Ada Prosedur tapi implementasi hanya pada satu tahapan pengelolaan kontraktor (bukan siklus utuh)'),
	(31, 8, 3, 6, 'C. (Score: 6.00) 1. Prosedur tersedia dan update kurang dari 3 tahun 2. Implementasi pada tahap seleksi dan evaluasi akhir kontrak 3. - Standard perusahaan telah diperjelas, dikomunikasikan dan digunakan pada tahap seleksi saja'),
	(32, 8, 4, 10, '  D. (Score: 10.00) 1. Prosedur tersedia dan update 2. Implementasi pada tahap seleksi, kontrak berjalan, dan evaluasi akhir kontrak (full Cycle) 3. Standard perusahaan telah diperjelas, dikomunikasikan 4. Pengelolaan kontraktor dilakukan secara full Cycle (minimal ada 1 contoh)'),
	(33, 9, 1, 0, 'A. (Score: 0.00) Tidak tersedia standard K3LL'),
	(34, 9, 2, 3, 'B. (Score: 3.00) 1. Prosedur K3LL tersedia namun tidak sesuai dengan standard industri (OGP, OSHA, ANSI, dll) 2. Tersedia Program untuk mendata peraturan K3LL yang berlaku'),
	(35, 9, 3, 6, ' C. (Score: 6.00) 1. Prosedur K3LL tersedia dan dibuat sesuai dengan strandard industri (OGP, OSHA, ANSI, dll) 2. AdaProgram untuk mendata peraturan dan persyaratan K3LL 3. Ada Evaluasi dari kepatuhan terhadap peraturan dan persyaratan K3LL lainnya dilaksanakan\n '),
	(36, 9, 4, 10, ' D. (Score: 10.00) 1. Prosedur K3LL tersedia dan dibuat sesuai dengan strandard industri (OGP, OSHA, ANSI, dll) 2. AdaProgram untuk mendata peraturan dan persyaratan K3LL 3. Ada Evaluasi dari kepatuhan terhadap peraturan dan persyaratan K3LL lainnya dilaksanakan 4. Seluruh prosedur K3LL ditinjau secara rutin dan diperbaharui sesuai kebutuhan 5. Peraturan dan persyaratan K3LL dikomunikasikan kepada seluruh karyawan dan dilaksanakan dengan konsisten'),
	(37, 10, 1, 0, ' A. (Score: 0.00) Tidak ada bukti melakukan penilaian dan pengendalian risiko'),
	(38, 10, 2, 3, 'B. (Score: 3.00) 1. Prosedur Manajemen Risiko ada tapi tidak ada implementasi 2. Penilaian risiko dilakukan hanya saat operasi di lapangan (JSA)*contoh: JSA, HAZOPS, HAZID, IADL, HIRAC'),
	(39, 10, 3, 6, '  C. (Score: 6.00) \'1. Ada Prosedur Manajemen Risiko 2. Prosedur Manajemen Risiko mencakup aktifitas pekerjaan dan matriks risiko 3. Ada Implementasi Manajemen Risiko *contoh: JSA, HAZOPS, HAZID, IADL , HIRAC tapi tidak konsisten)\n'),
	(40, 10, 4, 10, '  D. (Score: 10.00) \'1. Ada Prosedur Manajemen Risiko 2. Prosedur Manajemen Risiko mencakup aktifitas pekerjaan dan matriks risiko 3. Ada Implementasi Manajemen Risiko *contoh: JSA, HAZOPS, HAZID, IADL , HIRAC dilaksanakan secara konsisten'),
	(41, 11, 1, 0, ' A. (Score: 0.00) Tidak terdapat kebijakan kesehatan yang spesifik dan tidak ada program manajemen bahaya kesehatan.'),
	(42, 11, 2, 3, 'B. (Score: 3.00) Terdapat program manajemen kesehatan untuk risiko-risiko kesehatan yang signifikan seperti kebisingan, pajanan bahan kimia, malaria, penyalahgunaan obat-batan, penyakit menular melelui darah'),
	(43, 11, 3, 6, ' C. (Score: 6.00) Terdapat kebijakan kesehatan yang komprehensif dan program-program yang mencakup risiko kesehatan personil yang berhubungan dengan aktifitas perusahaan.\n'),
	(44, 11, 4, 10, 'D. (Score: 10.00) Korom c; ditambah dengan pemantauan pajanan secara rutin terhadap semua bahaya kesehatan yang mungkin ada dan dilakukan di semua operasi. '),
	(45, 12, 1, 0, 'A. (Score: 0.00) Tidak ada system prosedur tentang Keselamatan kerja'),
	(46, 12, 2, 3, 'B. (Score: 3.00) 1.Bahaya keselamatan diidentifikasi tetapi tidak secara komprehensif ada pada HIRADC 2. Pengendalian bahaya terkait ditetapkan namun tidak diimplementasikan'),
	(47, 12, 3, 6, ' C. (Score: 6.00) 1. Bahaya keselamatan diidentifikasi secara komprehensif 2. Pengendalian bahaya terkait ditetapkan, sudah diimplementasikan namun tidak konsisten\n '),
	(48, 12, 4, 10, ' D. (Score: 10.00) 1. Bahaya keselamatan diidentifikasi secara komprehensif 2. Pengendalian bahaya terkait ditetapkan, sudah diimplementasikan namun tidak konsisten 3. Ada Prosedur/program manajemen risiko keselamatan seperti prosedur pengangkatan yang aman, perusahaan, bekerja di ketinggian, masuk ruang terbatas,isolasi energi, ijin keselamatan transportasi, dll 4. Ada bukti implementasi program 5. ada Monitoring melalui audit, inspeksi, laporan observasi, dll'),
	(49, 13, 1, 0, ' A. (Score: 0.00) Tidak ada system prosedur tentang Kegiatan Logistik'),
	(50, 13, 2, 3, ' B. (Score: 3.00) 1. Bahaya logistik diidentifikasi tetapi tidak komprehensif 2. Pengendalian bahaya terkait ditetapkan namun tidak diimplementasikan'),
	(51, 13, 3, 6, ' C. (Score: 6.00) 1. Bahaya logistik diidentifikasi secara komprehensif 2. Pengendalian bahaya ditetapkan namun tidak secara konsisten diimplementasikan\n '),
	(52, 13, 4, 10, ' D. (Score: 10.00) 1. Bahaya logistik diidentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja 2. Pengendalian bahaya logistik dan pengendaliannya diimplementasikan secara konsisten. 3. Terdapat bukti-bukti pemantauan efektivitas usaha pengendalian melalui: audit, inspeksi, laporan observasi, dll'),
	(53, 14, 1, 0, 'A. (Score: 0.00) Kontraktor tidak mempunyai metode yang tepat untuk mengelola limbah'),
	(54, 14, 2, 3, ' B. (Score: 3.00) 1. Bahaya pencemaran lingkungan diidentifikasi tetapi tidak secara komprehensif 2. Pengendalian bahaya terkait ditetapkan tapi tidak diimplementasikan'),
	(55, 14, 3, 6, 'C. (Score: 6.00) 1. Bahaya lingkungan diidentifikasi secara komprehensif 2. Pengendalian bahayat ditetapkan namun tidak secara konsisten diimplementasikan\n'),
	(56, 14, 4, 10, 'D. (Score: 10.00) 1. Bahaya pencemaran lingkungan diidentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja 2. Pengendalian bahaya pencemaran lingkungan dan pengendaliannya diimplementasikan secara konsisten. 3. Ada bukti pemantauan efektivitas usaha pengendalian bahaya (laporan kualitas udara, air, tanah, neraca limbah, dll)'),
	(57, 15, 1, 0, 'A. (Score: 0.00) Kontraktor tidak mempunyai metode yang tepat untuk mengelola bahaya keamanan'),
	(58, 15, 2, 3, ' B. (Score: 3.00) 1. Bahaya keamanan diidentifikasi tetapi tidak komprehensif 2. Pengendalian bahaya terkait ditetapkan namun tidak diimplementasikan'),
	(59, 15, 3, 6, 'C. (Score: 6.00) 1. Bahaya keamanan diidentifikasi secara komprehensif 2. Pengendalian bahaya ditetapkan namun tidak secara konsisten diimplementasikan\n'),
	(60, 15, 4, 10, 'D. (Score: 10.00) 1. Bahaya keamanan diidentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja 2. Pengendalian bahaya logistik dan pengendaliannya diimplementasikan secara konsisten. 3. Terdapat bukti-bukti pemantauan efektivitas usaha pengendalian bahaya (audit, inspeksi, laporan, sidak, dll)'),
	(61, 16, 1, 0, 'A. (Score: 0.00) Kontraktor tidak mempunyai metode yang tepat untuk mengelola bahaya sosial'),
	(62, 16, 2, 3, ' B. (Score: 3.00) 1. Bahaya sosial diidentifikasi tetapi tidak secara komprehensif seperti prosedur khusus atau HIRADC 2. Pengendalian bahaya terkait ditetapkan'),
	(63, 16, 3, 6, '  C. (Score: 6.00) 1. Bahaya sosial diidentifikasi secara komprehensif 2. Pengendalian bahaya ditetapkan namun tidak secara konsisten diimplementasikan\n'),
	(64, 16, 4, 10, '  D. (Score: 10.00) 1. Bahaya sosial diidentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja 2. Pengendalian bahaya sosial dan pengendaliannya diimplementasikan secara konsisten. 3. Terdapat bukti-bukti pemantauan efektivitas usaha pengendalian bahaya melalui laporan rutin'),
	(65, 17, 1, 0, 'A. (Score: 0.00) PPE disediakan, tapi tidak ada prosedur untuk menilai kebutuhan individu.'),
	(66, 17, 2, 3, 'B. (Score: 3.00) 1. Terdapat Prosedur APD, matrix APD, Standard (referensi) APD serta distribusi dan penggantiannya 2. Bukti komunikasi program APD kepada pekerja 3. Ada bukti APD dibagikan sesuai matriks'),
	(67, 17, 3, 6, 'C. (Score: 6.00) 1.Prosedur APD mencakup pemakaian dan pemeliharaan APD 2.Program APD mencakup pelatihan APD 3. Ada 3 bukti Inspeksi APD dilakukan\n'),
	(68, 17, 4, 10, 'D. (Score: 10.00) Seperti score 6 ditambahkan: 4. Ketersediaan APD didokumentasikan dan dimonitor dan dipertahankan, ada informasi jumlah cadangan APD '),
	(69, 18, 1, 0, 'Tidak ada panduan / manual HSE'),
	(70, 18, 2, 3, ' 1. Manual K3LL, SOP/Instruksi Kerja tersedia namun tidak mencakup semua aktivitas kerja \n2. Program verifikasi yang tidak terstruktur spt kunjungan lapangan, MWT, inspeksi'),
	(71, 18, 3, 6, '1. SOP/Instruksi kerja yang menyeluruh dan mencakup semua aktivitas kerja termasuk aktivitas risiko tinggi\n2. Program verifikasi yang terstruktur telah diimplementasi namun belum konsisten'),
	(72, 18, 4, 10, '1. SOP/Instruksi Kerja yang menyeluruh dah dan mencakup semua aktivitas kerja termasuk aktivitas risiko tinggi dan telah divalidasi \n2. Program verifikasi yang terstruktur telah diimplementasi secara konsisten'),
	(73, 19, 1, 0, 'A. (Score: 0.00) Tidak ada program untuk mengidentifikasi atau mengevaluasi bahaya dan kondisi peralatan'),
	(74, 19, 2, 3, ' B. (Score: 3.00) 1. Program terbatas mengenai infrastruktur dan peralatan, contoh: hanya perawatan korektif tidak ada program pencegahan, hanya dilakukan pada peralatan milik klien 2. Sertifikasi dilakukan hanya atas permintaan klien'),
	(75, 19, 3, 6, 'C. (Score: 6.00) 1.Program terencana perawatan untuk pencegahan (PM), termasuk jadwal inspeksi rutin dan implementasi yang konsisten 2. Sertifikasi peralatan secara konsisten dilakukan untuk semua peralatan tidak hanya milik klien\n'),
	(76, 19, 4, 10, 'D. (Score: 10.00) Semua hal pada score 6 dengan tambahan: Program perawatan dilakukan oleh orang yang kompeten/spesialis dan ada inspeksi rutin oleh manajemen'),
	(77, 20, 1, 0, ' A. (Score: 0.00) Tidak ada System tentang manajemen Perubahan'),
	(78, 20, 2, 3, 'B. (Score: 3.00) 1. MOC Hanya berlaku atas permintaan klien atau/dan 2. Hanya mempunyai prosedur MOC saja tanpa implementasi'),
	(79, 20, 3, 6, 'C. (Score: 6.00) 1. Mempunyai program MOC dan implementasinya sendiri minimal dengan 1 contoh\n'),
	(80, 20, 4, 10, 'D. (Score: 10.00) 1. Ada prosedur MOC 2. Ada minimal 1 bukti Implementasi 3. Ada evaluasi & tindak lanjut efektivitas sistem MOC'),
	(81, 21, 1, 0, 'A. (Score: 0.00) Tidak ada prosedur penanggulangan tanggap darurat'),
	(82, 21, 2, 3, ' B. (Score: 3.00) 1. Prosedur dan dokumen Rencana Tanggap Darurat tersedia yang meliputi kebakaran, evakuasi medis, dan tumpahan bahan kimia 2. Latihan tanggap darurat dilakukan tapi tidak ada program'),
	(83, 21, 3, 6, 'C. (Score: 6.00) 1. Prosedur Rencana Tanggap Darurat tersedia untuk semua situasi darurat 2. Latihan Tanggap Darurat terencana dan dilakukan secara teratur\n'),
	(84, 21, 4, 10, 'D. (Score: 10.00) C + Melibatkan fungsi eksternal dan sudah ada evaluasi hasil latihan'),
	(85, 22, 1, 0, 'A. (Score: 0.00) Tidak ada sistim untuk memantau kinerja HSE (safety & lingkungan)'),
	(86, 22, 2, 3, ' B. (Score: 3.00) 1. Ada laporan HSE kinerja (safety & lingkungan) bulanan yang sah (diapprove atau ditandatangan manajemen) dengan min 1 contoh laporan'),
	(87, 22, 3, 6, '\n C. (Score: 6.00) 1. Memenuhi kriteria B 2. Ada Prosedur Pemantauan\n'),
	(88, 22, 4, 10, 'D. (Score: 10.00) 1. memenuhi kriteria C 2. Ada bukti penghargaan (Jam kerja selamat dari instansi terkait, incident dll) 3. Ada minimal 3 laporan bulanan yang meliputi: - jam kerja selamat - jumlah kejadian'),
	(89, 23, 1, 0, 'A. (Score: 0.00) 1. Data kinerja HSE dalam 3 tahun terakhir tidak lengkap 2. Tidak ada definisi istilah kinerja HSE'),
	(90, 23, 2, 3, ' B. (Score: 3.00) 1. Ada Data kinerja HSE dalam 3 tahun terakhir lengkap 2. Ada definisi istilah kinerja HSE 3. Rasio kecelakaan tidak berubah'),
	(91, 23, 3, 6, 'C. (Score: 6.00) 1. Ada catatan insiden dan kinerja HSE tahun 3 terakhir 2. Ada penurunan insiden kurang dari atau sama dengan 20 % setahun 3. Ada peninjauan kinerja setiap 1 tahun sekali\n'),
	(92, 23, 4, 10, 'D. (Score: 10.00) 1. Ada catatan insiden dan kinerja HSE tahun 3 terakhir 2. Rasio kecelakaan menurun lebih dari 20% setahun Laporan kinerja harus disyahkan / ditandatangani manajemen. NOTE : JIKA VENDOR MENYATAKAN TIDAK ADA KECELAKAAN NAMUN TIDAK DAPAT MENUNJUKKAN DATA JAM KERJA MAKA DIBERI SCORE A)'),
	(93, 24, 1, 0, ' A. (Score: 0.00) Kontraktor memiliki pemantauan kinerja salah satu parameter kinerja saja (kesehatan/lingkungan/kemanan)'),
	(94, 24, 2, 3, 'B. (Score: 3.00) 1.Kontraktor memantau kinerja tiga parameter kinerja saja (kesehatan/lingkungan/kemanan)'),
	(95, 24, 3, 6, ' C. (Score: 6.00) 1. Kontraktor memantau kinerja empat parameter kinerja saja ( kesehatan/lingkungan/kemanan, keselamatan). 2. Ada laporan bulanan tidak lengkap.\n'),
	(96, 24, 4, 10, 'D. (Score: 10.00) 1. Kontraktor memantau kinerja empat parameter kinerja saja (kesehatan/lingkungan/keamanan, keselamatan). 2. Ada laporan bulanan lengkap dalam 2 tahun. 3. Ada bukti pembahasan dalam rapat manajemen berupa MOM & daftar hadir.'),
	(97, 25, 1, 0, 'A. (Score: 0.00) Temuan penyelidikan kecelakaan pada umumnya tidak dikomunikasikan'),
	(98, 25, 2, 3, 'B. (Score: 3.00) 1. Temuan dikomunikasikan secara terbatas kepada personil kunci / utama melalui memo internal perusahaan atau media yang serupa'),
	(99, 25, 3, 6, 'C. (Score: 6.00) 1. Temuan dikomunikasikan kepada seluruh karyawan melalui papan pengumuman, email, broadcast, wallpaper, SSD\n'),
	(100, 25, 4, 10, 'D. (Score: 10.00) 1. Seperti pada C 2. Ada keterangan implikasi terinci untuk keperluan peningkatan kinerja HSE (absensi, MoM, rekomendasi) 3. Ada system; Ada formulir; Ada bukti investigasi'),
	(101, 26, 1, 0, 'A. (Score: 0.00) Terdapat lebih dari satu kejadian kecelakaan serius (LTI) dalam lima tahun terakhir'),
	(102, 26, 2, 3, ' B. (Score: 3.00) 1. Satu kejadian kecelakaan serius (LTI) pada lima tahun terakhir (harus tersedia data dalam 5 tahun)'),
	(103, 26, 3, 6, 'C. (Score: 6.00) 1. Terdapat kejadian MTC dan First Aid saja pada 5 tahun terakhir (harus tersedia data dalam 5 tahun)\n'),
	(104, 26, 4, 10, 'D. (Score: 10.00) 1. Hanya ada kejadian first aid dalam lima tahun Terakhir(harus tersedia data dalam 5 tahun)'),
	(105, 27, 1, 0, 'A. (Score: 0.00) Elemen Audit Tidak ada dalam SM HSE'),
	(106, 27, 2, 3, ' B. (Score: 3.00) 1. Audit dan prosedur tersedia dalam SM HSE, namun tidak ada rincian khusus mengenai penjadwalan dan ruang lingkup'),
	(107, 27, 3, 6, 'C. (Score: 6.00) 1. Audit dan prosedur tersedia dalam SM HSE 2. ada rincian khusus mengenai penjadwalan dan ruang lingkup\n'),
	(108, 27, 4, 10, 'D. (Score: 10.00) 1. Poin C + 2. Ada tim Auditor dan auditee 3. Realisasi tindaklanjut temuan Audit'),
	(109, 28, 1, 0, 'A. (Score: 0.00) Kontraktor tidak memiliki system managemet review'),
	(110, 28, 2, 3, 'B. (Score: 3.00) 1. Ada prosedur yang mengatur management review ( minimal mengenai proses, jadwal, ruang lingkup dan tugas & tanggungjawab)'),
	(111, 28, 3, 6, 'C. (Score: 6.00) 1. Ada poin no B 2. Ada 1 buktii management review dengan 1 bukti MOM & Daftar hadir 3. Bukti tindaklanjut temuan audit hasil pembahasan manajemen review.\n'),
	(112, 28, 4, 10, 'D. (Score: 10.00) 1. Ada Poin no C 2. Ada 2 bukti management review dengan 2 MOM & Daftar hadir 3. Ada bukti tindaklanjut temuan audit 4. Ada bukti tindak lanjutt laporan/hasil tinjauan manajemen dan komunikasinya 5. Ada bukti penelusuran aksi tindaklanjut hasil tinjauan manajemen (action tracking)'),
	(113, 29, 1, 0, 'A. (Score: 0.00) Tidak memiliki Pedoman Sistem Manajemen'),
	(114, 29, 2, 3, 'B. (Score: 3.00) 1. Ada sistem manajemen'),
	(115, 29, 3, 6, 'C. (Score: 6.00) 1. Ada sistem manajemen & menerapkan memiliki Pedoman SM 2. Sedang dalam proses sertifikasi 3. Ada bukti Audit ISO/OHSAS\n'),
	(116, 29, 4, 10, 'D. (Score: 10.00) 1. Ada bukti sertifikasi secara eksternal untuk satu atau lebih standar internasional seperti ISO 9001 ISO 14001, OHSAS 18OO1 dan masih berlaku.'),
	(117, 30, 1, 0, 'A. (Score: 0.00) Bukan anggota asosiasi'),
	(118, 30, 2, 3, 'B. (Score: 3.00) 1. Menjadi anggota satu asosiasi yang tidak menonjolkan HSE (KADIN, IATMI, Asrena Migas, IPA)'),
	(119, 30, 3, 6, 'C. (Score: 6.00) 1. Kontraktor minimal menjadi anggota satu asosiasi HSE (NFPA, IAKKI, A2K3, dll). Bisa perorangan maupun perusahaan\n \n'),
	(120, 30, 4, 10, 'D. (Score: 10.00) 1. Kontraktor adalah peserta aktif dari minimal satu asosiasi HSE (Ada bukti 3 kali keikutsertaan kegiatan dalam 2 tahun terakhir. Contoh IAKKI (Ikatan Ahli Keselamatan Kerja Indonesia) score C, IPA (Indonesia Petroleum Association) score B; Bisa perorangan maupun perusahaan'),
	(121, 31, 1, 0, 'A. (Score: 0.00) Tidak ada'),
	(122, 31, 2, 3, 'B. (Score: 3.00) 1. Memiliki satu Sertifikat ISO 9001, 14001, OHSAS'),
	(123, 31, 3, 6, 'C. (Score: 6.00) 1. Memiliki Dua Sertifikat ISO 9001, 14001, OHSAS\n'),
	(124, 31, 4, 10, 'D. (Score: 10.00) 1. Memiliki Sertifikat ISO 9001, 14001, OHSAS Terintegrasi');
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;

-- Dumping structure for table csms.perusahaan
CREATE TABLE IF NOT EXISTS `perusahaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_perusahaan` (`nama`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- Dumping data for table csms.perusahaan: 4 rows
/*!40000 ALTER TABLE `perusahaan` DISABLE KEYS */;
INSERT INTO `perusahaan` (`id`, `nama`, `alamat`, `telepon`, `created_at`, `updated_at`) VALUES
	(1, 'PT Tripatra Engineering', ' Jl. Indy Bintaro Office Park Jl. Boulevard Bintaro Jaya Blok B7/A6 ', '(021) 8674042 / (021) 8674043', '0000-00-00 00:00:00', NULL),
	(2, 'PT Buana Megah Teknik', NULL, NULL, '0000-00-00 00:00:00', NULL),
	(3, 'PT Kaltimex Lestari Makmur', NULL, NULL, '0000-00-00 00:00:00', NULL),
	(4, 'PT Adiguna Shipbuilding Engineering', NULL, NULL, '0000-00-00 00:00:00', NULL);
/*!40000 ALTER TABLE `perusahaan` ENABLE KEYS */;

-- Dumping structure for table csms.score
CREATE TABLE IF NOT EXISTS `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `poin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table csms.score: 4 rows
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` (`id`, `name`, `poin`) VALUES
	(1, 'A', 0),
	(2, 'B', 3),
	(3, 'C', 6),
	(4, 'D', 10);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;

-- Dumping structure for table csms.subelemen
CREATE TABLE IF NOT EXISTS `subelemen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elemen_id` int(11) DEFAULT NULL,
  `bagian` varchar(50) DEFAULT NULL,
  `penjelasan` text,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table csms.subelemen: 31 rows
/*!40000 ALTER TABLE `subelemen` DISABLE KEYS */;
INSERT INTO `subelemen` (`id`, `elemen_id`, `bagian`, `penjelasan`, `keterangan`) VALUES
	(1, 1, '1.1', 'Komitmen K3L melalui kepemimpinan', '"1.1. Komitmen HSE melalui kepemimpinan#\na) Bagaimana para senior manajer terlibat secara pribadi dalam manajemen HSE? Lampirkan bukti;\nb) Memberikan bukti komitmen pada semua tingkat organisasi ? Lampirkan bukti ;\nc) Bagaimana Anda mempromosikan budaya yang positif terhadap masalah – masalah HSE? Lampirkan bukti ;*"\r\n'),
	(2, 2, '2.1', 'Dokumen kebijakan K3LL', '"2.1. Kebijakan dan Dokumen HSE #\na) Apakah perusahaan mempunyai dokumen kebijakan HSE ? \n   Ya      ?  Tidak  \n Jika Ya, lampirkan.;\nb) Siapa yang memikul tanggung jawab keseluruhan dan tanggung jawab akhir dari HSE dalam organisasi Anda? Lampirkan  bagan organisasi ;\nc) Siapa orang yang paling senior dalam organisasi yang bertanggung jawab terhadap kebijakan HSE yang sedang dijalankan pada daerah kewenangan dan lokasi di mana karyawannya bekerja ? Lampirkan bagan organisasi;*"\r\n'),
	(3, 2, '2.2', 'Sasaran strategis K3LL Berkala (tahunan)', '"2.2. Sasaran Strategis K3LL berkala #\na) Jelaskan secara rinci metoda-metoda yang Anda gunakan sebagai sumber pernyataan kebijakan HSE kepada semua karyawan Anda.;\nb) Pengaturan apa yang Anda punyai untuk memberitahu karyawan mengenai perubahan kebijakan HSE ? Lampirkan bukti/prosedur ;*"\r\n'),
	(4, 3, '3.1', 'Struktur Organisasi untuk Pengelolaan K3LL', '"3.1. Struktur Organisasi untuk Pengelolaan K3LL#\na) Bagaimana struktur perusahaan Anda dibuat untuk mengelola dan mengkomunikasikan K3LL secara efektif ?;\nb) Apakah pertemuan-pertemuan K3LL mempromosikan pemahaman K3LL?;\nc) Apakah klien dan kontraktor bertemu secara regular untuk mendiskusikan dan menindaklanjuti situasi \'interface\'?;\nd) Ketentuan apa Yang dibuat perusahaan Anda untuk rapat-rapat komunikasi K3LL ? Lampirkan struktur organisasi.;*"\r\n'),
	(5, 3, '3.2', 'Pelatihan K3LL untuk para manajer, penyelia (supervisor) dan pemegang jabatan penting K3LL', '"3.2. Pelatihan K3LL untuk para manajer, penyelia (supervisor) dan pemegang jabatan penting K3LL#\na) Apakah para manajer dan penyelia di semua tingkat yang akan merencanakan, memantau, memperkirakan dan melaksanakan pekerjaan sudah menerima pelatihan formal K3LL sesuai tanggung jawab mereka dalam kaitannya dengan pelaksanaan pekerjaan sesuai dengan persyaratan-persyaratan K3LL? "" Sudah Belum;\nb) Jika sudah, berikan rincian. Jika pelatihan diberikan in-house, jelaskan materi dan lamanya kursus. Termasuk pelatihan penyegaran bagi manajer dan pengawas yang lama. Berikan contoh matriks pelatihan.;\nc) Bagaimana Anda mengidentifikasi area-area operasi perusahaan Anda yang membutuhkan pelatihan khusus, contohnya pelatihan yang berkaitan dengan bahaya kesehatan seperti radiasi, asbes dan bahan-bahan kimia?;\nd) Sumberdaya spesialis K3LL apa saja yang dimiliki oleh organisasi Anda?;\ne) Bagaimana perusahaan Anda menyediakan pelatihan kekhususan kepada staf K3LL?;*"\r\n'),
	(6, 3, '3.3', 'Pelatihan K3LL Umum (pada seluruh pekerja dan pihak yang terkait)', '"3.3. Pelatihan K3LL Umum (pada seluruh pekerja dan pihak yang terkait) #\na) Pengaturan apa yang telah dibuat perusahaan Anda untuk memastikan bahwa karyawan baru mempunyai pengetahuan tentang K3LL dasar dalam industri, dan untuk menjaga agar pengetahuan tersebut selalu up to date ?;\nb) Pengaturan apa yang telah dibuat perusahaan Anda untuk memastikan bahwa karyawan, termasuk subkontraktor, juga memahami kebijakan, tata cara, dan persyaratan K3LL Anda ?;\nc) Pengaturan apa yang telah dibuat perusahaan Anda untuk memastikan bahwa karyawan dan karyawan subkontraktor yang baru telah diberi instruksi dan menerima informasi mengenai bahaya spesifik yang timbul dari sifat pekerjaan ?\n Catatan untuk (a), (b) & (c): jika pelatihan diberikan in-house, berikan rincian konten pelatihan.;*"'),
	(7, 3, '3.4', 'Pemenuhan Kompetensi K3LL', '"3.4. Pemenuhan Kompetensi K3LL#\na) Apakah organisasi Anda memiliki sistem kompetensi? Jika YA, jelaskan ruang lingkup dan konten dari sistem kompetensi tersebut.;\nb) Pengaturan apa yang telah dibuat perusahaan Anda untuk memastikan bahwa pengetahuan K3LL karyawan yang sekarang selalu up to date ? Jika pelatihan dilakukan in-house berikan rincian materi pelatihan.;*"\r\n'),
	(8, 3, '3.5', 'Pengelolaan K3LL kontraktor (mitra kerja)', '"3.5. Pengelolaan K3LL kontraktor (mitra kerja)#\na) Apakah perusahaan Anda mempunyai sistem atau proses pengelolaan kontraktor? Jika YA, berikan penjelasan dari proses atau sistem tersebut.;\nb) Bagaimana Anda menilai kontraktor, kompetensi K3LL atau kinerja K3LL?;\nc) Di mana Anda menjelaskan standar yang Anda tuntut agar dipenuhi oleh kontraktor Anda ?;\nd) Bagaimana Anda memastikan standar-standar di bawah ini telah dipenuhi dan diperiksa ?;\ne) Sebutkan nama-nama subkontraktor utama, pada saat ini, kalau ada.;*"\r\n'),
	(9, 3, '3.6', 'Peraturan dan Standar K3LL', '"3.6. Peraturan dan Standar K3LL#\na) Bagaimana Anda mengetahui standar-standar industri dan peraturan baru K3LL yang mungkin berlaku bagi aktivitas Anda ?;\nb) Adakah struktur menyeluruh untuk membuat, memperbarui dan menyebarkan standar K3LL ?;\nc) Apakah Anda memiliki Standar K3LL ? Apakah standar Perusahaan Anda sesuai dengan OGP/pedoman industri atau praktek-praktek yang direkomendasikan? Jelaskan!;*"\r\n'),
	(10, 4, '4.1', 'Penilaian dan pengendalian risiko', '"4.1. Penilaian dan pengendalian risiko #\nBagaimana perusahaan anda mengidentifikasikan bahaya, menilai risiko mengendalikan dan memitigasi dampak ke tingkat yang dapat diterima secara praktis ALARP (As Low As Reasionable and Practicable) ;*"\r\n'),
	(11, 4, '4.2', 'Bahaya terhadap kesehatan kerja', '"4.2. Bahaya terhadap kesehatan kerja #\na) Apakah Anda memiliki kebijakan khusus dan program mengenai bahaya-bahaya kesehatan yang spesifik seperti penyalahgunaan obat-obatan, penyakit menular melalui darah (blood borne pathogens), malaria, dan lain-lain.?;\nb) Bahaya-bahaya kesehatan apa saja (kimia, getaran, kebisingan, radiasi, dil) yang berkaitan dengan ruang lingkup pekerjaan Anda? Jelaskan bagaimana bahaya-bahaya kesehatan kerja diidentifikasi, dinilai dan dikendalikan.;\nc )Sistem-sistem apa saja yang tersedia untuk mengendalikan bahaya-bahaya tersebut dan memantau efektifitas pengendaliannya? Apakah pemantauan pajanan pekerja dilakukan secara regular merupakan bagian dari sistem tersebut?;*"\r\n'),
	(12, 4, '4.3', 'Bahaya terhadap keselamatan kerja', '"4.3. Bahaya terhadap keselamatan kerja #\na) Bahaya-bahaya keselamatan apa saja (mechanical guarding, bekerja di ketinggian, pengangkatan dan tekel, masuk ruang terbatas, atmosfir eksplosif, dll) yang berkaitan dengan ruang lingkup pekerjaan Anda?;\nb) Sistem-sistem apa saja yang tersedia untuk mengendalikan bahaya-bahaya tersebut dan memantau efektifitas pengendaliannya?;*"\r\n'),
	(13, 4, '4.4', 'Bahaya Kegiatan Logistik', '"4.4. Bahaya Kegiatan Logistik #\na) Bahaya-bahaya apa saja (transportasi darat, udara, laut, penanganan bahan/material, dll) yang berkaitan dengan ruang lingkup pekerjaan Anda?;\nb) Sistem-sistem apa saja yang tersedia untuk mengendalikan bahaya-bahaya tersebut dan memantau efektifitas pengendaliannya?;*"\r\n'),
	(14, 4, '4.5', 'Bahaya terhadap Lingkungan', '"4.5. Bahaya terhadap Lingkungan #\na) Bahaya-bahaya lingkungan apa saja (ceceran/tumpahan bahan kimia, emisi udara, pembuangan limbah, dll) yang berkaitan dengan ruang lingkup pekerjaan Anda?;\nb) Sistem-sistem apa saja yang tersedia untuk mengendalikan bahaya-bahaya tersebut dan memantau efektifitas pengendaliannya?;*"\r\n'),
	(15, 4, '4.6', 'Bahaya terhadap Keamanan', '"4.6. Bahaya terhadap keamanan #\na) Bahaya-bahaya keamanan apa saja (terorisme, penculikan, perampokan, hostile populasi lokal, dll) yang berkaitan dengan ruang lingkup pekerjaan Anda?;\nb) Sistem-sistem apa saja yang tersedia untuk mengendalikan bahaya-bahaya tersebut dan memantau efektifitas pengendaliannya?;*"\r\n'),
	(16, 4, '4.7', 'Bahaya terhadap Aspek Sosial', '"4.7. Bahaya terhadap aspek sosial #\na) Bahaya-bahaya sosial apa saja yang berkaitan dengan ruang lingkup pekerjaan Anda?;\nb) Sistem-sistem apa saja yang tersedia untuk mengendalikan bahaya-bahaya tersebut dan memantau efektifitas pengendaliannya?;*"\r\n'),
	(17, 4, '4.8', 'Alat Pelindung Diri', '"4.8. Alat Pelindung Diri #\na) Pengaturan apa yang dipunyai perusahaan Anda untuk pengadaan dan pemberian pelindung diri dan pakaian kerja, baik yang standar maupun yang diperlukan untuk kegiatan-kegiatan khusus ?;\nb) Apakah Anda menyediakan Alat Pelindung Diri (APD) yang sesuai untuk karyawan Anda ? Berikan daftar APD untuk lingkup kerja ini.;\nc) Apakah Anda memberikan pelatihan mengenai cara menggunakan APD ? Jelaskan materi pelatihan dan setiap tindak lanjutnya.;\nd) Apakah Anda mempunyai program untuk memastikan bahwa APD digunakan dan dijaga ?;*"\r\n'),
	(18, 5, '5.1', 'Panduan Operasi K3LL', '"5.1. Manual Operasi K3LL #\na) Apakah Anda mempunyai manual K3LL perusahaan atau manual Operasi Yang sesuai dengan aturan-aturan K3LL Yang dijelaskan secara rinci dalam cara kerja K3LL dan aturan keselamatan yang disahkan Oleh perusahaan seperti Yang menyangkut perancah (scaffolding) alat pengangkat, alat-alat berat, bejana tekan atau penggalian ? "" Ya Tidak Jika jawabannya Ya, lampirkan copy dari dokumen pendukung.;\nb) Bagaimana Anda memastikan bahwa cara kerja dan prosedur yang digunakan Oleh karyawan di lapangan konsisten dengan tujuan dan pengaturan kebijakan K3LL Anda ?;*"\r\n'),
	(19, 5, '5.2', 'kehandalan infrastruktur dan peralatan', '"5.2. Kehandalan Infrastruktur dan Peralatan #\na) Bagaimana Anda memastikan bahwa infrastruktur, stasiun produksi (plant) dan peralatan yang digunakan (di wilayah kerja Anda, lokasi klien, atau pada lokasi lain) disertifikasi, didaftarkan, dikendalikan dan dipelihara dengan benar dan dalam kondisi kerja yang baik ?;*"\r\n'),
	(20, 5, '5.3', 'manajemen perubahan', '"5.3. Manajemen perubahan #\na) Bagaimana Anda mengelola perubahan dan menilai risiko terkait seperti personil, peralatan, proses, dokumentasi?;*"\r\n'),
	(21, 5, '5.4', 'Rencana tanggap darurat', '"5.4. Rencana tanggap darurat #\na) Apa pengaturan yang dimiliki oleh perusahaan Anda untuk rencana tanggap darurat?;\nb) Sistuasi darurat apa saja yang tercakup?;*"\r\n'),
	(22, 6, '6.1', 'Implementasi sistem manajemen K3LLdan pemantaun kerja secara aktif', '"6.1. Implementasi sistem manajemen K3LL dan pemantauan kinerja secara aktif #\na) Pengaturan apa yang dipunyai perusahaan Anda untuk pengawasan dan pemantauan kinerja K3LL?;\nb) Bagaimana perusahaan Anda memastikan implementasi dari prosedur-prosedur kerja di lokasi kerja misalnya kepatuhan terhadap prosedur, toolbox talks, pertemuan K3LL, pengawasan, observasi pekerjaan?;\nc) Bagaimana Anda memantau kinerja K3LL karyawan misalnya sistem identifikasi bahaya, partisipasi K3LL?;\nd) Pemantauan K3LL aktif apa saja yang dilakukan (misalnya pada saat tidak terjadi insiden)?;\ne)Bagaimana Anda melaporkan dan memperbaiki kelemahan-kelemahan yang teridentifikasi?;\nf)Bagaimana Anda mengkomunikasikan hasil-hasil dari pemantaun kinerja aktif kepada personel yang relevan?;*"\r\n'),
	(23, 6, '6.2', 'Indikator kinerja K3LL\r\n', '"6.2. Indikator kinerja K3LL #\na) Berikan catatan mengenai insiden statistik tiap tahun untuk 5 tahun terakahir mengenai:\n • Jumlah kasus kematian\n • Jumlah kecelakaan kehilangan hari kerja\n • Jumlah hari yang hilang karena kecelakaan\n • Jumlah kasus kecelakaan Restricted Work Day\n • Jumlah kasus penanganan medis\n • Jumlah kasus P3K\n • Jumlah kejadian nyaris celaksa (near miss)\n • Fatal Accident Rate (per 100 million hours worked)\n • Lost Time Injury Frequency (per million hours worked)\n • Total Recordable Incident Rate (per million hours worked)\n • Indikator kinerja K3LL lain spesifik sesuai dengan kegiatan.\n Sertakan definisi perusahaan Anda mengenai istilah-istilah di atas dalam lembaran terpisah.;*"\r\n'),
	(24, 6, '6.3', 'Pemantauan kinerja K3LL\r\n', '"6.3. Pemantauan kinerja K3LL #\na) Bagaimana kinerja kesehatan dipantau dan dicatat?;\nb) Bagaimana kinerja lingkungan dipantau dan dicatat?;\nc) Bagaimana kinerja keamanan dipantau dan dicatat?;\nd) Bagaimana dan insiden near miss apa saja yang dilaporkan?;\ne) Seberapa sering kinerja K3LL ditinjau? Oleh siapa?;*"\r\n'),
	(25, 6, '6.4', 'lnvestigasi dan tindaklanjut insiden K3LL\r\n', '"6.4. Investigasi dan tindak lanjut insiden K3LL #\na) Insiden K3LL apa saja yang diinvestigasi?;\nb. Proses apa saja yang digunakan untuk menginvestigasi insiden K3LL;\nc) Siapa yang melakukan investigasi insiden K3LL;\nd) Bagaimana temuan-temuan dari investigasi insiden ditindaklanjuti untuk memastikan pencegahan yang efektif agar insiden yang serupa tidak terulang kembali;\ne) Bagaimana pelajaran yang diperoleh dari suatu insiden dikomunikasikan kepada semua personil yang relevan? Jawan?;*"\r\n'),
	(26, 6, '6.5', 'lnsiden yang harus dilaporkan sesuai undang-undang dan catatan ketidakpatuhan\r\n', '"6.5. Insiden yang harus dilaporkan sesuai undang-undang dan catatan ketidakpatuhan #\na) Pernahkah perushaan anda mengalami keharusan perbaikan atau pemberitahuan larangan dalam hal insiden / kejadian berbahaya yang bersifat hukum oleh badan nasional yang relevan, badan yang berwenang dalam K3LL, atau otoritas penegak hukum lainnya atau diperkarakan di bawah Undang-Undang K3LL selama lima tahun terakhir? Jawab;*"\r\n'),
	(27, 7, '7.1', 'Audit\r\n', '"7.1. Audit #\na Apakah  Anda mempunyai kebijakan tertulis mengenai audit K3LL? Ya Tidak Jika Ya, lampirkan.;\nb Siapa yang terlibat dalam melakukan audit K3LL? Bagaimana anggota tim audit dipilih agar memiliki keahlian khusus dan independen dari aktifitas-aktifitas yang di audit? Apa kualifikasi yang dipersyaratkan untuk menjadi auditor?;\nc Bagaimana perusahaan Anda menjadwalkan audit K3LL dan apa saja ruang lingkup audit? misalnya internal, kepatuhan peraturan, supplier/kontraktor, implementasi sistem manajemen K3LL.;\nd Bagaimanan manajemen menindaklanjuti temuan-temuan audit dan memastikan efektifitas tindaklanjut temuan tersebut?;*"\r\n'),
	(28, 7, '7.2', 'Tinjauan manajemen dan lindaklanjut\r\n', '"7.2. Tinjauan manajemen dan tindaklanjut #\na) Apakah Anda mempunyai prosedur tertulis mengenai tinjauan manajemen sistem manajemen K3LL? Jika YA, lampirkan dokumennya.;\nb Seberapa sering tinjauan sistem manajemen K3LL dilakukan dan siapa yang terlibat dalam proses tersebut?;\nc Bagaimana rencana pengendalian diidentifikasi dan upaya-upaya perbaikan dicatat dan ditelusuri agar tindaklanjut dapat berjalan efektif?;*"\r\n'),
	(29, 8, '8.1', 'Sertifikasi sistem manajemen K3LL\r\n', '"8.1. Sertifikasi sistem manajemen K3LL #\nBerikan informasi mengenai sertifikasi yang pernah Anda terima dari badan sertifikasi.;*"\r\n'),
	(30, 8, '8.2', 'Keanggotaan asosiasi\r\n', '"8.2. Keanggotaan asosiasi #\n Jelaskan sejauh mana partisipasi perusahaan Anda pada organisasi-organisasi industri yang relevan, perdagangan dan pemerintahan.;*"\r\n'),
	(31, 8, '8.3', 'Ciri-cki tambahan sistem manajemen K3LL\r\n', '"8.3. Ciri-ciri tambahan sistem manajemen K3LL #\n Apakah organisasi Anda (global, regional atau lokal) mempunyai ciri-ciri atau kekhususan lain yang belum dijelaskan pada kuesioner ini?;*"\r\n');
/*!40000 ALTER TABLE `subelemen` ENABLE KEYS */;

-- Dumping structure for table csms.sub_subelemen
CREATE TABLE IF NOT EXISTS `sub_subelemen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subelemen_id` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

-- Dumping data for table csms.sub_subelemen: 103 rows
/*!40000 ALTER TABLE `sub_subelemen` DISABLE KEYS */;
INSERT INTO `sub_subelemen` (`id`, `subelemen_id`, `no`, `keterangan`) VALUES
	(1, 1, 1, '1. Ada Organisasi K3LL dan diisi oleh minimal 2 orang'),
	(2, 1, 2, '2. SK Komite HSE (P2K3)'),
	(3, 1, 3, '3. Ada Jadwal MWT & Rapat P2K3,'),
	(4, 1, 4, '4. Minimal dua daftar hadir Rapat P2K3 & dua daftar hadir MWT'),
	(5, 1, 5, '5. Ada media promosi HSE (poster, leaflet, memo, dll) minimal 3 contoh'),
	(6, 1, 6, '6. Ada penilaian kinerja HSE kepada pekerja minimal 3 contoh penilaian'),
	(7, 2, 1, '1. Kebijakan K3LL ada memuat unsur (keselamatan, kesehatan dan lingkungan)'),
	(8, 2, 2, '2. Target K3LL tertuang dalam Kebijakan K3LL'),
	(9, 2, 3, '3. Sudah sosialisasi melalui media promosi, ada daftar hadir & MOM'),
	(10, 2, 4, '4. Ada review Kebijakan K3LL berkala'),
	(11, 2, 5, '5. Ada Komunikasi K3LL langsung melalui townhall, pelatihan, induction'),
	(12, 3, 1, '1. Ada sasaran strategis: berupa leading & lagging secara kuantitatif, ada objective K3LL, ada program K3LL'),
	(13, 3, 2, '2. ada bukti sosialisasi sasaran strategis berupa 2 MOM & 2 daftar hadir'),
	(14, 3, 3, '3. Ada evaluasi program K3LL setahun sekali'),
	(15, 4, 1, '1. Organisasi K3LL tersedia dan diisi oleh personil K3LL kerja penuh waktu'),
	(16, 4, 2, '2. personil K3LL dilengkapi dengan kualifikasi AK3'),
	(17, 4, 3, '3. Ada minimal 3 Pertemuan K3LL dengan daftar hadir dan MOM.'),
	(18, 4, 4, '4. 80% Seluruh personil hadir dalam Rapat K3LL (lihat daftar hadir bandingkan dengan dafter pekerja)'),
	(19, 4, 5, '5.Ada 2 daftar hadir & MOM pada Rapat Operasi yang membahas aspek K3LL'),
	(20, 5, 1, '1. Ada Training Matrix aspek K3LL untuk jabatan manajer ke atas'),
	(21, 5, 2, '2. Ada Rencana Training'),
	(22, 5, 3, '3. Pelatihan dilaksanakan sesuai dengan kebutuhan dan rencana pelatihan'),
	(23, 5, 4, '4. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir'),
	(24, 5, 5, '5. Ada pelatihan penyegaran'),
	(25, 6, 1, '1. Ada program tertulis yang mengatur orientas/induksi dan/atau mentoring untuk pegawai baru atau penugasan baru'),
	(26, 6, 2, '2. Ada buku saku/materi terkait peraturan perusahaan diberikan kepada karyawan'),
	(27, 6, 3, '3. Ada 3 bukti orientasi/kelas induksi'),
	(28, 6, 4, '4. Ada 3 bukti pelatihan K3LL berupadaftar hadir /sertifikat'),
	(29, 6, 5, '5. 3 bukti tindak lanjut observasi keselamatan / BBS'),
	(30, 7, 1, '1. Ada Training Matrix aspek K3Ll untuk jabatan di bawah manajer'),
	(31, 7, 2, '2. Ada Rencana Training'),
	(32, 7, 3, '3. Pelatihan di!aksanakan sesuai dencan kebutuhan dan rencana pelatihan'),
	(33, 7, 4, '4. Ada 3 bukti pelatihan (daftar hadir, sertifikat) 2 tahun terakhir'),
	(34, 7, 5, '5. Ada pelatihan penyegaran'),
	(35, 8, 1, '1. Prosedur tersedia dan update'),
	(36, 8, 2, '2. Implementasi pada tahap seleksi, kontrak becalan, dan evaluasi akhir Kontrak (full Cycle)'),
	(37, 8, 3, '3. Standard perusahaen telah diperjelas, dikomunikaslkan'),
	(38, 8, 4, '4. Pengelolaan kontraktor dilakukan secara full Cycle (minimal ada 1 contoh)'),
	(39, 9, 1, '1. Prosedur K3LL tersedia dan dibuat sesuai dengan strandard industri (OGP, OSHA, ANSI, dll)'),
	(40, 9, 2, '2. AdaProgram untuk mendata peraturan dan persyaratan K3LL'),
	(41, 9, 3, '3. Ada Evaluasi dari kepatuhan terhadap peraturan dan persyaratan K3LL lainnya dilaksanakan'),
	(42, 9, 4, '4. Seluruh prosedur K3LL ditinjau secara rutin dan diperbaharui sesuai kebutuhan'),
	(43, 9, 5, '5. Peraturan dan persyaratan K3LL dikomunikasikan kepada seluruh karyawan dan dilaksanakan dengan konsisten'),
	(44, 10, 1, '1. Ada Prosedur Manajemen Risiko'),
	(45, 10, 2, '2. Prosedur Manajemen Risiko mencakup aktifitas pekerjaan dan matriks risiko'),
	(46, 10, 3, '3. Ada Implementasi Manajemen Risiko econtoh: ISA, HAZOPS, HAZID, IADL , HIRAC dilaksanakan secara konsisten'),
	(47, 11, 1, '1. Terdapat kebijakan kesehatan yang komprehensif dan program- program yang mencakup risiko kesehatan personil yang berhubungan dengan aktifitas perusahaan'),
	(48, 11, 2, '2. pemantauan pajanan secara rutin terhadap semua bahaya kesehatan yang mungkin ada dan dilakukan di semua operasi'),
	(49, 12, 1, '1. Bahaya keselarnatan diident\'fikast secara komprehensif'),
	(50, 12, 2, '2. Pengendallan bahaya terkait ditetapkan. sudah dlimplementasikan namun tidak konsisten'),
	(51, 12, 3, '3. Ada Prosedur/program manajemen risiko keselamatan seperti prosedur pengangkatan yang aman, perusahean, bekerja di ketinggian, masuk ruang terbatas,isolasi energi, ijin keselamatan transportasi, dll'),
	(52, 12, 4, '4. Ada bukti implementasi program'),
	(53, 12, 5, '5. Ada Monitoring melalui audit, inspeksi, laporan observasi, dll'),
	(54, 13, 1, '1. Bahaya logistik diidentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja'),
	(55, 13, 2, '2. Pengendalian bahaya logistik dan pengendäliannya diimplementasikan secara konsisten.'),
	(56, 13, 3, '3. Terdapat bukti-bukti pemantauan efektivitas usaha pengendalian melalui: audit, inspeksi, laporan observasi, dll'),
	(57, 14, 1, '1. Bahaya pencemaran lingkungan dildentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja'),
	(58, 14, 2, '2. Pengendalian bahaya pencemaran lingkunean dan pengendaliannya diimplementasikan secara konsisten.'),
	(59, 14, 3, '3. Ada bukti pemantauan efektivitas usaha pengendalian bahaya (laporan kualitas udara, air, tanah, neraca limbah, dll)'),
	(60, 15, 1, '1. Bahaya keamanan diidentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja'),
	(61, 15, 2, '2. Pengendalian bahaya logistik dan pengendaliannya diimplementasikan secara konsisten.'),
	(62, 15, 3, '3. Terdapat bukti-bukti pemantauan efektivitas usaha pengendalian bahaya (audit, inspeksi, laporan, sidak, dll)'),
	(63, 16, 1, '1. Bahaya sosial diidentifikasi secara komprehensif, diperbarui dan dikomunikasikan pada pekerja'),
	(64, 16, 2, '2. Pengendalian bahaya sosial dan pengendaliannya diimplementasikan secara konsisten.'),
	(65, 16, 3, '3. Terdapat bukti-bukti pemantauan efektivitas usaha pengendalian bahaya melalui laporan rutin'),
	(66, 17, 1, '1.Prosedur APD mencakup pemakaian dan pemeliharaan APD'),
	(67, 17, 2, '2.Program APD mencakup pelatihan APD'),
	(68, 17, 3, '3. Ada 3 bukti Inspeksi APD dilakukan'),
	(69, 17, 4, '4. Ketersediaan APD didokumentasikan dan dimonitor dan dipertahankan, ada informasi jumlah cadangan APD'),
	(70, 18, 1, '1. SOP/lnstruksi Kerja yang menyeluruh dah dan mencakup semua aktivitas kerja termasuk aktivitas risiko tinggi dan telah divalidasi'),
	(71, 18, 2, '2. Program verifikesi yang terstruktur telah diimplementasi secara konsisten'),
	(72, 19, 1, '1. Program terencana perawatan untuk pencegahan (PM), termasuk jadwal inspeksi rutin dan implementasi yang konsisten'),
	(73, 19, 2, '2. Sertifikasi peralatan secara konsisten dilakukan untuk semua peralatan tidak hanya milik klien'),
	(74, 19, 3, '3. Program perawatan dilakukan oleh orang yang kompeten/spesialis dan ada inspeksi rutin oleh manajemen'),
	(75, 20, 1, '1. Ada prosedur MOC'),
	(76, 20, 2, '2. Ada minimal 1 bukti Implementasi'),
	(77, 20, 3, '3. Ada evaluasi & tindak lanjut efektivitas sistem MOC'),
	(78, 21, 1, '1. Prosedur Rencana Tanggap Darurat tersedia untuk semua situasi darurat'),
	(79, 21, 2, '2. Latihan Tanggap Darurat terencana dan dilakukan secara teratur'),
	(80, 21, 3, '3. Melibatkan fungsi eksternai dan sudah ada evaluasi hasil latihan'),
	(81, 22, 1, '1. Ada laporan HSE kinerja (safety & lingkungan) bulanan yang sah (diapprove atau ditandatangan manajemen) dengan min 1 contoh laporan'),
	(82, 22, 2, '2. Ada Prosedur Pemantauan'),
	(83, 22, 3, '3. Ada bukti penghargaan (Jam kerja selamat dari instansi terkait, incident dll)'),
	(84, 22, 4, '4. Ada minimal 3 laporan bulanan yang meliputi: - jam kerja selamat - jumlah kejadian'),
	(85, 23, 1, '1. Ada catatan insiden dan kinerja HSE tahun 3 terakhir'),
	(86, 23, 2, '2. Rasio kecelakaan menurun lebih dari 20% setahun Laporan kinerja harus disyahkan / ditandatangani manajemen. \nNOTE : JIKA VENDOR MENYATAKAN TIDAK ADA KECELAKAAN NAMUN TIDAK DAPAT MENUNJUKKAN DATA JAM KERJA MAKA DIBERI SCORE A)'),
	(87, 24, 1, '1. Kontraktor memantau kinerja empat parameter kinerja saja (kesehatan/lingkungan/keamanan, keselamatan)'),
	(88, 24, 2, '2. Ada laporan bulanan lengkap dalam 2 tahun'),
	(89, 24, 3, '3. Ada bukti pembahasan dalam rapat manajemen berupa MOM & daftar hadir'),
	(90, 25, 1, '1. Temuan dikomunikasikan kepada seluruh karyawan melalui papan pengumuman, email, broadcast, wallpaper, SSD'),
	(91, 25, 2, '2. Ada keterangan implikasi terinci untuk keperluan peningkatan kinerja HSE (absensi, MOM, rekomendasi)'),
	(92, 25, 3, '3. Ada system, Ada formulir, Ada bukti investigasi'),
	(93, 26, 1, '1. Hanya ada kejadian first aid dalam lima tahun Terakhir(harus tersedia data dalam 5 tahun)'),
	(94, 27, 1, '1. Audit dan prosedur tersedia dalam SM HSE'),
	(95, 27, 2, '2. ada rincian khusus mengenai penjadwalan dan ruane lingkup'),
	(96, 27, 3, '3. Ada tim Auditor dan auditee'),
	(97, 27, 4, '4. Realisasi tindaklanjut temuan Audit'),
	(98, 28, 1, '1. Ada prosedur yang mengatur management review ( minimal mengenai proses, jadwal, ruang lingkup dan tugas & tanggungjawab)'),
	(99, 28, 2, '2. Ada 2 buktii management review dengan 2 bukti MOM & Daftar hadir'),
	(100, 28, 3, '3. Bukti tindaklanjut temuan audit hasil pembahasan manajemen review dan komunikasinya dan action tracking'),
	(101, 29, 1, '1. Ada bukti sertifikasi secara eksternal untuk satu atau lebih standar internasional seperti ISO 9001 ISO 14001, OHSAS 18OO1 dan masih berlaku.'),
	(102, 30, 1, '1. Kontraktor adalah peserta aktif dari minimal satu asosiasi HSE (Ada bukti 3 kali keikutsertaan kegiatan dalam 2 tahun terakhir. Contoh IAKKI (Ikatan Ahli Keselamatan Kerja Indonesia) score C, IPA (Indonesia Petroleum Association) score B, Bisa perorangan maupun perusahaan'),
	(103, 31, 1, '1. Memiliki Sertifikat ISO 9001, 14001, OHSAS Terintegrasi');
/*!40000 ALTER TABLE `sub_subelemen` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
