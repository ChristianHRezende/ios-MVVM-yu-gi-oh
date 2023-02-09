import Foundation

enum CustomError {
    case noConnection, noData
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noConnection: return "No internet connection"
        case .noData: return "Well, weird thing happens"
        }
    }
}
