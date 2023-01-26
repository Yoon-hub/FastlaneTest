//
//  APIError.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import Foundation

enum APIError: String, Error {
    case invalidRessponse = "응답이 없습니다."
    case noData = "데이터가 없습니다."
    case failedRequest = "요청에 실패 하였습니다."
    case invalidData = "받아온 데이터가 없습니다."
    case failedResponse = "응답을 받을 수 없습니다."
}
