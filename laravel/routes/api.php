<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\JobController;
use App\Http\Controllers\Api\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::post( '/auth/login', [ AuthController::class, 'login' ] )->name( 'api-login' );

Route::middleware( ['auth:sanctum'] )->name( 'api.' )->group( function () {
    Route::get( '/jobs/{id}', [ JobController::class, 'show'] )->name( 'get-job' )->whereNumber('id');
    Route::post( '/jobs', [ JobController::class, 'store'] )->name( 'create-job' );
    Route::delete( '/jobs/{id}', [ JobController::class, 'destroy' ] )->name( 'delete-job' )->whereNumber('id');
} );
