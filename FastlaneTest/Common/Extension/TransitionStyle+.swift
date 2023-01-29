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
    

    func showAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(ok)
        return alert
    }
    
    func numberFormat(value: Int) -> String {
        let numberFormatter = NumberFormatter() //NumberFormatter 객체 생성
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: value) ?? "0" //옵셔널 이므로
        return result
    }
}

