import SwiftUI

struct LocationPreviewView: View {
    let index: Int
    let location: Location
    
    var body: some View {
        HStack(spacing: 12) {
            if let imageName = location.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 8))
                    .padding(.horizontal)
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.gray100)
                    .padding(.leading)
            }
            
            VStack(alignment: .leading) {
                // 이름
                Text(location.name)
                    .font(.headline)
                    .foregroundStyle(.gray500)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // 종류
                Text(location.locationType)
                    .font(.footnote)
                    .foregroundStyle(.gray300)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text(location.hashTags)
                    .font(.subheadline)
                    .foregroundStyle(.gray500)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            
            Spacer()
            
            VStack {
                Image(systemName: "\(index).circle.fill")
                    .foregroundStyle(.yellow400)
                    .frame(width: 18, height: 18)
                    .padding([.trailing, .top])
                
                Spacer()
            }
        }
        .frame(width: 360, height: 126)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 10))

    }
}

#Preview {
    LocationPreviewView(index: 1, location: LocationData.locations.first!)
}
