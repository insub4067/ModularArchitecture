//
//  GetAssetByUserIdUseCase.swift
//
//
//  Created by 김인섭 on 10/19/23.
//

import Foundation

public struct GetAssetByUserIdUseCase {
    
    private let repository: AssetRepositoriable
    
    public init(repository: AssetRepositoriable) {
        self.repository = repository
    }
    
    public func execute(_ userId: Int) throws -> Asset {
        try repository.get(with: userId)
    }
}
