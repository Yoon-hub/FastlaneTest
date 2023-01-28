//
//  TabBarViewController.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/26.
//

import UIKit

enum TabImage: String {
    case home = "home"
    case skin = "sesac"
    case event = "shop"
    case review = "talk"
    case info = "info"
}

final class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        
        //let homeNavi = UINavigationController(rootViewController: HomeViewController())
        
        let homeView = HomeViewController()
        let skinView = SkinViewController()
        let eventView = EventViewController()
        let reviewView = ReviewViewController()
        let myPageView = MyPageViewController()
        
        setViewControllers([skinView, eventView, homeView, reviewView, myPageView], animated: true)
        selectedIndex = 2
        
        homeView.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: TabImage.home.rawValue), tag: 0)
        skinView.tabBarItem = UITabBarItem(title: "피부시술앱", image: UIImage(named: TabImage.skin.rawValue), tag: 0)
        eventView.tabBarItem = UITabBarItem(title: "이벤트", image: UIImage(named: TabImage.event.rawValue), tag: 0)
        reviewView.tabBarItem = UITabBarItem(title: "시술후기", image: UIImage(named: TabImage.review.rawValue), tag: 0)
        myPageView.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(named: TabImage.info.rawValue), tag: 0)
        
        tabBar.tintColor = .fastlanePink
    }
    
}
