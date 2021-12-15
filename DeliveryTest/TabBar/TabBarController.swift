//
//  ViewController.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuVC = MenuViewController()
        let contactsVC = ContactsViewController()
        let profileVC = ProfileViewController()
        let bascketVC = BacketViewController()
        
        menuVC.title = "Меню"
        contactsVC.title = "Контакты"
        profileVC.title = "Профиль"
        bascketVC.title = "Корзина"
        self.setViewControllers([menuVC, contactsVC, profileVC, bascketVC], animated: false)
        
        guard let items = tabBar.items else { return }
        
        let images = ["list.bullet.rectangle","mappin","person","cart"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
    }


}

