<?php

namespace App\Models\Post;

use Illuminate\Database\Eloquent\Model;

class PostTag extends Model
{
    protected $fillable = ['title', 'slug', 'status'];
}
