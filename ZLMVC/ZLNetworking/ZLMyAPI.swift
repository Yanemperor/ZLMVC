//
//  ZLMyAPI.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit
import Moya

enum ZLMyAPI {
    case userInfo
    case getInfoByRole
}

// MARK: - TargetType Protocol Implementation
extension ZLMyAPI: TargetType, AccessTokenAuthorizable {

    var baseURL: URL {
        let baseUrl = ""
        return URL(string: baseUrl + "/v2")!
    }

    var path: String {
        switch self {
        case .userInfo:
            return "/user/getInfo"
        case .getInfoByRole:
            return "/user/getInfoByRole"
        }
    }

    var method: Moya.Method {
        return .post
    }

    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        default:
            break
        }
        return params
    }

    var task: Moya.Task {
        switch self {

        default:
            if let parameters = parameters {
                return .requestCompositeData(bodyData: parameters.jsonData() ?? Data(), urlParameters: [:])
            }
        }
        return .requestPlain
    }

    var authorizationType: Moya.AuthorizationType? {
        return .bearer
    }

    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    public var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
