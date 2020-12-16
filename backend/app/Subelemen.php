<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subelemen extends Model {

    protected $table = 'subelemen';

    protected $fillable = ['*'];

    public function evaluasi()
    {
        return $this->hasMany(Evaluasi::class);
    }
    
}