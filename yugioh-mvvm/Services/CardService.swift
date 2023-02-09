import Foundation
import SystemConfiguration

final class CardService {
    static func getAllCards(completion: @escaping (Result<[Card],Error>)-> Void) {
        guard let url = URL(string: EndPoint.cardList.url) else {
            completion(.failure((CustomError.noConnection)))
            return
        }
        
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(#function, "Request: \(request)\nError: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.noData))
                return
            }
            print("data", data)

            do {
                let cards  =  try JSONDecoder().decode(CardResponse.self, from: data)
                completion(.success(cards.data))
            } catch let error {

                print(#function, "Request: \(request)\nError: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
}
