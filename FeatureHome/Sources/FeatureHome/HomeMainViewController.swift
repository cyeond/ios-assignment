// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import CydCore
import CydDesignSystem

final class HomeMainViewController: UIViewController {
    private let viewModel: HomeMainViewModel
    
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
    }

    private func setupViews() {
        navigationItem.title = Strings.Home.navigationTitle
        navigationItem.backButtonTitle = ""
        view.backgroundColor = CydColor.Common.background
    }
}
