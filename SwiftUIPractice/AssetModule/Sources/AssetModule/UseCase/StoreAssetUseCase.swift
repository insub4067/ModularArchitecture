//
//  StoreAssetUseCase.swift
//
//
//  Created by 김인섭 on 10/19/23.
//

import Combine

public struct StoreAssetUseCase {
    
    private let repository: AssetRepositoriable
    
    public init(repository: AssetRepositoriable) {
        self.repository = repository
    }
    
    public func execute(asset: Asset) {
        repository.store(asset)
    }
}
