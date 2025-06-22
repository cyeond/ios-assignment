import XCTest
@testable import CydData

final class ProductRepositoryImplTests: XCTestCase {
    /// fetchProductList을 호출했을 때 데이터를 정상적으로 받아오는지 확인
    func test_fetchProductList_shouldReturnProducts() async throws {
        // given
        let repository = ProductRepositoryImpl()
        
        // when
        let products = try await repository.fetchProductList()
        
        // then
        XCTAssertFalse(products.isEmpty)
    }
}
