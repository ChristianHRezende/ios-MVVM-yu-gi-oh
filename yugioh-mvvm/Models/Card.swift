import Foundation

struct Card : Codable{
    let id: Int
    let name: String
    let type: String
    let desc: String
    let cardImages: [CardImage]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case desc = "desc"
        case cardImages = "card_images"
    }
}
