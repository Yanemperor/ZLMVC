//
//  ZLLoginAPI.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/7.
//

import UIKit
import Moya

enum ZLLoginAPI {
    case captchaImage
    case getInfoRoleByUserName(userName: String)
    case login(username: String, password: String, uuid: String, code: String, roleId: String)
    case refreshToken(refreshToken: String)

}

// MARK: - TargetType Protocol Implementation
extension ZLLoginAPI: TargetType {

    var baseURL: URL {
        let baseUrl = ""
        return URL(string: baseUrl + "/v2")!
    }

    var path: String {
        switch self {
        case .captchaImage:
            return "/captchaImage"
        case .getInfoRoleByUserName:
            return "/user/getInfoRoleByUserName"
        case .login:
            return "/user/login"
        case .refreshToken:
            return "/user/refreshToken"
        }
    }
    
    var method: Moya.Method {
        return .post
    }

    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        case .getInfoRoleByUserName(let userName):
            params["userName"] = userName
        case .login(let username, let password, let uuid, let code, let roleId):
            params["username"] = username
            params["password"] = password
            params["uuid"] = uuid
            params["code"] = code
            params["roleId"] = roleId
        case .refreshToken(let refreshToken):
            params["refreshToken"] = refreshToken
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

    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    public var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var addXauth: Bool {
        switch self {
        default:
            return true
        }
    }

}
