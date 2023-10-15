//
//  UserNetwork.swift
//
//
//  Created by 김인섭 on 10/15/23.
//

import Foundation
import Combine
import MightyCombine
import Model

public class UserNetwork {
    
    private let baseUrl = "https://api.github.com"
    private let session: URLSessionable
    
    public init(session: URLSessionable = URLSession.shared) {
        self.session = session
    }
    
    public lazy var getUser: (String) -> AnyPublisher<User, Error> =  { username in
        EndPoint
            .init(self.baseUrl)
            .urlPaths(["/users", "/\(username)"])
            .urlSession(self.session)
            .requestPublisher(expect: User.self)
    }
}
