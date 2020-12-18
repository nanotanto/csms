<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Elemen extends Model {

    protected $table = 'elemen';

    protected $fillable = ['*'];

    public function evaluasi()
    {
        return $this->hasMany(Evaluasi::class);
    }
    
}