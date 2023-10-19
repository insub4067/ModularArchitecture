//
//  GetUserAndUpdateDataUseCase.swift
//
//
//  Created by 김인섭 on 10/19/23.
//

import Foundation
import Combine
import UserModule
import AssetModule
import Network
import DataBase
import MightyCombine

public struct GetUserAndStoreAssetUseCase {
    
    private let getUserUseCase: GetUserUseCase
    private let storeAssetUseCase: StoreAssetUseCase
    
    private var store = Set<AnyCancellable>()
    
    public init(
        getUserUseCase: GetUserUseCase,
        storeAssetUseCase: StoreAssetUseCase
    ) { 
        self.getUserUseCase = getUserUseCase
        self.storeAssetUseCase = storeAssetUseCase
    }
    
    public func execute(_ username: String) async throws -> User {
        let user = try await getUserUseCase.execute(username).asyncThrows
        let asset = Asset(ownerId: user.id, assetType: "Bitcoin")
        storeAssetUseCase.execute(asset: asset)
        return user
    }
}
