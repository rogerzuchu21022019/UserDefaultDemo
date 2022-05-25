//
//  ViewController.swift
//  UserDefaultDemo
//
//  Created by Vu Thanh Nam on 18/05/2022.
//

import UIKit

import UserNotifications
class ViewController : UIViewController,UNUserNotificationCenterDelegate {
    let keyDefault = ""
    
    let centerNotifications = UNUserNotificationCenter.current()
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBAction func btnSubmit(_ sender: UIButton) {
       
        if tfUsername.text == "admin" && tfPassword.text == "admin"  {
            UserDefaults.standard.set(true, forKey: "SignIn")
            UserDefaults.standard.set(tfUsername.text, forKey: "username")
            UserDefaults.standard.set(tfPassword.text, forKey: "password")
            let screen2 = self.storyboard?.instantiateViewController(identifier: "secondVC") as! SecondVC
            initNotifications()
            self.navigationController?.pushViewController(screen2, animated: true)
            
        }else{
            lblText.text = "You don't sign in"
        }
        
    }
    func initNotifications(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){
            (success,error) in
        }
        let content = UNMutableNotificationContent()
        content.title = "Notifications Sign In"
        content.body = "You signed in"
        content.sound = .default
        content.badge = 2
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "Notification ", content: content, trigger:trigger )
        centerNotifications.add(request) {
            (error) in
            print("\(error?.localizedDescription)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        centerNotifications.delegate = self
        
        if UserDefaults.standard.bool(forKey: "SignIn") == true {
            let screen2 = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondVC
            self.navigationController?.pushViewController(screen2, animated: true)
        }else{
            let username = UserDefaults.standard.string(forKey: "username")
            let password = UserDefaults.standard.string(forKey: "password")
            tfUsername.text = username
            tfPassword.text = password
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
    

}

