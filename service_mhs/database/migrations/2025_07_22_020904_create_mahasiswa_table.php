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
        Schema::create('mahasiswa', function (Blueprint $table) {
            $table->integer('id_pd')->primary();
            $table->string('nm_pd', 50);
            $table->char('jk', 4)->default('L');
            $table->char('nisn', 10);
            $table->char('nik', 16);
            $table->string('tmpt_lahir', 20)->nullable();
            $table->date('tgl_lahir');
            $table->integer('id_agama', false, true)->length(16)->nullable();
            $table->integer('id_kk', false, true)->length(32)->nullable();
            $table->integer('id_sp')->nullable();
            $table->string('jln', 80)->nullable();
            $table->tinyInteger('rt', false, true)->length(2)->nullable();
            $table->tinyInteger('rw', false, true)->length(2)->nullable();
            $table->string('nm_dsn', 40)->nullable();
            $table->string('ds_kel', 40)->nullable();
            $table->string('id_wil_feeder', 20)->nullable();
            $table->integer('id_kabupaten')->nullable();
            $table->integer('id_provinsi')->nullable();
            $table->char('id_wil', 8)->nullable();
            $table->char('kode_pos', 5)->nullable();
            $table->tinyInteger('id_jns_tinggal', false, true)->length(2)->nullable();
            $table->tinyInteger('id_alat_transport', false, true)->length(2)->nullable();
            $table->string('telepon_rumah', 20)->nullable();
            $table->string('telepon_seluler', 20)->nullable();
            $table->string('email', 50)->nullable();
            $table->integer('id_kebutuhan_khusus_mahasiswa');
            $table->tinyInteger('a_terima_kps', false, true)->nullable();
            $table->string('no_kps', 40)->nullable();
            $table->char('stat_pd', 1)->nullable();
            $table->string('nm_ayah', 50)->nullable();
            $table->date('tgl_lahir_ayah')->nullable();
            $table->tinyInteger('id_jenjang_pendidikan_ayah', false, true)->length(2)->nullable();
            $table->integer('id_pekerjaan_ayah', false, true)->length(32)->nullable();
            $table->integer('id_penghasilan_ayah', false, true)->length(32)->nullable();
            $table->integer('id_kebutuhan_khusus_ayah', false, true)->length(32)->nullable();
            $table->string('nm_ibu_kandung', 50)->nullable();
            $table->date('tgl_lahir_ibu')->nullable();
            $table->tinyInteger('id_jenjang_pendidikan_ibu', false, true)->length(2)->nullable();
            $table->integer('id_penghasilan_ibu', false, true)->length(32)->nullable();
            $table->integer('id_pekerjaan_ibu', false, true)->length(32)->nullable();
            $table->integer('id_kebutuhan_khusus_ibu', false, true)->length(32)->nullable();
            $table->string('nm_wali', 30)->nullable();
            $table->date('tgl_lahir_wali')->nullable();
            $table->tinyInteger('id_jenjang_pendidikan_wali', false, true)->length(2)->nullable();
            $table->integer('id_pekerjaan_wali', false, true)->length(32)->nullable();
            $table->integer('id_penghasilan_wali', false, true)->length(32)->nullable();
            $table->char('kewarganegaraan', 2)->nullable();
            $table->string('npwp', 25);
            $table->string('kecamatan', 50);
            $table->string('kabupaten', 50);
            $table->string('golongandarah', 2);
            $table->string('nik_ayah', 16);
            $table->string('nik_ibu', 16);
            $table->string('tpt_lahir_ayah', 25);
            $table->string('tpt_lahir_ibu', 25);
            $table->string('pekerjaan_ayah', 50);
            $table->string('pekerjaan_ibu', 50);
            $table->text('alamat_ayah');
            $table->text('alamat_ibu');
            $table->string('rt_ayah', 3);
            $table->string('rw_ayah', 3);
            $table->string('kode_pos_ayah', 7);
            $table->string('rt_ibu', 3);
            $table->string('rw_ibu', 3);
            $table->string('kode_pos_ibu', 7);
            $table->string('size', 3)->comment('field tambahan untuk ukuran almamater');
            $table->string('facebook', 100);
            $table->string('instagram', 100);
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
        Schema::dropIfExists('mahasiswa');
    }
};
