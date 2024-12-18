//
//  UITextField+Extensions.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 12.11.24.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
