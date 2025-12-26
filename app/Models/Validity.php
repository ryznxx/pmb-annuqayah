<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Validity extends Model
{
  //
  // app/Models/Validity.php

  protected $fillable = [
    'user_id',
    'is_data_valid',
    'is_payment_valid',
    'final_status',
    'admin_note',
    'verified_at'
  ];

  public function user()
  {
    return $this->belongsTo(User::class);
  }
}
