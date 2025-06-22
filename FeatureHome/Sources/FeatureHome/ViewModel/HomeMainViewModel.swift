//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import RxSwift
import CydDomain

final class HomeMainViewModel {
    private let fetchUseCase: FetchProductListUseCase
    private let disposeBag = DisposeBag()
    
    private let productListSubject = PublishSubject<[Product]>()
    private let isLoadingSubject = BehaviorSubject<Bool>(value: false)
    private let errorSubject = PublishSubject<String>()
    
    var productList: Observable<[Product]> { productListSubject.asObservable() }
    var isLoading: Observable<Bool> { isLoadingSubject.asObservable() }
    var error: Observable<String> { errorSubject.asObservable() }
    
    init(fetchUseCase: FetchProductListUseCase) {
        self.fetchUseCase = fetchUseCase
    }
    
    func loadProductList() {
        isLoadingSubject.onNext(true)
        
        Task {
            do {
                let result = try await fetchUseCase.execute()
                productListSubject.onNext(result)
            } catch {
                errorSubject.onNext(error.localizedDescription)
            }
            isLoadingSubject.onNext(false)
        }
    }
}
