//
//  ViewController.swift
//  LockingRings
//
//  Created by Duncan Champney on 1/23/24.
//



import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView(frame: CGRectZero)
    
    
    // Install an image in imageView that contains a series of crescent shapes, ending in a full circle.
    private func setShades(count: Int) {
        var image = UIImage()
        let lineWidth = 7.0
        let circleDiameter = 50.0
        let width = CGFloat(count+1)/2.0 * circleDiameter
        let bounds = CGRect(origin: CGPointZero, size: CGSize(width: width, height: circleDiameter))
        let circleColor =  UIColor(_colorLiteralRed: 161.0/255, green: 62.0/255, blue: 3.0/255, alpha: 1.0)
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        image = renderer.image { context in
            for index in 0..<count {
                let x = CGFloat(index) * circleDiameter / 2
                let circleRect = CGRect(
                    x: x, y: 0,
                    width: circleDiameter, height: circleDiameter)
                let circle = UIBezierPath.init(ovalIn: circleRect)
                circle.lineWidth = lineWidth
                circleColor.setFill()
                context.cgContext.setBlendMode(.normal)
                
                //Fill the circle with our circle color
                circle.fill()
                
                //Switch the drawing mode to .clear, so we erase anything we draw
                context.cgContext.setBlendMode(.clear)
                
                // Erase the outline of this circle
                circle.stroke()
            }
        }
        // Place the image view near the bottom of the content view, and on the right side.
        let frame = CGRect(x: view.bounds.maxX - bounds.width, y: view.bounds.maxY - 100 - bounds.height, width: bounds.width, height: bounds.height)
        imageView.frame = frame
        imageView.image = image
    }

    override func viewDidLayoutSubviews() {
        // You need to create teh image view when the view changes its subviews
        //so that it is placed correctly (e.g. after device rotation)
        setShades(count: 4)
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.addSubview(imageView)
    }
}


