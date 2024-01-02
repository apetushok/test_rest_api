<?php

namespace App\Jobs;

use App\Enums\Status;
use App\Services\ScrapingJobService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Symfony\Component\Panther\PantherTestCase;

class ScrapeAndStoreJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function __construct(
        protected int $jobId,
        protected string $url,
        protected array $selectors,
        protected ScrapingJobService $jobService
    ) {}

    public function handle(): void
    {
        $this->jobService->setStatus( $this->jobId, Status::PENDING->value );

        // @TODO Perform web scraping using Symfony Panther or any other library
        // $client = PantherTestCase::createPantherClient();
        // $crawler = $client->request('GET', $this->url);

        $scrapedData = [];
        foreach( $this->selectors as $selector ) {
            // $scrapedData[ $selector ] = $crawler->filter( $selector )->text();
            $scrapedData[ $selector ] = 'test scraping result';
        }

        $this->jobService->setScrapedData( $this->jobId, $scrapedData );

        $this->jobService->setStatus( $this->jobId, Status::COMPLETED->value );
    }
}
