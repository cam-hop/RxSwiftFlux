//
//  SubcriberModel.swift
//  DemoApp
//
//  Created by DUONG VANHOP on 2017/06/14.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import Himotoki

struct SubcriberResponse : Decodable {
    let resultCount: Int
    let results: [SubcriberModel]?

    static func decode(_ e: Extractor) throws -> SubcriberResponse {
        return try SubcriberResponse(
            resultCount: e <| "resultCount",
            results: e <||? "results"
        )
    }
}

struct SubcriberModel: Decodable {
    let name: String
    let generation: String
    let imageUrl: String

    static func decode(_ e: Extractor) throws -> SubcriberModel {
        return try SubcriberModel(
            name: e <| "trackName",
            generation: e <| "artistName",
            imageUrl: e <| "artworkUrl100"
        )
    }
}
