<?php

namespace App\Models;

use SilverStripe\ORM\DataObject;
use SilverStripe\Security\Member;

class Restaurant extends DataObject
{
    private static $table_name = 'Restaurant';

    private static $db = [
        'Name' => 'Varchar(255)',
        'Description' => 'Text',
        'Address' => 'Text',
        'Phone' => 'Varchar(50)',
        'Email' => 'Varchar(255)',
        'OperatingHours' => 'Text',
        'CuisineType' => 'Varchar(100)',
        'IsActive' => 'Boolean'
    ];

    private static $has_many = [
        'MenuCategories' => MenuCategory::class,
        'MenuItems' => MenuItem::class,
        'Orders' => Order::class,
        'Staff' => RestaurantStaff::class,
        'Reviews' => Review::class
    ];

    private static $summary_fields = [
        'Name' => 'Name',
        'Address' => 'Address',
        'CuisineType' => 'Cuisine Type',
        'IsActive.Nice' => 'Active'
    ];

    public function canView($member = null)
    {
        return true;
    }

    public function canEdit($member = null)
    {
        $member = $member ?: Member::currentUser();
        return $member && $this->Staff()->filter(['MemberID' => $member->ID, 'Role' => ['admin', 'manager']])->exists();
    }
}