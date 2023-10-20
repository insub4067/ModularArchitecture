import XCTest
import Combine
@testable import Network

final class UserNetworkTests: XCTestCase {

    private var store = Set<AnyCancellable>()
    
    var sut: UserNetwork? = UserNetwork(session: URLSession.mockSession)
    
    func test_MemoryLeak() {
        sut = nil
        XCTAssertNil(sut)
    }
    
    func test_Inject() {
        sut?.getUser = { _ in .inject(.failure(TestError.testError)) }
        sut?.getUser("")
            .sink { completion in
                let error = completion.error as? TestError
                XCTAssertNotNil(error)
                XCTAssertEqual(error, TestError.testError)
            } receiveValue: { user in
                
            }.store(in: &store)
    }
}

enum TestError: Error {
    case testError
}
