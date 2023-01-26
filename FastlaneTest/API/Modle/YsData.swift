//
//  YsData.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import Foundation

// MARK: - YsData
struct YsData: Codable {
    let serverCode, serverMsg: String
    let results: Results
}

// MARK: - Results
struct Results: Codable {
    let recommendEventList, newEventList: [EventList]
    let ysTvList: [YsTvList]
}


// MARK: - EventList
struct EventList: Codable {
    let name, comment, customerName, displayName: String
    let price: Int
    let currencyName: CurrencyName
    let customerCode: String
    let score: Int
    let cpmBudgetScore: Double
    let locationName, productCode: String
    let wishCount, reviewCount, rateScore, distance: Int
    let wishIcon: WishIcon
    let thumbnailImageURL: String
    let detailLinkURL: String
    let reservationYn: ReservationYn

    enum CodingKeys: String, CodingKey {
        case name, comment, customerName, displayName, price, currencyName, customerCode, score, cpmBudgetScore, locationName, productCode, wishCount, reviewCount, rateScore, distance, wishIcon
        case thumbnailImageURL = "thumbnailImageUrl"
        case detailLinkURL = "detailLinkUrl"
        case reservationYn
    }
}

enum CurrencyName: String, Codable {
    case 원 = "원"
}

enum ReservationYn: String, Codable {
    case n = "N"
    case y = "Y"
}

enum WishIcon: String, Codable {
    case off = "off"
}

// MARK: - YsTvList
struct YsTvList: Codable {
    let tvID, tvCode, tvNameMain, tvInputDate: String
    let tvViewCount, tvMetatagTitle: String
    let tvVideoURL: String
    let tvVideoID: String
    let tvImgType: TvImgType
    let tvVideoThumb: String
    let tvFullImgURL: String

    enum CodingKeys: String, CodingKey {
        case tvID = "tvId"
        case tvCode, tvNameMain, tvInputDate, tvViewCount, tvMetatagTitle
        case tvVideoURL = "tvVideoUrl"
        case tvVideoID = "tvVideoId"
        case tvImgType, tvVideoThumb
        case tvFullImgURL = "tvFullImgUrl"
    }
}

enum TvImgType: String, Codable {
    case auto = "auto"
    case direct = "direct"
}

