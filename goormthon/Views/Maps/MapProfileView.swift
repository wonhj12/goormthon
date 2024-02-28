import SwiftUI

struct MapProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("활발하고 뛰어노는걸 좋아하는\nUsername를 위한 여행 코스🍊")
                .foregroundStyle(.gray500)
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        .frame(width: 360, height: 66)
        .background(.white)
        .opacity(0.8)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    MapProfileView()
}
