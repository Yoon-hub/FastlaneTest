//
//  UIViewController+.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/29.
//

import UIKit

extension UIViewController {
    enum TransitionStyle {
        case naviagtion
    }
    
    func transition<T: UIViewController>(_ vc: T, transitionStyle: TransitionStyle) {
        switch transitionStyle {
        case .naviagtion:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

