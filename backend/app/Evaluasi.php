<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Evaluasi extends Model {

    protected $table = 'evaluasi';

    protected $fillable = [
        'perusahaan_id',
        'elemen_id',
        'subelemen_id',
        'tgl_masuk',
        'tgl_target',
        'tgl_selesai',
        'kesimpulan',
        'score_id'
    ];

    public function perusahaan()
    {
        return $this->belongsTo(Perusahaan::class);
    }

    public function elemen()
    {
        return $this->belongsTo(Elemen::class);
    }

    public function subelemen()
    {
        return $this->belongsTo(Subelemen::class);
    }

    public function score()
    {
        return $this->belongsTo(Score::class);
    }
    
}