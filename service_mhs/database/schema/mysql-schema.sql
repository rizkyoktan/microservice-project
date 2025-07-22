/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `id_pd` int(11) NOT NULL,
  `nm_pd` varchar(50) NOT NULL,
  `jk` char(4) NOT NULL DEFAULT 'L',
  `nisn` char(10) NOT NULL,
  `nik` char(16) NOT NULL,
  `tmpt_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `id_agama` int(10) unsigned DEFAULT NULL,
  `id_kk` int(10) unsigned DEFAULT NULL,
  `id_sp` int(11) DEFAULT NULL,
  `jln` varchar(80) DEFAULT NULL,
  `rt` tinyint(3) unsigned DEFAULT NULL,
  `rw` tinyint(3) unsigned DEFAULT NULL,
  `nm_dsn` varchar(40) DEFAULT NULL,
  `ds_kel` varchar(40) DEFAULT NULL,
  `id_wil_feeder` varchar(20) DEFAULT NULL,
  `id_kabupaten` int(11) DEFAULT NULL,
  `id_provinsi` int(11) DEFAULT NULL,
  `id_wil` char(8) DEFAULT NULL,
  `kode_pos` char(5) DEFAULT NULL,
  `id_jns_tinggal` tinyint(3) unsigned DEFAULT NULL,
  `id_alat_transport` tinyint(3) unsigned DEFAULT NULL,
  `telepon_rumah` varchar(20) DEFAULT NULL,
  `telepon_seluler` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_kebutuhan_khusus_mahasiswa` int(11) NOT NULL,
  `a_terima_kps` tinyint(3) unsigned DEFAULT NULL,
  `no_kps` varchar(40) DEFAULT NULL,
  `stat_pd` char(1) DEFAULT NULL,
  `nm_ayah` varchar(50) DEFAULT NULL,
  `tgl_lahir_ayah` date DEFAULT NULL,
  `id_jenjang_pendidikan_ayah` tinyint(3) unsigned DEFAULT NULL,
  `id_pekerjaan_ayah` int(10) unsigned DEFAULT NULL,
  `id_penghasilan_ayah` int(10) unsigned DEFAULT NULL,
  `id_kebutuhan_khusus_ayah` int(10) unsigned DEFAULT NULL,
  `nm_ibu_kandung` varchar(50) DEFAULT NULL,
  `tgl_lahir_ibu` date DEFAULT NULL,
  `id_jenjang_pendidikan_ibu` tinyint(3) unsigned DEFAULT NULL,
  `id_penghasilan_ibu` int(10) unsigned DEFAULT NULL,
  `id_pekerjaan_ibu` int(10) unsigned DEFAULT NULL,
  `id_kebutuhan_khusus_ibu` int(10) unsigned DEFAULT NULL,
  `nm_wali` varchar(30) DEFAULT NULL,
  `tgl_lahir_wali` date DEFAULT NULL,
  `id_jenjang_pendidikan_wali` tinyint(3) unsigned DEFAULT NULL,
  `id_pekerjaan_wali` int(10) unsigned DEFAULT NULL,
  `id_penghasilan_wali` int(10) unsigned DEFAULT NULL,
  `kewarganegaraan` char(2) DEFAULT NULL,
  `npwp` varchar(25) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `golongandarah` varchar(2) NOT NULL,
  `nik_ayah` varchar(16) NOT NULL,
  `nik_ibu` varchar(16) NOT NULL,
  `tpt_lahir_ayah` varchar(25) NOT NULL,
  `tpt_lahir_ibu` varchar(25) NOT NULL,
  `pekerjaan_ayah` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(50) NOT NULL,
  `alamat_ayah` text NOT NULL,
  `alamat_ibu` text NOT NULL,
  `rt_ayah` varchar(3) NOT NULL,
  `rw_ayah` varchar(3) NOT NULL,
  `kode_pos_ayah` varchar(7) NOT NULL,
  `rt_ibu` varchar(3) NOT NULL,
  `rw_ibu` varchar(3) NOT NULL,
  `kode_pos_ibu` varchar(7) NOT NULL,
  `size` varchar(3) NOT NULL COMMENT 'field tambahan untuk ukuran almamater',
  `facebook` varchar(100) NOT NULL,
  `instagram` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mahasiswa_pt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa_pt` (
  `id_reg_pd` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sms` int(11) DEFAULT NULL,
  `id_feeder` varchar(255) NOT NULL,
  `id_pd` int(11) NOT NULL,
  `id_sp` int(11) DEFAULT NULL,
  `id_jns_daftar` tinyint(4) DEFAULT NULL,
  `nipd` varchar(18) NOT NULL,
  `tgl_masuk_sp` date DEFAULT NULL,
  `id_jns_keluar` char(1) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `ket` varchar(128) DEFAULT NULL,
  `skhun` varchar(20) DEFAULT NULL,
  `a_pernah_paud` tinyint(4) DEFAULT NULL,
  `a_pernah_tk` tinyint(4) DEFAULT NULL,
  `mulai_smt` varchar(5) DEFAULT NULL,
  `sks_diakui` tinyint(3) unsigned DEFAULT NULL,
  `judul_kp` varchar(256) DEFAULT NULL COMMENT 'field tambahan untuk singkron ke sistem perpus',
  `jalur_skripsi` tinyint(4) DEFAULT NULL,
  `judul_skripsi` text DEFAULT NULL,
  `bln_awal_bimbingan` date DEFAULT NULL,
  `bln_akhir_bimbingan` date DEFAULT NULL,
  `sk_yudisium` varchar(30) DEFAULT NULL,
  `tgl_sk_yudisium` date DEFAULT NULL,
  `ipk` double DEFAULT NULL,
  `no_seri_ijazah` varchar(40) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL COMMENT 'field tambahan',
  `sert_prof` varchar(40) DEFAULT NULL,
  `a_pindah_mhs_asing` tinyint(4) DEFAULT NULL,
  `nm_pt_asal` varchar(50) DEFAULT NULL,
  `nm_prodi_asal` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `id_level` tinyint(3) unsigned DEFAULT NULL,
  `id_ptk` int(11) DEFAULT NULL COMMENT 'field tambahan Nyambungkan ke tabel dosen untuk identifikasi dosen wali',
  `id_kuriklum_mhs` int(11) DEFAULT NULL COMMENT 'kolom tambahan',
  `no_transkip_nilai` varchar(50) DEFAULT NULL COMMENT 'kolom tambahan no transkip',
  `id_kelas` varchar(5) DEFAULT NULL COMMENT 'kolom tambahan untuk home base kelas, join ke wastu_kelas',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 Aktif, 2 Mengundurkan Diri, 3 DO, 4 Lulus',
  `pesan` varchar(100) DEFAULT NULL COMMENT 'kolom tambahan',
  `kesan` varchar(100) DEFAULT NULL COMMENT 'kolom tambahan',
  `email_studen` varchar(50) NOT NULL,
  `id_beasiswa` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_reg_pd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `migrations` VALUES (1,'2025_07_22_020904_create_mahasiswa_table',1);
INSERT INTO `migrations` VALUES (2,'2025_07_22_020929_create_mahasiswa_pt_table',1);
