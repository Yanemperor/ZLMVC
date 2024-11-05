//
//  ZLAuthManager.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit

class ZLAuthManager {
    static let shared = ZLAuthManager()

    fileprivate let tokenKey = "TokenKey"
    fileprivate let userDefaults = UserDefaults.standard

    let tokenChanged = PublishSubject<ZLTokenModel?>()
    // 是否正在刷新token
    var hasRefresh: Bool = false

    var token: ZLTokenModel? {
        get {
            guard let jsonString = userDefaults.string(forKey: tokenKey) else {
                return nil
            }
            return ZLTokenModel.deserialize(from: jsonString)
        }
        set {
            if let token = newValue, let jsonString = token.toJSONString() {
                userDefaults.set(jsonString, forKey: tokenKey)
                UserDefaults.standard.synchronize()
            } else {
                userDefaults.set(nil, forKey: tokenKey)
            }
            tokenChanged.onNext(newValue)
            hasRefresh = false
        }
    }

    // 有效的令牌
    var hasValidToken: Bool {
        if token == nil, token?.token == nil {
            return false
        } else {
            return true
        }
    }

    func setToken(token: ZLTokenModel) {
        ZLAuthManager.shared.token = token
//        NotificationCenter.default.post(name: NSNotification.Name("ZL_LOGIN"), object: nil)
    }

    func removeToken() {
        ZLAuthManager.shared.token = nil
    }
}
