//
//  ViewController.swift
//  29thSeminar8
//
//  Created by taehy.k on 2021/12/18.
//

import UIKit

import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var targetView: UIView!
    lazy var lottieView: AnimationView = {
        let view = AnimationView(name: "")
        return view
    }()
    
    var animator: UIViewPropertyAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimator()
    }
    
    func initAnimator() {
        animator = UIViewPropertyAnimator(
            duration: 3,
            curve: .easeOut,
            animations: {
                self.targetView.frame = CGRect(
                    x: self.view.center.x - 50,
                    y: self.view.center.y - 50,
                    width: 100,
                    height: 100
                )
            }
        )
        
        animator?.addAnimations {
            self.targetView.backgroundColor = .orange
        }
    }

    @IBAction func startButtonTapped(_ sender: Any) {
        animator?.startAnimation()
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        animator?.pauseAnimation()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        animator?.stopAnimation(true)
    }
}

