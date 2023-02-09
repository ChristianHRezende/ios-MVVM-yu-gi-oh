import Foundation


struct CardImage:Codable {
    let id:Int
    let imageURL:String
    let imageURLSmall:String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
    }
}
