//
//  ContentViewModel.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/15/23.
//

import Combine
import Foundation
import FeatureGroup
import UserModule
import AssetModule
import Network
import DataBase

class ContentViewModel: ObservableObject {
    
    private var store = Set<AnyCancellable>()
    private let getUserAndStoreAssetUseCase: GetUserAndStoreAssetUseCase
    private let getAssetByUserIdUseCase: GetAssetByUserIdUseCase
    
    @Published var user: User?
    @Published var asset: Asset?
    
    init(getUserAndStoreAssetUseCase: GetUserAndStoreAssetUseCase, getAssetByUserIdUseCase: GetAssetByUserIdUseCase) {
        self.getUserAndStoreAssetUseCase = getUserAndStoreAssetUseCase
        self.getAssetByUserIdUseCase = getAssetByUserIdUseCase
    }
    
    static func build() -> ContentViewModel {
        
        let assetRepo = AssetRepository()
        let getUserAndStoreAssetUseCase = GetUserAndStoreAssetUseCase.init(
            getUserUseCase: .init(userNetwork: UserNetwork()),
            storeAssetUseCase: .init(repository: assetRepo)
        )
        let getAssetByUserIdUseCase = GetAssetByUserIdUseCase.init(repository: assetRepo)
        return ContentViewModel(
            getUserAndStoreAssetUseCase: getUserAndStoreAssetUseCase,
            getAssetByUserIdUseCase: getAssetByUserIdUseCase
        )
    }
}

extension ContentViewModel {
    
    func registerBitcoin() {
        Task { @MainActor in
            self.user = try? await self.getUserAndStoreAssetUseCase.execute("octocat")
        }
    }
    
    func getResgisteredAsset() {
        guard let user else { return }
        self.asset = try? getAssetByUserIdUseCase.execute(user.id)
    }
}
