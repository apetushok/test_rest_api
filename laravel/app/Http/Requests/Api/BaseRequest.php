<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class BaseRequest extends FormRequest
{
    /**
     * The data to be validated should be processed as JSON.
     * @return mixed
     */
    public function validationData()
    {
        return $this->json()->all() + $this->route()->parameters();
    }

    public function authorize(): bool
    {
        return $this->wantsJson();
    }
}
