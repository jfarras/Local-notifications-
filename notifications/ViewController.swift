//
//  ViewController.swift
//  notifications
//
//  Created by Jordi Farras Mañe on 28/01/2019.
//  Copyright © 2019 Jordi Farras Mañe. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert,.sound],
                                    completionHandler: {
                (granted, error) in
        })
        
        let content = UNMutableNotificationContent()
        content.title = "Heyy"
        content.body = "dinsss"
        
        let date = Date().addingTimeInterval(10)
        
        let dataComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dataComponents, repeats:  false)
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) {
            (error) in
            
        }
    }

}

