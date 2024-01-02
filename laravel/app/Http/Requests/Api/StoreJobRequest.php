<?php

namespace App\Http\Requests\Api;

class StoreJobRequest extends BaseRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|max:255',
            'details.url' => 'required|url:http,https',
            'details.selectors' => 'required|array'
        ];
    }
}
