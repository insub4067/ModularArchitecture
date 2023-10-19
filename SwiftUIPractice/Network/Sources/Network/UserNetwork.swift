//
//  UserNetwork.swift
//  
//
//  Created by 김인섭 on 10/19/23.
//

//import NetworkProtocol

import Foundation
import Combine

import UserModule

import MightyCombine

public class UserNetwork: UserNetworkable {
    
    public let session: URLSessionable
    
    public init(session: URLSessionable = URLSession.shared) {
        self.session = session
    }
    
    public var getUser: (String) -> AnyPublisher<User, Error> {{ username in
        EndPoint
            .init("https://api.github.com")
            .urlPaths(["/users", "/\(username)"])
            .requestPublisher(expect: User.self)
    }}
}


