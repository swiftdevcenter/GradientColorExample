//
//  ViewController.swift
//  GradientColorExample
//
//  Created by SwiftDevCenter on 07/03/19.
//  Copyright © 2019 SwiftDevCenter. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var fouthView: UIView!
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First view
        self.firstView.applyGradient(colors: [UIColor.red.cgColor, UIColor.blue.cgColor], locations: nil, direction: .topToBottom)
        
        // Second view
        self.secondView.applyGradient(colors: [UIColor.red.cgColor, UIColor.cyan.cgColor, UIColor.yellow], locations: nil, direction: .topToBottom)
        
        // Third view
        self.thirdView.applyGradient(colors: [UIColor.orange.cgColor, UIColor.yellow.cgColor], locations: nil, direction: .topToBottom)
        
        // Fourth view
        self.fouthView.applyGradient(colors: [UIColor.orange.cgColor, UIColor.yellow.cgColor], locations: nil, direction: .leftToRight)
        
        // My view
        self.myView.applyGradient(colors: [UIColor.red.cgColor, UIColor.blue.cgColor], locations: nil, direction: .leftToRight)
        
    }
    
    
}

extension UIView {
    
    enum Direction: Int {
        case topToBottom = 0
        case bottomToTop
        case leftToRight
        case rightToLeft
    }
    
    func applyGradient(colors: [Any]?, locations: [NSNumber]? = [0.0, 1.0], direction: Direction = .topToBottom) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        
        switch direction {
        case .topToBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
            
        case .bottomToTop:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
            
        case .leftToRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            
        case .rightToLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        }
        
        self.layer.addSublayer(gradientLayer)
    }
}


