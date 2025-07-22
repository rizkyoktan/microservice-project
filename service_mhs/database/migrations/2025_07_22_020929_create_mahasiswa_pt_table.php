<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mahasiswa_pt', function (Blueprint $table) {
            $table->increments('id_reg_pd');
            $table->integer('id_sms')->nullable();
            $table->string('id_feeder', 255);
            $table->integer('id_pd');
            $table->integer('id_sp')->nullable();
            $table->tinyInteger('id_jns_daftar')->nullable();
            $table->string('nipd', 18);
            $table->date('tgl_masuk_sp')->nullable();
            $table->char('id_jns_keluar', 1)->nullable();
            $table->date('tgl_keluar')->nullable();
            $table->string('ket', 128)->nullable();
            $table->string('skhun', 20)->nullable();
            $table->tinyInteger('a_pernah_paud')->nullable();
            $table->tinyInteger('a_pernah_tk')->nullable();
            $table->string('mulai_smt', 5)->nullable();
            $table->tinyInteger('sks_diakui', false, true)->nullable();
            $table->string('judul_kp', 256)->nullable()->comment('field tambahan untuk singkron ke sistem perpus');
            $table->tinyInteger('jalur_skripsi')->nullable();
            $table->text('judul_skripsi')->nullable();
            $table->date('bln_awal_bimbingan')->nullable();
            $table->date('bln_akhir_bimbingan')->nullable();
            $table->string('sk_yudisium', 30)->nullable();
            $table->date('tgl_sk_yudisium')->nullable();
            $table->double('ipk')->nullable();
            $table->string('no_seri_ijazah', 40)->nullable();
            $table->string('pin', 50)->nullable()->comment('field tambahan');
            $table->string('sert_prof', 40)->nullable();
            $table->tinyInteger('a_pindah_mhs_asing')->nullable();
            $table->string('nm_pt_asal', 50)->nullable();
            $table->string('nm_prodi_asal', 50)->nullable();
            $table->string('password', 32)->nullable();
            $table->tinyInteger('id_level', false, true)->nullable();
            $table->integer('id_ptk')->nullable()->comment('field tambahan Nyambungkan ke tabel dosen untuk identifikasi dosen wali');
            $table->integer('id_kuriklum_mhs')->nullable()->comment('kolom tambahan');
            $table->string('no_transkip_nilai', 50)->nullable()->comment('kolom tambahan no transkip');
            $table->string('id_kelas', 5)->nullable()->comment('kolom tambahan untuk home base kelas, join ke wastu_kelas');
            $table->tinyInteger('status')->default(0)->comment('1 Aktif, 2 Mengundurkan Diri, 3 DO, 4 Lulus');
            $table->string('pesan', 100)->nullable()->comment('kolom tambahan');
            $table->string('kesan', 100)->nullable()->comment('kolom tambahan');
            $table->string('email_studen', 50);
            $table->integer('id_beasiswa');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mahasiswa_pt');
    }
};
