<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bukti extends Model {

    protected $table = 'bukti';

    protected $fillable = [
        'penilaian_id',
        'sub_subelemen_id',
        'keterangan',
        'tgl',
        'file'
    ];

    public $timestamps = false;
    
}