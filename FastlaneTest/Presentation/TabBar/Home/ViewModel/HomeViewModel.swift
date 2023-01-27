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
    
    private func fetchInfo(data: YsData) {
        let tvList = data.results.ysTvList.map { YsItem.tvList($0) }
        let newEvent = data.results.newEventList.map { YsItem.newEvent($0) }
        let recommendEvent = data.results.recommendEventList.map { YsItem.recommendEvent($0) }
        
        let section = [
            SectionYsData(header: "여신TV 인기영상",items: tvList),
            SectionYsData(header: "추천 이벤트",items: newEvent),
            SectionYsData(header: "신규 이벤트", items: recommendEvent)
        ]
        
        ysInfo.onNext(section)
    }
    

    
}
