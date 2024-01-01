<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // create admin user
        User::factory()
            ->count( 1 )
            ->create( [
                'email' => config( 'auth.admin_email' ),
                'password' => Hash::make( config( 'auth.admin_password' ) )
            ] );
    }
}
