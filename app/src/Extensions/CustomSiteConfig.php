<?php

namespace App\Extensions;

use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;

class CustomSiteConfig extends DataExtension
{
    private static $db = [
        'ContactEmail' => 'Varchar(255)',
        'ContactPhone' => 'Varchar(50)',
        'FooterContent' => 'Text'
    ];

    private static $has_one = [
        'Logo' => Image::class
    ];

    private static $owns = [
        'Logo'
    ];

    public function updateCMSFields(FieldList $fields)
    {
        $fields->addFieldsToTab('Root.Main', [
            UploadField::create('Logo', 'Site Logo'),
            TextField::create('ContactEmail', 'Contact Email'),
            TextField::create('ContactPhone', 'Contact Phone'),
            TextareaField::create('FooterContent', 'Footer Content')
        ]);
    }
}