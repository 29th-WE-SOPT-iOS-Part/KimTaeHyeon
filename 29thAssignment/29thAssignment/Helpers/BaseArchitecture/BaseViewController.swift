//
//  BaseViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import UIKit

class BaseViewController: UIViewController, CodeBasedProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        hierarchy()
        layout()
    }
    
    func attribute() {
        view.backgroundColor = .systemBackground
    }
    
    func hierarchy() {}
    
    func layout() {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
