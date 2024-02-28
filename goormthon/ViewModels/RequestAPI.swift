
import Foundation

// MARK: - Results
struct Results: Decodable {
    let infos: [Info]
}

// MARK: - Info
struct Info: Decodable, Hashable{
    let name: String
    let url: String
    let urlToImage: String?
}


class RequestAPI: ObservableObject {
    static let shared = RequestAPI()
    private init() { }
    @Published var posts = [Info]()
    
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    func fetchData(){
        
        guard let apiKey = apiKey else { return }
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=\(apiKey)") else{
            return
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                self.posts = []
                return
            }
            guard let data = data else{
                return
            }
            do{
                let apiResponse = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.posts = apiResponse.infos
                }
            }catch(let err){
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
}
