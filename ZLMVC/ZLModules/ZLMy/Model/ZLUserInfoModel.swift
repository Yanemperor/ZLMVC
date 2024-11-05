//
//  ZLUserInfoModel.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit

class ZLUserInfoModel: ZLBaseModel {
    var dicValue: String?
    var isRoleMuch: Bool = false
    var orgCode: String?
    var orgId: String?
    var personName: String?
    var rname: String?
    var roleId: Int = 0
    var userId: Int = 0
    var userName: String?
    var avatar: String?
    var dealerName: String?         // 门店名称
    var inStationRepairLink: String?   // 站内保修链接
}
