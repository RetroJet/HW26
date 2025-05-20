//
//  UIView + Print.swift
//  HW26
//
//  Created by Nazar on 19.05.2025.
//

import UIKit

func printNameOfSubviews(_ views: UIView...) {
    for view in views {
        if let view = view as? CustomView {
            if let name = view.nameInstanceView {
                    print(name)
                }
            }
        }
    }

