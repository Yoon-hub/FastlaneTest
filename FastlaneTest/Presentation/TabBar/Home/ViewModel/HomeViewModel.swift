//
//  HomeViewModel.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import Foundation

final class HomeViewModel {
    
    func requestYsData() {
        APIManager.shared.requestAPI { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
