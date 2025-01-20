<?php

namespace App\Admin;

use SilverStripe\Admin\ModelAdmin;
use App\Models\Restaurant;
use App\Models\MenuItem;
use App\Models\Order;
use App\Models\Staff;
use App\Models\Customer;
use App\Models\Reservation;

class RestaurantAdmin extends ModelAdmin
{
    private static $managed_models = [
        Restaurant::class => ['title' => 'Restaurants'],
        MenuItem::class => ['title' => 'Menu Items'],
        Order::class => ['title' => 'Orders'],
        Staff::class => ['title' => 'Staff'],
        Customer::class => ['title' => 'Customers'],
        Reservation::class => ['title' => 'Reservations']
    ];

    private static $url_segment = 'restaurants';
    private static $menu_title = 'Restaurant Management';
    private static $menu_icon_class = 'font-icon-shop';
}