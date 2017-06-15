//
//  API.swift
//  DemoApp
//
//  Created by DUONG VANHOP on 2017/06/14.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import RxSwift
import RxCocoa
import Himotoki
import Alamofire
import RxAlamofire

final class API {

    static let shared = API()

    func request(_ item: APIRequestItem) -> Observable<Any> {
        return Observable.create { observer -> Disposable in
            let apiDomain = "https://itunes.apple.com"
            guard let url = URL(string: apiDomain + item.path) else {
                return Disposables.create()
            }

            return RxAlamofire.requestJSON(item.method, url, parameters: item.parameters, headers: nil)
                .subscribe(
                    onNext: { (response, value) in
                        // Check the response code if needed
                        observer.on(.next(value))
                    },
                    onError: { (error) in
                        observer.on(.error(error))
                    },
                    onCompleted: {
                        observer.on(.completed)
                    })

        }

    }
}
