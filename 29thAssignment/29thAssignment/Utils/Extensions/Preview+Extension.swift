//
//  Preview+Extension.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/04.
//

import SwiftUI

#if DEBUG
enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    
    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12:
            return "iPhone 12"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        }
    }
}

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            viewController.view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            viewController.view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }
    
    func toPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}

extension UIView {
    private struct Preview: UIViewRepresentable {
        public let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ view: UIView, context: Context) {
            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }
    
    func toPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
#endif
