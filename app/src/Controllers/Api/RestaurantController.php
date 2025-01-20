<?php

namespace App\Controllers\Api;

use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Security\SecurityToken;
use App\Models\Restaurant;

class RestaurantController extends Controller
{
    private static $allowed_actions = [
        'index',
        'show',
        'store',
        'update',
        'delete'
    ];

    private static $url_handlers = [
        'GET ' => 'index',
        'GET $ID' => 'show',
        'POST ' => 'store',
        'PUT $ID' => 'update',
        'DELETE $ID' => 'delete'
    ];

    public function index(HTTPRequest $request)
    {
        $restaurants = Restaurant::get()->filter(['IsActive' => true]);
        
        return $this->jsonResponse($restaurants->toArray());
    }

    public function show(HTTPRequest $request)
    {
        $id = $request->param('ID');
        $restaurant = Restaurant::get()->byID($id);
        
        if (!$restaurant) {
            return $this->jsonResponse(['error' => 'Restaurant not found'], 404);
        }

        return $this->jsonResponse($restaurant->toArray());
    }

    protected function jsonResponse($data, $code = 200)
    {
        $this->getResponse()->addHeader('Content-Type', 'application/json');
        $this->getResponse()->setStatusCode($code);
        return json_encode($data);
    }
}