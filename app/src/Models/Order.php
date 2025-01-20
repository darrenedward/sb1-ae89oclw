<?php

namespace App\Models;

use SilverStripe\ORM\DataObject;
use SilverStripe\Security\Member;

class Order extends DataObject
{
    private static $table_name = 'Order';

    private static $db = [
        'Status' => "Enum('pending,confirmed,preparing,ready,delivered,cancelled','pending')",
        'TotalAmount' => 'Currency',
        'PaymentStatus' => "Enum('pending,paid,failed,refunded','pending')",
        'PaymentMethod' => 'Varchar(50)',
        'DeliveryAddress' => 'Text',
        'SpecialInstructions' => 'Text'
    ];

    private static $has_one = [
        'Restaurant' => Restaurant::class,
        'Customer' => Member::class
    ];

    private static $has_many = [
        'OrderItems' => OrderItem::class
    ];

    private static $summary_fields = [
        'ID' => 'Order ID',
        'Created' => 'Date',
        'Status' => 'Status',
        'TotalAmount.Nice' => 'Total',
        'PaymentStatus' => 'Payment'
    ];

    public function onAfterWrite()
    {
        parent::onAfterWrite();
        
        if ($this->isChanged('Status') && $this->Status === 'confirmed') {
            $this->calculateLoyaltyPoints();
        }
    }

    private function calculateLoyaltyPoints()
    {
        $points = floor($this->TotalAmount / 10);
        LoyaltyTransaction::create([
            'CustomerID' => $this->CustomerID,
            'PointsEarned' => $points,
            'OrderID' => $this->ID,
            'TransactionType' => 'earn'
        ])->write();
    }
}