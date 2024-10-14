<?php

namespace App\Models;

use App\Models\Member;
use Illuminate\Database\Eloquent\Model;

class Family extends Model
{
    protected $fillable = ['name'];

    public function members()
    {
        return $this->hasMany(Member::class);
    }
}

