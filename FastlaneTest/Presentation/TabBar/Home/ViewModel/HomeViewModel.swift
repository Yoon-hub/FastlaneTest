//
//  HomeViewModel.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import Foundation

import RxSwift

final class HomeViewModel {
    
    let ysInfo = PublishSubject<[SectionYsData]>()
    
    func requestYsData() {
        APIManager.shared.requestAPI { [weak self] result in
            switch result {
            case .success(let data):
                self?.fetchInfo(data: data)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchInfo(data: YsData) {
        let tvList = data.results.ysTvList.map { YsItem.tvLits($0) }
        let newEvent = data.results.newEventList.map { YsItem.newEvent($0) }
        let recommendEvent = data.results.recommendEventList.map { YsItem.recommendEvent($0) }
        
        let section = [
            SectionYsData(items: tvList),
            SectionYsData(items: newEvent),
            SectionYsData(items: recommendEvent)
        ]
        
        ysInfo.onNext(section)
    }
    

    
}
