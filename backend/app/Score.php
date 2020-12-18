<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Score extends Model {

    protected $table = 'score';

    protected $fillable = ['*'];

    public function evaluasi()
    {
        return $this->hasMany(Evaluasi::class);
    }
    
}