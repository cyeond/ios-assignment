// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import RxSwift
import CydCore
import CydDesignSystem

final class HomeMainViewController: UIViewController {
    private let viewModel: HomeMainViewModel
    private let disposeBag = DisposeBag()

    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    init(viewModel: HomeMainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        bindViewModel()
        loadProductList()
    }

    private func setupViews() {
        navigationItem.title = Strings.Home.navigationTitle
        navigationItem.backButtonTitle = ""
        view.backgroundColor = CydColor.Common.background
    }
    
    private func bindViewModel() {
        viewModel.productList
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { productList in
            })
            .disposed(by: disposeBag)
        
        viewModel.isLoading
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                isLoading ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
            })
            .disposed(by: disposeBag)
        
        viewModel.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] message in
                let alert = UIAlertController(title: Strings.Common.errorAlertTitle, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: Strings.Common.confirm, style: .default))
                self?.present(alert, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func loadProductList() {
        viewModel.loadProductList()
    }
}
