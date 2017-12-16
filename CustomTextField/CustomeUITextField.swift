//
//  CustomeUITextField.swift
//  CustomTextField
//
//  Created by apple on 2017/12/16.
//  Copyright © 2017年 linan. All rights reserved.
//

import UIKit

@IBDesignable
class CustomeUITextField: UITextField {
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        
        return textRect
    }
    
    @IBInspectable var leftImage : UIImage? {
        didSet {
            modifyView()
        }
    }
    
    @IBInspectable var leftPadding : CGFloat = 0
    @IBInspectable var color : UIColor = UIColor.lightGray {
        didSet {
            modifyView()
        }
    }
    
    func modifyView() {
        if let image = leftImage {
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedStringKey.foregroundColor : color])
    }

}
