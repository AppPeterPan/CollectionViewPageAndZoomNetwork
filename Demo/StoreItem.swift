//
//  StoreItem.swift
//  CollectionViewPageAndZoom
//
//  Created by SHIH-YING PAN on 2020/12/10.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import Foundation

struct SearchResponse: Codable {
    let resultCount: Int
    let results: [StoreItem]
}
struct StoreItem: Codable {
    let artistName: String
    let trackName: String
    let collectionName: String?
    let previewUrl: URL
    let artworkUrl100: URL
    let trackPrice: Double?
    let isStreamable: Bool?
    
    func artworkUrlForSize(_ size: Int) -> URL {
        artworkUrl100.deletingLastPathComponent().appendingPathComponent("\(size)x\(size)bb.jpg")
    }
}
