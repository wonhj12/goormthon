import SwiftUI

struct MarkerView: View {
    let num: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "\(num).circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(.yellow400)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow400)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 50)
            
        }
    }
}

#Preview {
    MarkerView(num: 1)
}
