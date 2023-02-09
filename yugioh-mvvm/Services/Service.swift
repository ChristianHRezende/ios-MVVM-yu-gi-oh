import Foundation

let baseURL = "https://db.ygoprodeck.com/api/v7"

enum EndPoint {
    case cardList
    
    var path: String{
        switch self {
        case .cardList: return "/cardinfo.php"
        }
    }
    var url: String {
        switch self {
        case .cardList: return "\(baseURL)\(path)"
//        default: return ":"
        }
    }
}
