//
//  ZLTokenModel.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit

class ZLTokenModel: ZLBaseModel {
    var expiresIn: Int = 0
    var refreshToken: String?
    var token: String?
    var tokenHead: String?
}
