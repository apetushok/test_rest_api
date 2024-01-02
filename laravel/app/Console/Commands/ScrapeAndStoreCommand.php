<?php

namespace App\Console\Commands;

use App\Enums\Status;
use App\Jobs\ScrapeAndStoreJob;
use App\Services\ScrapingJobService;
use Illuminate\Console\Command;

class ScrapeAndStoreCommand extends Command
{
    public function __construct( protected readonly ScrapingJobService $jobService )
    {
        parent::__construct();
    }

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:scrape-and-store-command';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command to run jobs';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $lastId = $this->jobService->getLastId();

        for( $i = 0; $i <= $lastId; $i++ ) {
            $jobData = $this->jobService->getJobDetailsAndData( $i );
            $status = $jobData['status'] ?? false;
            $url = $jobData['details']['url'] ?? false;
            $selectors = $jobData['details']['selectors'] ?? false;

            if (
                $status === false ||
                $url === false ||
                $selectors === false ||
                !is_array( $selectors ) ||
                $status !== Status::PENDING->value
            ) {
                continue;
            }

            ScrapeAndStoreJob::dispatch( $i, $url, $selectors, $this->jobService );
        }

        $this->info('ScrapeAndStoreJob dispatched successfully!');
    }
}
