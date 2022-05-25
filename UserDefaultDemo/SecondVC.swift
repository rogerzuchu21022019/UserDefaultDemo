//
//  SecondVC.swift
//  UserDefaultDemo
//
//  Created by Vu Thanh Nam on 18/05/2022.
//

import UIKit

class SecondVC : UIViewController,UNUserNotificationCenterDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .fullScreen
        self.navigationItem.hidesBackButton = true
        initNavBar()
        
       
       
    }

   
   
     func initNavBar (){
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(backLogin))
    }
    @objc func backLogin(){
        UserDefaults.standard.removeObject(forKey: "SignIn")
//        let defaults = UserDefaults.standard
//        defaults.removeObject(forKey: "SignIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
   
}
