//
//  AssetDatabase.swift
//
//
//  Created by 김인섭 on 10/19/23.
//

import Foundation
import Combine
import AssetModule

public class AssetRepository: AssetRepositoriable {

    private var db: [Asset] = []
    
    public init() { }
    
    public func store(_ asset: Asset) {
        db.append(asset)
    }
    
    public func getAll() -> [Asset] {
        db
    }
    
    public func get(with assetId: String) throws -> Asset {
        let asset = db.filter { $0.assetId == assetId }.first
        if let asset {
            return asset
        } else {
            throw NSError(domain: "Asset Not Found", code: -1)
        }
    }
    
    public func get(with userId: Int) throws -> Asset {
        let asset = db.filter { $0.ownerId == userId }.first
        if let asset {
            return asset
        } else {
            throw NSError(domain: "Asset Not Found", code: -1)
        }
    }
}
