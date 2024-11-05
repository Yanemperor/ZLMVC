//
//  ZLLoginViewModel.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/7.
//

import UIKit

class ZLLoginViewModel: ZLBaseViewModel {

    var infoRoles: [ZLInfoRoleModel] = []
    var captchaImage: UIImage?
    var uuid: String?
    var imageCode = BehaviorRelay(value: "")

    func getCaptchaImage() -> Single<Bool> {
        return ZLProvider.requestObject(target: ZLLoginAPI.captchaImage, type: ZLCaptchaImageModel.self).flatMap { response in
            if response.isSuccess {
                self.captchaImage = response.data?.captchaImage
                self.uuid = response.data?.uuid
                return Single.just(true)
            } else {
                return Single.just(false)
            }
        }
    }

    func getInfoRoleByUserName() -> Single<Bool> {
        return ZLProvider.requestArray(target: ZLLoginAPI.getInfoRoleByUserName(userName: "kongyiming"), type: ZLInfoRoleModel.self).flatMap { response in
            if response.isSuccess {
                self.infoRoles = response.data ?? []
                return Single.just(true)
            } else {
                return Single.just(false)
            }
        }
    }

    func login() -> Single<Bool> {
        guard let uuid = self.uuid else { return Single.just(false) }
        guard self.imageCode.value.count > 0 else { return Single.just(false) }
        let password = ZLAESCrypto.aesCrypto(text: "a123456@")
        return ZLProvider.requestObject(target: ZLLoginAPI.login(username: "kongyiming", password: password, uuid: uuid, code: self.imageCode.value, roleId: self.infoRoles[0].roleId.string), type: ZLTokenModel.self).flatMap { response in
            if response.isSuccess {
                if let token = response.data {
                    ZLAuthManager.shared.setToken(token: token)
                }
                return Single.just(true)
            } else {
                return Single.just(false)
            }
        }
    }
}
