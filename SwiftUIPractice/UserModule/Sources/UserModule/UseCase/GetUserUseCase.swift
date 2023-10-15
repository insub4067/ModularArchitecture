//
//  GetUserUseCase.swift
//  
//
//  Created by 김인섭 on 10/15/23.
//

import Foundation
import Combine
import Network
import Model

public struct GetUserUseCase {
    
    private let userNetwork: UserNetwork
    
    public init(userNetwork: UserNetwork = .init()) {
        self.userNetwork = userNetwork
    }
    
    public func execute(username: String) -> AnyPublisher<User, Error> {
        userNetwork.getUser(username)
    }
}
