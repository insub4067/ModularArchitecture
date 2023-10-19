//
//  Asset.swift
//
//
//  Created by 김인섭 on 10/19/23.
//

import Foundation

public struct Asset {
    
    public var ownerId: Int
    
    public var assetType: String
    public var assetId: String
    
    public init(
        ownerId: Int,
        assetType: String,
        assetId: String = UUID().uuidString
    ) {
        self.ownerId = ownerId
        self.assetType = assetType
        self.assetId = assetId
    }
}
