//
//  UserNetworkable.swift
//
//
//  Created by 김인섭 on 10/19/23.
//

import Combine
import MightyCombine

public protocol UserNetworkable {
    
    var session: URLSessionable { get }
    var getUser: (String) -> AnyPublisher<User, Error> { get }
}
