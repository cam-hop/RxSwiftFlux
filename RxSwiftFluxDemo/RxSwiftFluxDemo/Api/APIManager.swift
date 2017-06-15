//
//  APIManager.swift
//  DemoApp
//
//  Created by DUONG VANHOP on 2017/06/14.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import RxSwift
import RxCocoa
import Himotoki
import RxAlamofire

struct APIManager {
    static func getSubcriberList() -> Observable<Any> {
        let subcriberList = APIRequest.subcriberList.getAPIRequestItem()
        let params = ["term": "beatles",
                      "country": "JP",
                      "lang": "ja_jp",
                      "media": "music"] as [String: Any]
         _ = subcriberList.addParameters(params)
        return API.shared.request(subcriberList)
    }
}
