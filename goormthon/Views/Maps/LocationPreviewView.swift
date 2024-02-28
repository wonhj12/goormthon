import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                if let imageName = location.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 105)
                        .clipShape(.rect(cornerRadius: 8))
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 80, height: 105)
                        .foregroundStyle(.gray100)
                }
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    LocationPreviewView(location: LocationData.locations.first!)
}
