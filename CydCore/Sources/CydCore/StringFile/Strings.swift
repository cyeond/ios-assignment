// The Swift Programming Language
// https://docs.swift.org/swift-book

// MARK: - Common Strings
public extension Strings {
    enum Common {
        public static let errorAlertTitle = "에러"
        public static let confirm = "확인"
    }
}

// MARK: - For Main Target
public enum Strings {
    public enum Main {
        public static let homeTabTitle = "홈"
    }
}

// MARK: - For FeatureHome
public extension Strings {
    enum Home {
        public static let navigationTitle = "상품"
        public static let currencyWon = "원"
        public static let discountPriceFormat = "%d%% %d원"
        public static let ratingFormat = "★%.1f점"
        public static let reviewCountFormat = "%d건"
        public static let ratingReviewCountFormat = "★%.1f점 %d건"
    }
}

// MARK: - Common Strings
public extension Strings {
    enum ProductDetail {
        public static let navigationTitle = "상품 상세"
        public static let urlErrorMessage = "URL 불러오기에 실패하였습니다."
    }
}
