<?php

namespace App\Tasks;

use SilverStripe\Dev\BuildTask;
use App\Models\Notification;
use App\Services\EmailService;

class NotificationTask extends BuildTask
{
    protected $title = 'Process Notifications';
    protected $description = 'Processes pending notifications and sends emails/SMS';

    public function run($request)
    {
        $notifications = Notification::get()->filter(['IsSent' => false]);
        $emailService = new EmailService();

        foreach ($notifications as $notification) {
            try {
                $emailService->sendNotification($notification);
                $notification->IsSent = true;
                $notification->write();
                
                echo "Sent notification {$notification->ID}\n";
            } catch (\Exception $e) {
                echo "Failed to send notification {$notification->ID}: {$e->getMessage()}\n";
            }
        }
    }
}