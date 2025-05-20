//
//  UIView + Delegate.swift
//  HW26
//
//  Created by Nazar on 19.05.2025.
//

import UIKit

extension ICustomViewDelegate {
    func addDelegate(_ views: UIView...) {
        for view in views {
            if let view = view as? CustomView {
                view.delegateView = self
            }
        }
    }
}
