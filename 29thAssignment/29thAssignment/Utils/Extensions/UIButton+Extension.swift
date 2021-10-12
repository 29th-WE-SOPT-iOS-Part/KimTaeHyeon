//
//  UIButton+Extension.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/12.
//

import UIKit

extension UIButton {
    // iOS14부터 UIAction이 addAction가능하기에... 이전에는 NSObject형태로 등록해서 처리하는 방식으로...
    func press(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        if #available(iOS 14.0, *) {
          self.addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
        } else {
          @objc class ClosureSleeve: NSObject {
            let closure:()->()
            init(_ closure: @escaping()->()) { self.closure = closure }
            @objc func invoke() { closure() }
          }
          let sleeve = ClosureSleeve(closure)
          self.addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
          objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
