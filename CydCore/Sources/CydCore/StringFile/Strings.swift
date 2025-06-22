// The Swift Programming Language
// https://docs.swift.org/swift-book

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
    }
}

// MARK: - Common Strings
public extension Strings {
    enum Common {
        public static let errorAlertTitle = "에러"
        public static let confirm = "확인"
    }
}
