<?php

namespace App\Enums;

enum Status: string
{
    case FREE = 'free';
    case PENDING = 'pending';
    case COMPLETED = 'completed';
}
