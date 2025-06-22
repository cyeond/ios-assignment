import XCTest
import RxSwift
import RxBlocking
import CydDomain
@testable import FeatureHome

final class HomeMainViewModelTests: XCTestCase {
    /// 상품 목록을 정상적으로 받아올 경우 productList가 값을 방출하는지 확인
    func test_loadProductList_success_shouldEmitProductsAndStopLoading() {
        // given
        let expectedProducts = [
            Product(id: "1", name: "Test", brand: "", price: 100, discountPrice: 80, discountRate: 20, imageUrl: "", linkUrl: "", tags: [], benefits: [], rating: 4.0, reviewCount: 5)
        ]
        let mockUseCase = MockFetchProductListUseCase(result: .success(expectedProducts))
        let viewModel = HomeMainViewModel(fetchUseCase: mockUseCase)
        let disposeBag = DisposeBag()
        
        let productExpectation = expectation(description: "product emitted")
        var receivedProducts: [Product]?
        
        viewModel.productList
            .subscribe(onNext: { products in
                receivedProducts = products
                productExpectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        // when
        viewModel.loadProductList()
        
        // then
        wait(for: [productExpectation], timeout: 1.0)
        
        XCTAssertEqual(receivedProducts?.count, expectedProducts.count)
    }
    
    /// 에러 발생 시 error 스트림이 메시지를 방출하는지 확인
    func test_loadProductList_failure_shouldEmitError() {
        // given
        struct DummyError: Error {}
        let mockUseCase = MockFetchProductListUseCase(result: .failure(DummyError()))
        let viewModel = HomeMainViewModel(fetchUseCase: mockUseCase)
        let disposeBag = DisposeBag()
        
        let errorExpectation = expectation(description: "error emitted")
        var receivedError: String?
        
        viewModel.error
            .subscribe(onNext: { error in
                receivedError = error
                errorExpectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        // when
        viewModel.loadProductList()
        
        // then
        wait(for: [errorExpectation], timeout: 1.0)
        
        XCTAssertNotNil(receivedError)
    }
    
    /// 로딩 상태가 true -> false 순서로 방출되는지 확인
    func test_loadProductList_shouldEmitLoadingStatesTrueThenFalse() {
        let mockUseCase = MockFetchProductListUseCase(result: .success([]))
        let viewModel = HomeMainViewModel(fetchUseCase: mockUseCase)
        let disposeBag = DisposeBag()
        
        var loadingStates: [Bool] = []
        let loadingExpectation = expectation(description: "loading emitted")
        
        viewModel.isLoading
            .skip(1)
            .subscribe(onNext: { isLoading in
                loadingStates.append(isLoading)
                if loadingStates == [true, false] {
                    loadingExpectation.fulfill()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.loadProductList()
        
        wait(for: [loadingExpectation], timeout: 1.0)
        
        XCTAssertEqual(loadingStates, [true, false])
    }
    
    /// loadProductList를 두 번 호출해도 매번 productList가 방출되는지 확인
    func test_loadProductList_calledTwice_shouldResetAndEmitAgain() {
        let expectedProducts = [
            Product(id: "1", name: "Test", brand: "", price: 100, discountPrice: 80, discountRate: 20, imageUrl: "", linkUrl: "", tags: [], benefits: [], rating: 4.0, reviewCount: 5)
        ]
        let mockUseCase = MockFetchProductListUseCase(result: .success(expectedProducts))
        let viewModel = HomeMainViewModel(fetchUseCase: mockUseCase)
        let disposeBag = DisposeBag()
        
        var callCount = 0
        let productExpectation = expectation(description: "product emitted twice")
        productExpectation.expectedFulfillmentCount = 2
        
        viewModel.productList
            .subscribe(onNext: { _ in
                callCount += 1
                productExpectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        viewModel.loadProductList()
        viewModel.loadProductList()
        
        wait(for: [productExpectation], timeout: 2.0)
        
        XCTAssertEqual(callCount, 2)
    }
}
