// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import WebKit
import SnapKit
import CydCore
import CydDesignSystem

final class ProductDetailViewController: UIViewController {
    private let viewModel: ProductDetailViewModel
    
    let webView: WKWebView = {
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
        guard let url = URL(string: viewModel.linkUrl) else {
            let alert = UIAlertController(title: Strings.Common.errorAlertTitle, message: Strings.ProductDetail.urlErrorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Strings.Common.confirm, style: .default))
            present(alert, animated: true)
            return
        }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
