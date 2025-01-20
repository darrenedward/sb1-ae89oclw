<?php

namespace App\Models;

use SilverStripe\ORM\DataObject;
use SilverStripe\Assets\Image;

class MenuItem extends DataObject
{
    private static $table_name = 'MenuItem';

    private static $db = [
        'Name' => 'Varchar(255)',
        'Description' => 'Text',
        'Price' => 'Currency',
        'IsAvailable' => 'Boolean',
        'PreparationTime' => 'Varchar(50)',
        'Allergens' => 'Text',
        'NutritionalInfo' => 'Text'
    ];

    private static $has_one = [
        'Restaurant' => Restaurant::class,
        'Category' => MenuCategory::class,
        'Image' => Image::class
    ];

    private static $summary_fields = [
        'Name' => 'Name',
        'Category.Name' => 'Category',
        'Price.Nice' => 'Price',
        'IsAvailable.Nice' => 'Available'
    ];

    public function canView($member = null)
    {
        return true;
    }
}