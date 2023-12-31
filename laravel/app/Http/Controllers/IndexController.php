<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class IndexController extends Controller
{
    public function index() {
        // Store job details
        Redis::hset( 'job:1', 'name', 'Scraping Job' );
        Redis::hset( 'job:1', 'status', 'pending' );
        Redis::hset( 'job:1', 'details', json_encode( [ 'param1' => 'value1', 'param2' => 'value2' ] ) );

        // Retrieve job details
        $jobName = Redis::hget( 'job:1', 'name' );
        $jobStatus = Redis::hget( 'job:1', 'status' );
        $jobDetails = json_decode( Redis::hget( 'job:1', 'details' ), true );

        // Store scraped data in a list
        Redis::lpush( 'scraped_data', json_encode( [ 'url' => 'example.com', 'data' => '...' ] ) );

        // Retrieve scraped data
        $scrapedData = Redis::lrange('scraped_data', 0, -1);
        $decodedScrapedData = array_map('json_decode', $scrapedData);

        dd( $jobName, $jobStatus, $jobDetails, $decodedScrapedData );
    }
}
