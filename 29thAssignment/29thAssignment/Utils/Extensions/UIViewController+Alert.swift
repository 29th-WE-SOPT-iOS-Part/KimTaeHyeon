//
//  UIViewController+Alert.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import UIKit

extension UIViewController {
    public func alertWithOkAction(title: String,
                                  message: String,
                                  alertCompletion: ((UIAlertAction) -> Void)?,
                                  completion: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: alertCompletion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: completion)
    }
}
