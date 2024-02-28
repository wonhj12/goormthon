import SwiftUI

struct LocationInfoView: View {
    
    //@StateObject private var dataModel = LocationInfoDataModel()
    @StateObject private var network = RequestAPI.shared
    
//    
//    let baseURLString = "https://picsum.photos/id/12/"
//
//      @Environment(\.displayScale) var scale
//      let size: CGFloat = 200
//      var urlString: String {
//          baseURLString + "\(Int(size * scale))"
//      }

    
    var body: some View {
     
        NavigationView{
                    List{
                        ForEach($network.posts, id: \.self) { $result in
                            HStack{
                                URLImage(urlString: result.urlToImage)
                                    .frame(width: 130, height: 70)
                                    .background(Color.gray)
                                Text(result.title)
                                    .bold()
                            }.padding(3)
                        }
                    }.navigationTitle("INFO")
                }.onAppear {
                    network.fetchData()
                }
    }
}

#Preview {
    LocationInfoView()
}


extension Image {

    public init(data: Data?, placeholder: String) {
        guard let data = data,
          let uiImage = UIImage(data: data) else {
            self = Image(placeholder)
            return
        }
        self = Image(uiImage: uiImage)
    }
}

struct URLImage: View {
    let urlString: String?
    @State var data: Data?

    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.white)
        } else {
            Image("")
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchImageData()
                }
        }
    }
    
    private func fetchImageData(){
        guard let urlString = urlString else{
            return
        }
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
