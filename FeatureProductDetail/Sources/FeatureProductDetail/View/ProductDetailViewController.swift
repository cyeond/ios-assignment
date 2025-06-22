// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import WebKit
import SnapKit
import CydCore
import CydDesignSystem

final class ProductDetailViewController: UIViewController {
    private let viewModel: ProductDetailViewModel
    
    private let webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.backgroundColor = UIColor.clear
        return webView
    }()

    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadProductLink()
    }

    private func setupViews() {
        navigationItem.title = Strings.ProductDetail.navigationTitle

        view.backgroundColor = CydColor.Common.background
        view.addSubview(webView)
        
        webView.snp.makeConstraints { $0.edges.equalTo(view.safeAreaLayoutGuide) }
    }

    private func loadProductLink() {
        guard let url = URL(string: viewModel.product.linkUrl) else {
            // 에러 처리
            return
        }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
