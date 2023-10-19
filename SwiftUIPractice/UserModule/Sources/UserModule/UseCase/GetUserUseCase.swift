//
//  GetUserUseCase.swift
//  
//
//  Created by 김인섭 on 10/19/23.
//

import Combine

public struct GetUserUseCase {
    
    let userNetwork: UserNetworkable
    
    public init(userNetwork: UserNetworkable) {
        self.userNetwork = userNetwork
    }
    
    public func execute(_ username: String) -> AnyPublisher<User, Error> {
        userNetwork.getUser(username)
    }
}
