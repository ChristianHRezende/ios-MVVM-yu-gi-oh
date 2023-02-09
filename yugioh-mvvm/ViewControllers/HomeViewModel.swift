
import Foundation


final class HomeViewModel {
    weak var delegate: RequestDelegate?
    
    private var state: ViewState {
        didSet{
            self.delegate?.didUpdate(with: state)
        }
    }
    
    private var cards: [Card] = []
    private var filteredCards: [Card] = []
    private var selectedType: Types = .all {
        didSet {
            self.filterData()
        }
    }
    
    init() {
        self.state = .idle
    }
}

// MARK: Data Source

extension HomeViewModel {
    var numberOfItems: Int {
        filteredCards.count
    }
    
    func getInfo(for indexPath:IndexPath) -> (name:String,
                                              type: String,
                                              desc: String,
                                              imageUrl:String?){
        let card =  filteredCards[indexPath.row]
        return (name: card.name, type:card.type, desc: card.desc, imageUrl: card.cardImages.first?.imageURL)
    }
}

// MARK: Service
extension HomeViewModel {
    func loadData() {
        self.state = .loading
        CardService.getAllCards{result in
            switch result {
            case let .success(cards):
                self.cards = cards
                self.filteredCards = cards
                self.state = .success
            case let .failure(error):
                self.cards = []
                self.filteredCards = []
                self.state = .error(error)
            }
        }
    }
    
    func filterByType(type:Types) {
        self.selectedType = type
    }
    
    func selectedTypeName() -> String {
        self.selectedType.name
    }
}

// MARK: Filter Data

private extension HomeViewModel {
    func filterData() {
        guard selectedType != .all else {
            self.filteredCards = cards
            self.state = .success
            return
        }
        
        guard selectedType != .monsters else {
            self.filteredCards = self.cards.filter{
                !$0.type.lowercased().contains(Types.spell.name.lowercased()) &&
                !$0.type.lowercased().contains(Types.trap.name.lowercased())
            }
            self.state = .success
            return
        }
        
        self.filteredCards = self.cards.filter{
            $0.type.lowercased().contains(self.selectedType.name.lowercased())
        }
        self.state = .success
    }
}
