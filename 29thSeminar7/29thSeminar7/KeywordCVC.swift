//
//  KeywordCVC.swift
//  29thSeminar7
//
//  Created by taehy.k on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate: AnyObject {
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {
    static let identifier = "KeywordCVC"
    @IBOutlet weak var keywordButton: UIButton!
    
    var keyword: String = ""
    var isSelectedKeyword: Bool = false
    weak var keywordDelegate: KeywordCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func touchUpToSelect(_ sender: Any) {
        if isSelectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self, unselectedName: keyword)
            keywordButton.backgroundColor = .clear
        } else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .yellow
        }
        isSelectedKeyword.toggle()
    }
    
    func setKeyword(text: String) {
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }
}
