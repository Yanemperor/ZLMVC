//
//  ZLProvider.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/7.
//

import UIKit
import NSObject_Rx
import SwiftyJSON


struct ZLProvider {
    static func requestObject<T: TargetType, E: HandyJSON>(target: T, type: E.Type) -> Single<ZLResposeModel<E>> {
        return ZLRestAPI.shared.requestObject(target: target, type: type)
    }

    static func requestArray<T: TargetType, E: HandyJSON>(target: T, type: E.Type) -> Single<ZLResposeModel<[E]>> {
        return ZLRestAPI.shared.requestArray(target: target, type: type)
    }
}

class ZLRestAPI: NSObject {

    static let shared = ZLRestAPI()

    let token: String = ZLAuthManager.shared.token?.token ?? ""

    var provider = MoyaProvider<MultiTarget>(session: Session(interceptor: ZLRequestInterceptor()),
                                             plugins: [
                                                ZLOAuthPluginType(),
                                                AccessTokenPlugin { _ in
                                                    return ZLAuthManager.shared.token?.token ?? ""
                                                },
                                                NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),
                                                NetworkActivityPlugin(networkActivityClosure: { change, target in
                                                    switch change {
                                                    case .began:
                                                        // #### 开始 ####
                                                        break
                                                    case .ended:
                                                        // #### 结束 ####
                                                        break
                                                    }
                                                })
    ])

    func requestObject<T: TargetType, E: HandyJSON>(target: T, type: E.Type) -> Single<ZLResposeModel<E>> {
        return provider.rx.request(MultiTarget(target)).flatMap { response in
            if response.statusCode == 200 {
                let jsonString: String = (NSString(data: response.data, encoding: String.Encoding.utf8.rawValue) ?? "") as String
                let resposeModel = ZLResposeModel<E>.deserialize(from: jsonString)
                return Observable.just(resposeModel ?? ZLResposeModel()).asSingle()
            } else {
                let resposeModel = ZLResposeModel<E>()
                resposeModel.code = 500
                resposeModel.msg = "系统错误"
                return Observable.just(resposeModel).asSingle()
            }
        }
    }

    func requestArray<T: TargetType, E: HandyJSON>(target: T, type: E.Type) -> Single<ZLResposeModel<[E]>> {
        return provider.rx.request(MultiTarget(target)).flatMap { response in
            if response.statusCode == 200 {
                let jsonString: String = (NSString(data: response.data, encoding: String.Encoding.utf8.rawValue) ?? "") as String
                let resposeModel = ZLResposeModel<[E]>.deserialize(from: jsonString)
                return Observable.just(resposeModel ?? ZLResposeModel()).asSingle()
            } else {
                let resposeModel = ZLResposeModel<[E]>()
                resposeModel.code = 500
                resposeModel.msg = "系统错误"
                return Observable.just(resposeModel).asSingle()
            }
        }
    }
}

