//
//  SectionYsData.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import Foundation

import RxDataSources

enum YsItem {
    case tvLits(YsTvList)
    case recommendEvent(EventList)
    case newEvent(EventList)
}

struct SectionYsData {
    var items: [Item]
}

extension SectionYsData: SectionModelType {
    typealias Item = YsItem
    
    init(original: SectionYsData, items: [Item]) {
     self = original
     self.items = items
   }
}
