//
//  CustomView.swift
//  HW26
//
//  Created by Nazar on 19.05.2025.
//

import UIKit

protocol ICustomViewDelegate {
    func tappedView(_ view: String)
}

class CustomView: UIView {
    var delegateView: ICustomViewDelegate?
    
    var nameInstanceView: String?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        
        if let hitView = hitView as? CustomView {
            if let name = hitView.nameInstanceView {
                hitView.delegateView?.tappedView(name)
            } else {
                print("nil")
            }
        }
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if super.point(inside: point, with: event) {
            return true
        }
        
        for subview in subviews.reversed() {
            let pointInSubview = subview.convert(point, from: self)
            if subview.point(inside: pointInSubview, with: event) {
                return true
            }
        }
        
        return false
    }
}
