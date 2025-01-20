<?php

namespace App\Pages;

use PageController;
use SilverStripe\Control\HTTP;

class HomePageController extends PageController
{
    private static $allowed_actions = [];

    protected function init()
    {
        parent::init();
    }
}