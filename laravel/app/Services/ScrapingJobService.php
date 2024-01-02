<?php

namespace App\Services;

use App\Enums\Status;
use Illuminate\Support\Facades\Redis;

class ScrapingJobService
{
    public function __construct(
        private string $counterName = 'job:counter',
        private string $keyName = 'job'
    ){}

    public function getJobDetailsAndData( int $jobId ): ?array
    {
        $hKey = "{$this->keyName}:{$jobId}";

        if ( Redis::hlen( $hKey ) > 0 ) {
            $status = Redis::hget( $hKey, 'status' );
            $details = json_decode( Redis::hget( $hKey, 'details' ), true );
            $scrapedData = json_decode( Redis::hget( $hKey, 'scraped_data' ), true );

            return [
                'status' => $status,
                'details' => $details,
                'scraped_data' => $scrapedData,
            ];
        }
        return null;
    }

    public function addNewJob( array $data ): ?int
    {
        if ( empty( $data ) ) {
            return null;
        }

        $jobId = (int)Redis::incr( $this->counterName );
        $hKey = "{$this->keyName}:{$jobId}";

        Redis::hset( $hKey, 'name', $data[ 'name' ] ?? '' );
        Redis::hset( $hKey, 'status', Status::FREE->value );
        Redis::hset( $hKey, 'details', json_encode( $data[ 'details' ] ) ) ;
        Redis::hset( $hKey, 'scraped_data', json_encode( [] ) ) ;

        return $jobId;
    }

    public function deleteJob( int $jobId ): bool
    {
        $hKey = "{$this->keyName}:{$jobId}";

        if ( Redis::hlen( $hKey ) > 0 ) {

            Redis::hdel( $hKey, 'name' );
            Redis::hdel( $hKey, 'status' );
            Redis::hdel( $hKey, 'details' );
            Redis::hdel( $hKey, 'scraped_data' );

            return true;
        }

        return false;
    }

}
