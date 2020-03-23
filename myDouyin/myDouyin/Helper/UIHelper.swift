//
//  UIHelper.swift
//  myDouyin
//
//  Created by jfx on 2019/12/3.
//  Copyright © 2019 zkbc. All rights reserved.
//

import UIKit
var layers = [CAShapeLayer]()

//
@IBDesignable open class ClippedView: UIView {
    
}

extension UIView{
    //IBInspectable public 修饰后可在sb上修改值
  @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    //设置阴影颜色
   @IBInspectable public var shadowColor: UIColor {
        get {
           return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    //设置阴影位移
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    //设置阴影圆角
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    //设置阴影透明度
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = false
        }
    }
    
    func raiseAnimate(imageName:String, delay:TimeInterval)  {
        let path = UIBezierPath()
        //起点，在试图的中间
        let beginPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        
        //控制点的位移，随机数
        let a:CGFloat = 2
        let b:CGFloat = 1.5
        let c:CGFloat = 3
        let offset1 = [a,b,c]
        let cxoffset = offset1.randomElement()!*bounds.maxX
        let cyoffset = offset1.randomElement()!*bounds.maxY
        
        //终点的位移，随机数
        let d:CGFloat = 1.5
        let e:CGFloat = 1
        let f:CGFloat = 0.8
        let offset2 = [d,e,f]
        
        let g:CGFloat = 2.5
        let h:CGFloat = 3
        let i:CGFloat = 2
        let offset3 = [g,h,i]
        
        let exoffset = offset2.randomElement()!*bounds.maxX
        let eyoffset = offset3.randomElement()!*bounds.maxY
        
        //终点
        let endPoint = CGPoint(x: beginPoint.x - exoffset, y: beginPoint.y - eyoffset)
        //控制点
        let controllPoint = CGPoint(x: beginPoint.x-cxoffset, y: beginPoint.y-cyoffset)
        
        path.move(to: beginPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controllPoint)
        let group = CAAnimationGroup()
        group.duration = 4
        group.beginTime = CACurrentMediaTime()+delay
        group.repeatCount = .infinity
        group.isRemovedOnCompletion = false
        group.fillMode = .forwards
        group.timingFunction = CAMediaTimingFunction(name: .linear)
        
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.path = path.cgPath
        
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotateAnimation.values = [0,.pi/2.0,.pi/1.0]
        
        let alphaAnimation = CAKeyframeAnimation(keyPath: "opacity")
        alphaAnimation.values = [0,0.3,1,0.3,0]
        
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.values = [1.0,1.8,2.0]
        group.animations = [pathAnimation,rotateAnimation,alphaAnimation,scaleAnimation]
        
        let layer = CAShapeLayer()
        layer.opacity = 0
        layer.contents = UIImage(named: imageName)?.cgImage
        layer.frame = CGRect(origin: beginPoint, size: CGSize(width: 10, height: 10))
        self.layer.addSublayer(layer)
        layer.add(group, forKey: nil)
        layers.append(layer)
        
    }
    func resetViewAnimation() {
        for layer in layers {
            layer.removeFromSuperlayer()
        }
        self.layer.removeAllAnimations()
    }
}
