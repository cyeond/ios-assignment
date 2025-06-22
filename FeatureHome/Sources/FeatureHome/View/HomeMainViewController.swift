// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import RxSwift
import SnapKit
import CydCore
import CydDesignSystem
import CydDomain

final class HomeMainViewController: UIViewController {
    private let viewModel: HomeMainViewModel
    private var productListCollectionViewDataSource: UICollectionViewDiffableDataSource<ProductListSection, ProductListItem>?
    private let disposeBag = DisposeBag()

    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    private lazy var productListCollectionView: UICollectionView = {
        let layout = createProductListLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(ProductListItemCell.self, forCellWithReuseIdentifier: ProductListItemCell.reuseIdentifier)
        return collectionView
    }()
    
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
        setupCollectionViewDataSource()
        bind()
        loadProductList()
    }

    private func setupViews() {
        navigationItem.title = Strings.Home.navigationTitle
        navigationItem.backButtonTitle = ""
        
        view.backgroundColor = CydColor.Common.background
        view.addSubview(productListCollectionView)
        view.addSubview(activityIndicator)
        
        productListCollectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
        activityIndicator.snp.makeConstraints { $0.center.equalToSuperview() }
    }
    
    private func bind() {
        viewModel.productList
            .observe(on: MainScheduler.instance)
            .map { products in
                products.map { ProductListItem(product: $0) }
            }
            .subscribe(onNext: { [weak self] items in
                var snapshot = NSDiffableDataSourceSnapshot<ProductListSection, ProductListItem>()
                snapshot.appendSections([.main])
                snapshot.appendItems(items, toSection: .main)
                self?.productListCollectionViewDataSource?.apply(snapshot, animatingDifferences: true)
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

//MARK: - CollectionView Layout
extension HomeMainViewController {
    private func createProductListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .estimated(300)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(300)
        )
            
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

        return UICollectionViewCompositionalLayout(section: section)
    }
}

//MARK: - CollectionView DataSource
extension HomeMainViewController {
    private func setupCollectionViewDataSource() {
        productListCollectionViewDataSource = UICollectionViewDiffableDataSource<ProductListSection, ProductListItem>(collectionView: productListCollectionView) { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductListItemCell.reuseIdentifier, for: indexPath
            ) as? ProductListItemCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: item)
            return cell
        }
    }
}
