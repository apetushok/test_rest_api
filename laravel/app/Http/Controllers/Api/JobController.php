<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\StoreJobRequest;
use App\Services\ScrapingJobService;
use Illuminate\Http\JsonResponse;

class JobController extends Controller
{
    public function __construct( private readonly ScrapingJobService $jobService )
    {}

    public function show( int $id ): JsonResponse
    {
        $data = $this->jobService->getJobDetailsAndData( $id );

        return response()->json(
            $data !== null ?
            [ 'success' => true, 'job' => $data ] :
            [ 'success' => false, 'message' => 'Job with this ID was not found' ]
        );
    }

    public function store( StoreJobRequest $request ): JsonResponse
    {
        $id = $this->jobService->addNewJob( $request->all() );

        return response()->json( [ 'success' => $id !== null, 'id' => $id ], $id !== null ? 201 : 400 );
    }

    public function destroy( int $id ): JsonResponse
    {
        $isDeleted= $this->jobService->deleteJob( $id );

        return response()->json( [ 'success' => $isDeleted], $isDeleted === true ? 200 : 400 );
    }
}
