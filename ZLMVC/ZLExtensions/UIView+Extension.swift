//
//  UIView+Extension.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit

extension UIButton {
    static func create(title: String, bgColor: ThemeColorPicker = .bg, titleColor: ThemeColorPicker = .title, font: UIFont = .auto(size: 16)) -> UIButton {
        let button = UIButton()
        button.theme_backgroundColor = bgColor
        button.setTitle(title, for: .normal)
        button.theme_setTitleColor(titleColor, forState: .normal)
        button.titleLabel?.font = font
        return button
    }
}

extension UIImageView {
    static func create(bgColor: ThemeColorPicker = .bg) -> UIImageView {
        let imageView = UIImageView()
        imageView.theme_backgroundColor = bgColor
        return imageView
    }
}

extension UITextField {
    static func create(bgColor: ThemeColorPicker = .bg, textColor: ThemeColorPicker = .text, textAlignment: NSTextAlignment = .left, font: UIFont = .auto(size: 16), placeholder: String = "请输入") -> UITextField {
        let textField = UITextField()
        textField.theme_backgroundColor = bgColor
        textField.theme_textColor = textColor
        textField.textAlignment = textAlignment
        textField.placeholder = placeholder
        textField.font = font
        return textField
    }
}
