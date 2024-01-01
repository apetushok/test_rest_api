<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class JobController extends Controller
{
    public function show( $id )
    {
        return response()->json( 'job' );
    }

    public function store( Request $request )
    {
        return response()->json( 'success', 201 );
    }

    public function destroy( $id )
    {
        return response()->json( ['message' => 'Job deleted'] );
    }
}
