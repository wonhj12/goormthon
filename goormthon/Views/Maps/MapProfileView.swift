import SwiftUI

struct MapProfileView: View {
    @ObservedObject var viewModel : UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("활발하고 뛰어노는걸 좋아하는\n\(viewModel.user.petName)를 위한 여행 코스🍊")
                .foregroundStyle(.gray500)
                .font(.callout)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        .frame(width: 360, height: 66)
        .background(.white)
        .opacity(0.8)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    MapProfileView(viewModel: UserViewModel(user: User(petName: "또리", petSize: "", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")))
}
