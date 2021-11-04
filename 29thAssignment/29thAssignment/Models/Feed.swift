//
//  Feed.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/04.
//

import UIKit

struct Feed {
    let thumbnailImage: UIImage?
    let profileImage: UIImage?
    let feedTitle: String
    let feedSubtitle: String
    
    static func loadDummyList() -> [Feed] {
        let thumbnailImages = [
            Const.Image.wesoptiOSPart,
            Const.Image.wesoptAndroidpart,
            Const.Image.wesoptPlanPart,
            Const.Image.wesoptDesignPart,               
            Const.Image.wesoptServerPart,
        ].compactMap({$0})
        
        return [
            Feed(
                thumbnailImage: thumbnailImages.randomElement(),
                profileImage: Const.Image.wesoptProfile36,
                feedTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환",
                feedSubtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"
            ),
            Feed(
                thumbnailImage: thumbnailImages.randomElement(),
                profileImage: Const.Image.wesoptProfile36,
                feedTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController",
                feedSubtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"
            ),
            Feed(
                thumbnailImage: thumbnailImages.randomElement(),
                profileImage: Const.Image.wesoptProfile36,
                feedTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView",
                feedSubtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"
            ),
            Feed(
                thumbnailImage: thumbnailImages.randomElement(),
                profileImage: Const.Image.wesoptProfile36,
                feedTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API",
                feedSubtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"
            ),
            Feed(
                thumbnailImage: thumbnailImages.randomElement(),
                profileImage: Const.Image.wesoptProfile36,
                feedTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ",
                feedSubtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"
            ),
            Feed(
                thumbnailImage: thumbnailImages.randomElement(),
                profileImage: Const.Image.wesoptProfile36,
                feedTitle: "8차 iOS 세미나 : 협업 시 도움이 되는 팁과 라이브러리 사용",
                feedSubtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"
            )
        ]
    }
}
