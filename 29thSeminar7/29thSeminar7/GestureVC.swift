//
//  GestureVC.swift
//  29thSeminar7
//
//  Created by taehy.k on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제스처 인식기 생성 및 액션 연결 방법 2가지
        let tapRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(tap(gestureRecognizer:))
        )
        
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer2.addTarget(
            self,
            action: #selector(tap(gestureRecognizer:))
        )
        
        testView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tap(gestureRecognizer: UITapGestureRecognizer) {
        print("뷰 안에서 탭")
    }
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        print("uiview 안에서 tap")
    }
}
