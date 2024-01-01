<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\User;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class ApiTest extends TestCase
{
    public function test_authorization_by_token(): void
    {
        Sanctum::actingAs(
            User::factory()->create(),
            [ 'get-job' ]
        );

        $response = $this->getJson('/api/jobs/1');

        $response->assertOk();
    }

    public function test_unsuccessful_authorization_by_token(): void
    {
        $response = $this->getJson('/api/jobs/1');

        $response
            ->assertStatus( 401 )
            ->assertJson([
                'message' => 'Unauthenticated.'
            ]);
    }

}
