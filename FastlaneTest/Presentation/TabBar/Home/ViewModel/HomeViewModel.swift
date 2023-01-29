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
    var newEvent: [EventList]!
    var recommentEvent: [EventList]!
    
    func requestYsData() {
        APIManager.shared.requestAPI { [weak self] result in
            switch result {
            case .success(let data):
                self?.fetchInfo(data: data)
               // print(data)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func fetchInfo(data: YsData) {
        self.newEvent = data.results.newEventList
        self.recommentEvent = data.results.recommendEventList
        
        let tvList = YsItem.tvList(data.results)
        let newEvent = data.results.newEventList.map { YsItem.newEvent($0) }
        let recommendEvent = data.results.recommendEventList.map { YsItem.recommendEvent($0) }
        
        let section = [
            SectionYsData(header: "여신TV 인기영상",items: [tvList]),
            SectionYsData(header: "추천이벤트",items: newEvent),
            SectionYsData(header: "신규이벤트", items: recommendEvent)
        ]
        
        ysInfo.onNext(section)
    }
    

    
}
