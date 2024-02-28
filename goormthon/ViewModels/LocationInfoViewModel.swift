
import Foundation
import UIKit
import SwiftUI

struct LocationInfo : Identifiable {
    
    let id: Int?
    let name: String
    let imageURL: URL?
    var image: Image?
  
}

extension LocationInfo: Decodable {
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case imageURL = "img"
     
    }
}



class LocationInfoDataModel: ObservableObject {
    @Published var info : LocationInfo = LocationInfo(id: 0, name: "Null", imageURL: URL(string: "https://picsum.photos/id/12/200"))
    @Published var isLoading = false

    private var infoRequest: APIRequest<InfoResource>?
    private var imageRequest: ImageRequest?

    init(info: LocationInfo) {
        self.info = info
    }
    
    init() {

    }

    func loadInfo() {
        guard !isLoading else { return }
        isLoading = true
        let resource = InfoResource(id: info.id)
        let request = APIRequest(resource: resource)
        self.infoRequest = request
        request.execute { [weak self] infos in
            guard let info = infos?.first else { return }
            //self?.info = info.body
            self?.loadLocationImage()
        }
    }
    
    func fetchInfo(){
        guard !isLoading else { return }
        isLoading = true
        
        requestAPI{[weak self] info in
            guard let infoModel = info else { return}
            
            self?.info = infoModel
            self?.loadLocationImage()
    
        }
        
    }
    
    func requestAPI(compilationHandler: @escaping (LocationInfo?) -> Void){
            guard let url:URL = URL(string: "https://picsum.photos/id/12/200") else {
                   return
               }
        
               var urlReq:URLRequest = URLRequest.init(url: url)
               
               urlReq.httpMethod = "GET"
               
               let Task = URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
                   
                   guard error == nil else {
                       print("Error: error calling GET")
                       print(error!)
                       return
                   }
                   guard let data = data else {
                       print("Error: Did not receive data")
                       return
                   }
                   guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                       print("Error: HTTP request failed")
                       print(url.description)
                       return
                   }
                   guard let output = try? JSONDecoder().decode(LocationInfo.self, from: data) else {
                       print("Error: JSON Data Parsing failed")
                       let str = String(decoding: data, as: UTF8.self)
                       print("data: "+str)
                       return
                       
                   }
                       
                   DispatchQueue.main.async {
                       compilationHandler(output)
                   }
                   
               }
               
               Task.resume()
    }
}

extension LocationInfoDataModel {
    func loadLocationImage() {

        guard let url = info.imageURL else { return }
        let imageRequest = ImageRequest(url: url) //url
        
        
        self.imageRequest = imageRequest
        imageRequest.execute { [weak self] image in
            self?.info.image = image
            self?.isLoading = false
        }
    }
}
