
import Foundation

enum Types: Int, CaseIterable {
    case all
    case monsters
    case spell
    case trap
    
    var name: String {
        switch self {
        case .all: return "All"
        case .monsters: return "Monsters"
        case .spell: return "Spell"
        case .trap: return "Trap"
        }
    }
}
