//
//  Extensions.swift
//  TravellingApp
//
//  Created by Mohamed El Hanafi on 6/25/20.
//  Copyright © 2020 Mohamed El Hanafi. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundView(raduis: CGFloat = 8.0, borderColor: UIColor? = nil, borderWidth: CGFloat? = nil) {
        self.layer.cornerRadius = raduis
        
        if let color = borderColor {
            self.layer.borderColor = color.cgColor
            
            if let width = borderWidth {
                self.layer.borderWidth = width
            }else {
                self.layer.borderWidth = 1.0
            }
            
        }
    }
    
    func roundView(raduis: CGFloat = 8.0) {
        self.layer.cornerRadius = raduis
    }
    
    func roundViewWithShadow(raduis: CGFloat = 10, shadowColor: UIColor = .gray, shadowRaduis : CGFloat = 10, shadowOpacity: Float = 0.4){
        self.layer.shadowColor = shadowColor.cgColor;
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRaduis
        self.layer.shadowOffset = CGSize(width:0,height:2)
        
        self.layer.cornerRadius = raduis
        
        
    }
    
    func roundViewCorners(fromSide corners: UIRectCorner, withRaduis radius: CGFloat) {
        let bezierPath = UIBezierPath(roundedRect: self.bounds , byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        
        self.layer.mask = shapeLayer
    }
    
    func drawDottedLine(dashLenght: Int = 7, gapLength: Int = 5) {
        let p0 = CGPoint(x: self.bounds.minX, y: self.center.y)
        let p1 = CGPoint(x: self.bounds.maxX, y: self.center.y)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [NSNumber(value: dashLenght), NSNumber(value: gapLength)]

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
}

extension UIColor {
    static var primaryColor: UIColor {
        return UIColor(named: "primaryColor") ?? .clear
    }
    
    static var primaryColorLight: UIColor {
        return UIColor(named: "primaryColorLight") ?? .clear
    }
    
    static var accentColor: UIColor {
        return UIColor(named: "accentColor") ?? .clear
    }
}

extension Date {
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM"
        return dateFormatter.string(from: self)
    }
    
    var timeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self)
    }
}

extension TimeInterval {
    private var seconds: Int {
        return Int(self) % 60
    }

    var minutes: Int {
        return (Int(self) / 60 ) % 60
    }
    
    var hours: Int {
        return Int(self) / 3600
    }

    var stringTime: String {
        if hours != 0 {
            return "\(hours)h \(minutes)m \(seconds)s"
        } else if minutes != 0 {
            return "\(minutes)m \(seconds)s"
        }
        else {
            return "\(seconds) seconds"
        }
    }
    
    var durationString: String {
        return String(format: "%02d:%02d", hours,minutes)
    }
}
