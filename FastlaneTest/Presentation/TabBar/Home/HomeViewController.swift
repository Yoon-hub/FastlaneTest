//
//  HomeViewController.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/26.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private let viewModel = HomeViewModel()
    
    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestYsData()
    }

}
