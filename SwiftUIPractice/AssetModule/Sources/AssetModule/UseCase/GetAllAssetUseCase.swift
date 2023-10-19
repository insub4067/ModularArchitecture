//
//  GetAllAssetUseCase.swift
//  
//
//  Created by 김인섭 on 10/19/23.
//

import Foundation

public class GetAllAssetUseCase {
    
    private let repository: AssetRepositoriable
    
    public init(repository: AssetRepositoriable) {
        self.repository = repository
    }
    
    public func execute() -> [Asset] {
        repository.getAll()
    }
}
