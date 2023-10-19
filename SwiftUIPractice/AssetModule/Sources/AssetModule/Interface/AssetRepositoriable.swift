//
//  AssetDatabaseInterface.swift
//  
//
//  Created by 김인섭 on 10/19/23.
//

import Combine

public protocol AssetRepositoriable {
    
    func store(_ asset: Asset)
    func getAll() -> [Asset]
    func get(with assetId: String) throws -> Asset
    func get(with userId: Int) throws -> Asset
}
