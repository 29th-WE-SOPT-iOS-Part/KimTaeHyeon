//
//  Category.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

/**
 ["전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"]
 */

enum Category: Int, CaseIterable {
    case total
    case today
    case stillWatch
    case notWatch
    case live
    case post
}

extension Category {
    var description: String {
        switch self {
        case .total:        return "전체"
        case .today:        return "오늘"
        case .stillWatch:   return "이어서 시청하기"
        case .notWatch:     return "시청하지 않음"
        case .live:         return "실시간"
        case .post:         return "게시물"
        }
    }
}
