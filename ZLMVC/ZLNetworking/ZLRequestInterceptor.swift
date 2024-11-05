//
//  ZLRequestInterceptor.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit
import Alamofire

class ZLRequestInterceptor: RequestInterceptor {
    let disposeBag = DisposeBag()

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        request.setValue("iOS", forHTTPHeaderField: "AppPlatform")
        completion(.success(request))
    }

    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetry)
            return
        }
        // 确保只重试一次，否则就无限重试下去了
        guard request.retryCount == 0 else {
            return completion(.doNotRetry)
        }
        if let refreshToken = ZLAuthManager.shared.token?.refreshToken, !ZLAuthManager.shared.hasRefresh {
            ZLAuthManager.shared.hasRefresh = true
            let provider = ZLRestAPI()
            provider.requestObject(target: ZLLoginAPI.refreshToken(refreshToken: refreshToken), type: ZLTokenModel.self).subscribe { response in
                if let token = response.data?.token, let tokenModel = ZLAuthManager.shared.token {
                    tokenModel.token = token
                    ZLAuthManager.shared.setToken(token: tokenModel)
                    completion(.retry)
                } else {
                    completion(.doNotRetry)
                }
            } onFailure: { error in
                ZLAuthManager.shared.removeToken()
//                NotificationCenter.default.post(name: NSNotification.Name("ZL_LOGIN_OUT"), object: nil)
                ZLAuthManager.shared.hasRefresh = false
                completion(.doNotRetryWithError(error))
            }.disposed(by: disposeBag)
        } else {
            completion(.doNotRetry)
        }
    }
}
