//
//  ViewController.swift
//  LayerMaskingExample
//
//  Created by Soso on 08/03/2020.
//  Copyright © 2020 Soso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bounds = imageView.bounds
        let width = bounds.width
        
        let pathCircle = UIBezierPath(ovalIn: bounds)
        let pathClip = UIBezierPath(rect: bounds).reversing()
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*0, y: width/4*0, width: width/4, height: width/4)))
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*1, y: width/4*1, width: width/4, height: width/4)))
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*2, y: width/4*2, width: width/4, height: width/4)))
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*3, y: width/4*3, width: width/4, height: width/4)))
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*0, y: width/4*3, width: width/4, height: width/4)))
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*1, y: width/4*2, width: width/4, height: width/4)))
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*2, y: width/4*1, width: width/4, height: width/4)))
        pathClip.append(UIBezierPath(ovalIn: CGRect(x: width/4*3, y: width/4*0, width: width/4, height: width/4)))

        let image = UIGraphicsImageRenderer(bounds: bounds).image { (c) in
            UIColor.black.setFill()
            pathClip.addClip()
            pathCircle.fill()
        }
        let layer = CAShapeLayer()
        layer.frame = bounds
        layer.contents = image.cgImage
        imageView.layer.mask = layer
    }


}

