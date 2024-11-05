//
//  ZLMyViewModel.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit

class ZLMyViewModel: ZLBaseViewModel {

    var userInfo: ZLUserInfoModel?

    func getUserInfo() -> Single<Bool> {
        return ZLProvider.requestObject(target: ZLMyAPI.userInfo, type: ZLUserInfoModel.self).flatMap { response in
            if response.isSuccess {
                if let userInfo = response.data {
                    self.userInfo = userInfo
                }
                return Single.just(true)
            } else {
                return Single.just(false)
            }
        }
    }

    func getInfoByRole() -> Single<Bool> {
        return ZLProvider.requestArray(target: ZLMyAPI.getInfoByRole, type: ZLInfoRoleItemModel.self).flatMap { response in
            if response.isSuccess {
                return Single.just(true)
            } else {
                return Single.just(false)
            }
        }
    }
}
