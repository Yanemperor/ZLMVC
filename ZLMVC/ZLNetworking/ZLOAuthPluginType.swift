//
//  ZLOAuthPluginType.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit
import SwiftyJSON

class ZLOAuthPluginType: PluginType {
    // 准备发起请求。我们可以在这里对请求进行修改，比如再增加一些额外的参数。
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return request
    }

    // 开始发起请求。我们可以在这里显示网络状态指示器。
    func willSend(_ request: RequestType, target: TargetType) {

    }

    // 收到请求响应。我们可以在这里根据结果自动进行一些处理，比如请求失败时将失败信息告诉用户，或者记录到日志中。
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        /*
        switch result {
        case .success(let response):
            let jsonString: String = (NSString(data: response.data, encoding: String.Encoding.utf8.rawValue) ?? "") as String
            let resposeModel = ZLResposeModel<Any>.deserialize(from: jsonString)
            let json = JSON(response.data)
            switch resposeModel?.code.uInt ?? 200 {
            case 200..<300:
                break
            case 1003:
                break
            default:
                if let msg = json["msg"].string {

                }
            }
        case .failure(_):
            break
        }
         */
    }

    // 处理请求结果。我们可以在 completion 前对结果进行进一步处理。
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        /*
        switch result {
        case .success(let response):
            let jsonString: String = (NSString(data: response.data, encoding: String.Encoding.utf8.rawValue) ?? "") as String
            let resposeModel = ZLResposeModel<Any>.deserialize(from: jsonString)
            switch resposeModel?.code.uInt ?? response.statusCode.uInt {
            case 200..<300:
                return .success(response)
            case 401:
                return .failure(MoyaError.statusCode(Response(statusCode: 401, data: response.data)))
            default:
                return .failure(MoyaError.jsonMapping(Response(statusCode: resposeModel?.code ?? 500, data: response.data)))
            }
        case .failure(_):
            break
        }
         */
        return result
    }
}
