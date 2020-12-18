<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Penilaian extends Model {

    protected $table = 'penilaian';

    protected $fillable = [
        'perusahaan_id',
        'subelemen_id',
        'tgl_masuk',
        'tgl_target',
        'tgl_selesai',
        'kesimpulan',
        'nilai_id'
    ];

    public $timestamps = false;
    
}