<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Settings extends Model
{
  protected $fillable = ["rekening", "nama_rekening", "nama_bank", "nowa", "thumb1", "thumb2", "thumb3"];
}
