//
//  ConnectApi.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/12/4.
//

import UIKit
import SwiftJWT
import Alamofire

struct MyClaims: Claims {
    let iss: String
    let sub: String
    let exp: Date
    let admin: Bool
}

let algorihm: String = "ES256"
let kid: String = "C8XD6G36JL"
let iss: String = "69a6de89-49a5-47e3-e053-5b8c7c11a4d1"

let base_api_url: String = "https://api.appstoreconnect.apple.com"

class ConnectApi {

    static let shared = ConnectApi()
    private let sessionManager: Session
    
    private init() {
        sessionManager = Alamofire.Session()
    }
    
    func getDevices () {
        let url = base_api_url + "/v1/devices"
        let params = ["filter[platform]": "IOS", "limit": 100] as [String : Any]
        let token = "Beare " + getToken()
        var header = HTTPHeaders()
        header["Authorization"] = token
        
        self.sessionManager.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON(completionHandler: { (response) in
                
            print("\(response.data)")
        })
    }
    
    func getToken() -> String {
        
        let filePath = "/Users/lijun/Downloads/AuthKey_C8XD6G36JL.p8"
        let fileManager = FileManager.default
        let data = fileManager.contents(atPath: filePath)
        guard data != nil else {
            return ""
        }
        
        let myHeader = Header(kid: kid)
        print("\(String(describing: myHeader.alg))")
        
        
        let myClaims = MyClaims(iss: iss, sub: "", exp: Date(timeIntervalSinceNow: 3600), admin: true)
        var myJWT = JWT(header: myHeader, claims: myClaims)
        let jwtSigner = JWTSigner.es256(privateKey: data!)
        let signedJWT = try? myJWT.sign(using: jwtSigner)
        print("\(String(describing: signedJWT))")
        
        return signedJWT!
        
//        let jwtVerifier = JWTVerifier.es256(publicKey: data!)
//        let verified = JWT<MyClaims>.verify(signedJWT!, using: jwtVerifier)
//
//        let newJWT = try? JWT<MyClaims>(jwtString: signedJWT!, verifier: jwtVerifier)
//
//        let jwtEncoder = JWTEncoder(jwtSigner: jwtSigner)
//        let jwtString = try? jwtEncoder.encodeToString(myJWT)
//
//        let jwtDecoder = JWTDecoder(jwtVerifier: jwtVerifier)
//        let jwt = try? jwtDecoder.decode(JWT<MyClaims>.self, fromString: jwtString!)
//        print("\(jwt)")
    }
}
