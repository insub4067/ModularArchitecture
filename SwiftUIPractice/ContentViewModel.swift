//
//  ContentViewModel.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/15/23.
//

import Combine
import UserModule

class ContentViewModel: ObservableObject {
    
    private let getUserUseCase = GetUserUseCase()
    private var store = Set<AnyCancellable>()
    
    @Published var usernameInput = ""
    @Published var user: User?
    
    func didTapButton() {
        getUserUseCase.execute(username: usernameInput)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] user in
                self?.user = user
            }.store(in: &store)
    }
}
