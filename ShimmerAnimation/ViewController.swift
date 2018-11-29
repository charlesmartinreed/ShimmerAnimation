//
//  ViewController.swift
//  ShimmerAnimation
//
//  Created by Charles Martin Reed on 11/29/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //dark background
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        //text label setup
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimmer"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        
        //set the frame and add to subview
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height:
            400)
        darkTextLabel.textAlignment = .center
        view.addSubview(darkTextLabel)
        
        //create the white version of the text
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "Shimmer"
        shinyTextLabel.textColor = .white
        shinyTextLabel.font = UIFont.systemFont(ofSize: 80)
        
        //set the frame and add to subview
        shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height:
            400)
        shinyTextLabel.textAlignment = .center
        view.addSubview(shinyTextLabel)
        
        //MARK:- Gradient mask
        let gradientLayer = CAGradientLayer()
        
        //two main properties, colors and locations
         //make white in the middle
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1] //clear starts at 0, white starts at 0.5, clear ends at 1
        
        //set the frame bounds - should only cover label's frame
        gradientLayer.frame = shinyTextLabel.frame
        
        //rotate clockwise using transform - rotated by the Z axis, moving toward user
        let angle = 45 * CGFloat.pi / 180 //diagonal
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
       
        
        //view.layer.addSublayer(gradientLayer)
        //make the gradientLayer the mask for the white text
        shinyTextLabel.layer.mask = gradientLayer
        
        //animation for the mask
        let animation = CABasicAnimation(keyPath: "transform.translation.x") //transforming on the x axis
        //control the speed of the animation with duration property, in seconds
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(animation, forKey: "GradientAnimation") //key name doesn't matter.
    }


}

