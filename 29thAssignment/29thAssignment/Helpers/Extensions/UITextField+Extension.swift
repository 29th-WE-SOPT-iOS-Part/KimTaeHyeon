//
//  UITextField+Extension.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/08.
//

import UIKit

extension UITextField {
    /*
     Set textField left padding
     */
    public func setLeftPadding(_ size: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    /*
     Set textField right padding
     */
    public func setRightPadding(_ size: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
