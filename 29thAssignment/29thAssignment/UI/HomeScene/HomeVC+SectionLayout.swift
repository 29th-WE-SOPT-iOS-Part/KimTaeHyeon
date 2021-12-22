//
//  SectionLayout.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/07.
//

import UIKit

// MARK: - HomeVC에서 사용될 셀 타입

enum SectionLayout: CaseIterable {
    case channel, category, feed
}

extension HomeVC {
    // MARK: - Composional Layout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, env)
            -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0: return self.createChannelSection()
            case 1: return self.createCategorySection()
            case 2: return self.createFeedSection(env)
            default: return nil
            }
        }
    }
    
    fileprivate func supplementaryFooterSeparatorItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(1)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
    }
    
    private func createChannelSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .estimated(1)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .absolute(72),
                heightDimension: .absolute(104)
            ), subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = [supplementaryFooterSeparatorItem()]
        return section
    }
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .absolute(32)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .absolute(48)
            ), subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 9
        section.contentInsets = .init(top: 9, leading: 13, bottom: -9, trailing: 13)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createFeedSection(_ env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let listConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        return NSCollectionLayoutSection.list(using: listConfig,layoutEnvironment: env)
    }
}
