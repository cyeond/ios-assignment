import XCTest
@testable import FeatureProductDetail

final class ProductDetailViewModelTests: XCTestCase {
    /// url이 viewModel에 정상적으로 전달되는지 확인
    func test_init_whenGivenURL_setsLinkUrlCorrectly() {
        // given
        let testUrl = "https://test.com"
        
        // when
        let viewModel = ProductDetailViewModel(linkUrl: testUrl)
        
        // then
        XCTAssertEqual(viewModel.linkUrl, testUrl)
    }
}
