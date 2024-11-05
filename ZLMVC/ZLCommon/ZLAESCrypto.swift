//
//  ZLAESCrypto.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import CryptoSwift

struct ZLAESCryptoKey {
    static let KEY = "0102030405060708"
    static let IV = "0102030405060708"
}

class ZLAESCrypto: NSObject {
    static func aesCrypto(text: String) -> String {
        var encyptedStr = ""
        do {
            let encrypted = try AES(key: ZLAESCryptoKey.KEY.bytes, blockMode: CBC(iv: ZLAESCryptoKey.IV.bytes), padding: .pkcs7).encrypt(text.bytes)
            encyptedStr = encrypted.toHexString()
        } catch {
            print(error.localizedDescription)
        }
        return encyptedStr
    }
}
