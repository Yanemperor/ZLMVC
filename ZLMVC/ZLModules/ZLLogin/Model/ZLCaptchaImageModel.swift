//
//  ZLCaptchaImageModel.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/11.
//

import UIKit

class ZLCaptchaImageModel: ZLBaseModel {
    var captchaEnabled: Bool = false
    var uuid: String?
    var img: String?

    var captchaImage: UIImage {
        get {
            return UIImage(base64String: self.img ?? "") ?? UIImage(named: "logo")!
        }
    }
}
