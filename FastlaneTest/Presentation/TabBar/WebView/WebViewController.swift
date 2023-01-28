//
//  WebViewController.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/29.
//

import UIKit
import WebKit

import SnapKit

final class WebViewController: UIViewController {
    
    let webView = WKWebView()
    
    var url: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        openWebPage(urlStr: url)
    }
    
}

//MARK: SetConstraints
extension WebViewController {
    private func setConstraints() {
        view.addSubview(webView)
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .fastlanePink
        navigationController?.navigationBar.topItem?.title = ""
        webView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func openWebPage(urlStr: String) {
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
