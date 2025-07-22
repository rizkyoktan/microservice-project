<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Lumen\Auth\Authorizable;

class Mahasiswa extends Model implements AuthenticatableContract, AuthorizableContract
{
    use Authenticatable, Authorizable, HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'id_reg_pd',
        'nim',
        'nm_pd',
        'jk',
        'tmpt_lahir',
        'tgl_lahir',
        'id_agama',
        'id_jenis_daftar',
        'id_jns_keluar',
        'tgl_masuk_sp',
        'tgl_keluar',
        'id_periode_masuk',
        'id_periode_keluar',
        'id_jalur_masuk',
        'id_perguruan_tinggi',
        'id_prodi',
        'id_kelas',
        'id_kuriklum_mhs',
        'id_level',
        'id_ptk',
        'id_beasiswa',
        'sks_diakui',
        'judul_kp',
        'jalur_skripsi',
        'judul_skripsi',
        'bln_awal_bimbingan',
        'bln_akhir_bimbingan',
        'sk_yudisium',
        'tgl_sk_yudisium',
        'ipk',
        'no_seri_ijazah',
        'pin',
        'sert_prof',
        'a_pindah_mhs_asing',
        'nm_pt_asal',
        'nm_prodi_asal',
        'password',
        'no_transkip_nilai',
        'status',
        'pesan',
        'kesan',
        'email_studen',
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var string[]
     */
    protected $hidden = [
        'password',
    ];
}