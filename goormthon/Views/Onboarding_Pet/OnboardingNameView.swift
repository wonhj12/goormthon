import SwiftUI

struct OnboardingNameView: View {
    @ObservedObject var viewModel : UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var isDestinationActive: Bool = false
    @State private var petName = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("제주로 함께\n떠나볼까요? 🐾")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray500)
                .padding(EdgeInsets(top: 34, leading: 16, bottom: 0, trailing: 16))
            
            Text("여행에 함께 할 반려가족의 이름을 알려주세요.")
                .font(.footnote)
                .foregroundStyle(.gray500)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 50, leading: 16, bottom: 0, trailing: 16))
            
            TextField("반려 가족의 이름", text: $viewModel.user.petName)
                .padding()
                .background(.beigie200)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 16)
            
            Spacer()
            
            Button() {
                isDestinationActive = viewModel.user.petName != ""
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(viewModel.user.petName != "" ? .yellow300 : .yellow50)
                    .frame(width: 360, height: 52)
                    .shadow(radius: viewModel.user.petName != "" ? 4 : 0, x: 0, y: viewModel.user.petName != "" ? 4 : 0)
                    .overlay {
                        Text("다음")
                            .foregroundStyle(viewModel.user.petName != "" ? .white : .gray300)
                    }
            }
            .frame(width: 360, height: 52)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 50, trailing: 16))
        }
        .navigationDestination(isPresented: $isDestinationActive) {
            OnBoardingSizeView(viewModel: viewModel)
        }
    }
    
}

#Preview {
    OnboardingNameView(viewModel: UserViewModel(user: User(petName: "", petSize: "", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")))
}
