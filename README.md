# Usulan Pemecahan Arsitektur Monolitik Sistem Akademi Menjadi Microservices

## Pengantar

Dokumen ini menguraikan usulan pemecahan sistem akademi monolitik yang ada, terutama yang berinteraksi dengan database `wastudig_simak` yang besar dan kompleks, menjadi arsitektur microservices. Tujuannya adalah untuk meningkatkan **skalabilitas**, **performa**, **kemudahan pemeliharaan**, dan memitigasi risiko dari ketergantungan database tunggal. Pendekatan ini berfokus pada penggunaan **Node.js** sebagai runtime utama untuk pengembangan microservices baru.

---

## Tantangan yang Ada

Sistem akademi saat ini menghadapi beberapa tantangan kunci:

- **Database Monolitik**  
  Satu database menampung semua data (mahasiswa, dosen, KRS, nilai, mata kuliah, dll.), menyebabkan bottleneck performa, kesulitan scaling granular, dan kompleksitas manajemen data.

- **Ketergantungan Query Join yang Tinggi**  
  Banyak fungsionalitas (misal dashboard mahasiswa) memerlukan join query kompleks antar banyak tabel, yang menjadi tantangan di arsitektur terdistribusi.

- **Kopling Erat (Tight Coupling)**  
  Perubahan pada satu bagian sistem dapat memengaruhi bagian lain, memperlambat pengembangan dan deployment.

- **Skalabilitas Terbatas**  
  Scaling hanya bisa dilakukan pada seluruh sistem, bukan pada komponen spesifik.

---

## Prinsip Desain Microservices

Desain microservices akan berlandaskan pada prinsip-prinsip berikut:

- **Single Responsibility Principle (SRP):**  
  Setiap microservice memiliki tanggung jawab tunggal pada satu domain bisnis spesifik.

- **Database per Service:**  
  Setiap microservice memiliki database terisolasi, menghilangkan single point of failure dan memungkinkan scaling independen.

- **Loose Coupling:**  
  Komunikasi antar microservices melalui API yang terdefinisi dengan baik.

- **High Cohesion:**  
  Komponen internal dalam satu microservice saling terkait erat, interaksi antar microservice melalui antarmuka publik.

- **API-First Design:**  
  Komunikasi antar-layanan dan dengan frontend melalui API RESTful.

- **Event-Driven Architecture (EDA):**  
  Sinkronisasi data antar layanan menggunakan event/message queue.

---

## Usulan Pemecahan Microservices

Berdasarkan analisis sistem akademi, berikut kandidat microservices yang diusulkan:

### 1. Mahasiswa Service

- **Deskripsi:** Mengelola siklus hidup data mahasiswa.
- **Tanggung Jawab:** Pendaftaran, pembaruan data pribadi, status akademik.
- **Database:** `ms_mahasiswa_db` (tabel mahasiswa, program_studi).
- **Contoh API:**
  - `GET /mahasiswa/{nim}`
  - `POST /mahasiswa`
  - `PUT /mahasiswa/{nim}`

### 2. Dosen Service

- **Deskripsi:** Mengelola data dasar dosen.
- **Tanggung Jawab:** Data pribadi dosen, jabatan, NIDN.
- **Database:** `ms_dosen_db` (tabel dosen).
- **Contoh API:**
  - `GET /dosen/{nidn}`
  - `POST /dosen`

### 3. Matakuliah & Kurikulum Service

- **Deskripsi:** Mengelola definisi mata kuliah, kurikulum, prasyarat.
- **Tanggung Jawab:** Detail mata kuliah, struktur kurikulum.
- **Database:** `ms_matakuliah_db` (tabel matakuliah, kurikulum, prasyarat_matakuliah).
- **Contoh API:**
  - `GET /matakuliah/{kode_mk}`
  - `GET /kurikulum/{id_kurikulum}/matakuliah`

### 4. KRS (Kartu Rencana Studi) Service

- **Deskripsi:** Mengelola pendaftaran dan pengelolaan KRS mahasiswa.
- **Tanggung Jawab:** Pencatatan mata kuliah yang diambil mahasiswa per semester.
- **Database:** `ms_krs_db` (tabel krs_mahasiswa, krs_detail).
- **Integrasi:** Mahasiswa Service, Matakuliah Service, Kelas & Jadwal Service.
- **Contoh API:**
  - `POST /krs`
  - `GET /krs/mahasiswa/{nim}/semester/{semester_id}`

### 5. Kelas & Jadwal Service

- **Deskripsi:** Mengelola data kelas perkuliahan, jadwal, penugasan dosen.
- **Tanggung Jawab:** Informasi kelas, jam perkuliahan, dosen pengampu.
- **Database:** `ms_kelas_db` (tabel kelas, jadwal_perkuliahan, penugasan_dosen_kelas).
- **Integrasi:** Dosen Service, Matakuliah Service.
- **Contoh API:**
  - `GET /kelas/{id_kelas}`
  - `GET /kelas/{id_kelas}/jadwal`

### 6. Nilai Service

- **Deskripsi:** Mengelola data nilai mahasiswa.
- **Tanggung Jawab:** Input, pembaruan, pengambilan nilai mahasiswa.
- **Database:** `ms_nilai_db` (tabel nilai_mahasiswa).
- **Integrasi:** Mahasiswa Service, Matakuliah Service.
- **Contoh API:**
  - `POST /nilai`
  - `GET /nilai/mahasiswa/{nim}/semester/{semester_id}`

### 7. API Gateway / Backend For Frontend (BFF) Service

- **Deskripsi:** Lapisan agregasi dan orkestrasi di depan microservices.
- **Tanggung Jawab:** Menggabungkan respons dari beberapa microservices untuk memenuhi permintaan frontend (misal dashboard mahasiswa).
- **Cara Kerja:** Menerima permintaan dari frontend, memanggil microservices relevan, mengagregasi data, mengembalikan respons tunggal.
- **Teknologi:** Node.js (Express.js/Fastify/NestJS).

---

## Strategi Migrasi dan Implementasi

### 1. Pendekatan Migrasi (Strangler Fig Pattern)

- **Bertahap:** Microservices baru dibangun dan di-deploy di samping monolit.
- **Pengalihan Fungsionalitas:** Fungsionalitas dan data dari monolit dialihkan ke microservices secara bertahap.

### 2. Strategi Data

- **Data Migration per Service:** Data relevan dimigrasikan dari `wastudig_simak` ke database microservice.
- **Change Data Capture (CDC) / Event Sourcing:** Untuk sinkronisasi data selama transisi, gunakan CDC (misal Debezium) atau event sourcing.
- **Denormalisasi Terbatas:** Data referensi kecil dapat diduplikasi terbatas untuk mengurangi kebutuhan join antar-database.

### 3. Teknologi Implementasi (Node.js/PHP)

- **Microservices:** Setiap microservice adalah aplikasi Node.js atau PHP mandiri.
- **Framework:** Express.js / NestJS / Lumen.
- **ORM/ODM:** Sequelize (SQL) atau Mongoose (MongoDB).
- **Komunikasi Antar-Layanan:**
  - **Synchronous (REST API):** Untuk respons instan.
  - **Asynchronous (Message Queue):** Untuk event-driven (misal Kafka, RabbitMQ).
- **Containerization:** Docker untuk mengemas setiap microservice.
- **Orkestrasi:** Kubernetes (K8s) atau Docker Swarm.
- **Observability:** Logging, monitoring, dan tracing terpusat (Prometheus, Grafana, Jaeger).

---

## Ilustrasi Alur Fungsionalitas

### Dashboard Mahasiswa - Melihat Nilai

1. **Frontend** memanggil API Gateway untuk data nilai mahasiswa.
2. **API Gateway**:
   - Memanggil Nilai Service (`GET /nilai/mahasiswa/{nim}`) untuk daftar mata kuliah dan nilai.
   - Untuk setiap mata kuliah, memanggil Matakuliah Service (`GET /matakuliah/{kode_mk}`) untuk detail mata kuliah.
   - Opsional: Memanggil KRS Service dan Kelas & Jadwal Service untuk info semester, kelas, dosen pengampu.
   - Mengagregasi data dan mengirimkan ke frontend.

---

## Tantangan dan Pertimbangan

- **Konsistensi Data Terdistribusi:**  
  Menjaga konsistensi data di banyak database adalah tantangan. Gunakan eventual consistency dan pola seperti Saga.

- **Kompleksitas Operasional:**  
  Mengelola banyak layanan kecil lebih kompleks daripada satu monolit. Diperlukan tim DevOps yang kuat.

- **Keamanan:**  
  Komunikasi antar-layanan harus diamankan (misal JWT, OAuth2).

- **Pembaruan Skema Database:**  
  Perubahan skema di satu layanan tidak boleh berdampak langsung pada layanan lain.

---