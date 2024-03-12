import SwiftUI

struct RecommendTileView: View {
    let location: Location
    
    let baseURLString = ""
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.beigie100)
                .frame(width: 360,height: 95)
            
            HStack {
                if let imageName = location.imageName {
                    AsyncImage(url: URL(string: imageName), scale: 3) { phase in
                        switch phase {
                        case .empty:
                            ZStack {
                                Color.gray
                                ProgressView()
                            }
                        case .success(let image):
                            image.resizable()
                        case .failure(let error):
                            Text(error.localizedDescription)
                            // use placeholder for production app
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .clipShape(Circle())
                    .frame(width: 64,height: 64)
                    .aspectRatio(contentMode: .fill)
                } else {
                    Circle()
                        .foregroundStyle(.gray100)
                        .frame(width: 64, height: 64)
                }
                
                VStack(alignment: .leading) {
                    // 제목
                    Text(location.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray500)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // 도시
                    Text(location.locationType)
                        .font(.subheadline)
                        .foregroundStyle(.gray400)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // 해시태그
                    HStack {
                        ForEach(location.hashTags.extractKeywords(), id: \.self) { hashTag in
                            Text(hashTag)
                                .font(.caption2)
                                .frame(height: 20)
                                .foregroundStyle(.gray300)
                                .padding(.horizontal)
                                .background {
                                    RoundedRectangle(cornerRadius: 100)
                                        .foregroundStyle(.beigie300)
                                    
                                }
                        }
                    }
                }
                .padding(.vertical, 6)
            }
            .padding()
        }
        .frame(width: 360, height: 95)
    }
}

#Preview {
    RecommendTileView(location: LocationData.allLocations.first!)
}
