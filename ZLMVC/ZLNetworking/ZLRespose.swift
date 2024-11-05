//
//  ZLRespose.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/11.
//

import UIKit

class ZLResposeModel<T>: ZLBaseModel {
    var code: Int = 0
    var msg: String = ""
    var data: T?

    var isSuccess: Bool {
        get {
            return code == 200
        }
    }
}
