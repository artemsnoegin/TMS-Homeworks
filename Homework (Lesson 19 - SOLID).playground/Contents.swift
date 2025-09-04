import UIKit


// Задача

class NotificationManager {
    func sendNotification(type: String, message: String) {
        if type == "email" {
            print("Email sent: \(message)")
        } else if type == "sms" {
            print("SMS sent: \(message)")
        } else if type == "push" {
            print("Push sent: \(message)")
        } else {
            print("Unknown type")
        }
    }
}


// Решение

protocol Notification {
    func sendNotification(_ message: String)
}

class EmailNotification: Notification {
    func sendNotification(_ message: String) {
        print("Email sent: \(message)")
    }
}

class SMSNotification: Notification {
    func sendNotification(_ message: String) {
        print("SMS sent: \(message)")
    }
}

class PushNotification: Notification {
    func sendNotification(_ message: String) {
        print("Push sent: \(message)")
    }
}

class NotificationSender {
    func send(_ notification: Notification?, message: String) {
        guard let notification = notification else {
            print("Unknown Type")
            return
        }
        
        notification.sendNotification(message)
    }
}

let message = "Hello World!"

let notificationSender = NotificationSender()
notificationSender.send(EmailNotification(), message: message)
