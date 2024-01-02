<?php

namespace Tests\Unit;

use App\Services\ScrapingJobService;
use Illuminate\Support\Facades\Redis;
use Tests\TestCase;

class JobTest extends TestCase
{
    private ScrapingJobService $jobService;
    private int $currentID;

    public function setUp(): void
    {
        parent::setUp();
        $this->jobService = new ScrapingJobService( 'test:job:counter', 'test:job' );
        $this->currentID = $this->jobService->addNewJob( $this->getTestData() );
    }

    private function getTestData(): array {
        return [
            'name' => 'Test job',
            'details' => [
                'url' => 'http://test.url',
                'selectors' => [ '#main' ]
            ]
        ];
    }

    public function test_job_created_successfully(): void
    {
        $testData = $this->getTestData();

        $hKey = "test:job:{$this->currentID}";
        $name = Redis::hget( $hKey, 'name' );
        $details = json_decode( Redis::hget( $hKey, 'details' ), true );

        $this->assertIsInt( $this->currentID );
        $this->assertEquals( $testData, [
            'name' => $name,
            'details' => $details
        ] );
    }

    public function test_getting_job_data(): void
    {
        $data = $this->jobService->getJobDetailsAndData( $this->currentID );
        $testData = $this->getTestData();

        $this->assertEquals( $testData['details'], $data['details'] );
        $this->assertEquals( [], $data['scraped_data'] );
    }

    public function test_deleting_job(): void
    {
        $isDeleted = $this->jobService->deleteJob( $this->currentID );
        $this->assertTrue( $isDeleted );
    }
}
