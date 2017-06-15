//
//  APIRequestItem.swift
//  DemoApp
//
//  Created by DUONG VANHOP on 2017/06/14.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import Alamofire

final class APIRequestItem {
    var method = Alamofire.HTTPMethod.get
    var path = ""
    var parameters = [String: Any]()

    init(method: Alamofire.HTTPMethod , path: String, parameters: [String: Any]) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }

    func addParameters(_ parameters: [String: Any]) -> APIRequestItem {
        for (key, value) in parameters {
            self.parameters[key] = value
        }
        return self
    }
}

enum APIRequest {
    case subcriberList

    func getAPIRequestItem() -> APIRequestItem {
        switch self {
        case .subcriberList:
            return APIRequestItem(method: .get, path: "/search?", parameters: [:])
        }
    }
}
