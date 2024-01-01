<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\LoginRequest;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login( LoginRequest $loginRequest )
    {
        $user = User::where('email', $loginRequest->get( 'email' ) )->first();
        if ( $user && Hash::check( $loginRequest->get( 'password' ), $user->getAuthPassword() ) ) {
            return response()->json( [
                'status' => true,
                'token' => $user->createToken( config('auth.api.secret_token') )->plainTextToken
            ] );
        }

        return response()->json( [
            'status' => false,
            'message' => 'Forbidden'
        ], 403 );
    }
}
