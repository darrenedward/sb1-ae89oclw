<?php

namespace App\Pages;

use Page;
use App\Models\Restaurant;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;

class HomePage extends Page
{
    private static $table_name = 'HomePage';
    private static $description = 'Landing page for the restaurant system';

    public function getNearbyStores()
    {
        return Restaurant::get()->filter(['IsActive' => true]);
    }
}