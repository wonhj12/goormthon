import SwiftUI

struct LoadingView: View {
    @ObservedObject var viewModel : UserViewModel
    @State private var isDestinationActive: Bool = false
    
    let state: Int
    
    init(viewModel: UserViewModel, state: Int) {
        self.viewModel = viewModel
        self.state = state
    }
    
    var body: some View {
        ZStack {
            Image("MapBG")
                .resizable()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Color.gray500.opacity(0.5)
            
            VStack(alignment: .center) {
                Image("LoadingDog")
            
                // 해시태그
                if (state == 2) {
                    HStack(spacing: 6) {
                        ForEach(viewModel.user.tags.extractKeywords(), id: \.self) { hashTag in
                            Text(hashTag)
                                .foregroundStyle(.gray200)
                                .font(.footnote.bold())
                                .frame(height: 34)
                                .padding(.horizontal)
                                .background {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundStyle(.yellow300)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                // 문구
                Text(state == 2 ? "인공지능이 \(viewModel.user.petName)과 어울리는\n여행지를 고르고 있어요!" : "인공지능이 \(viewModel.user.petName)의 성격을 파악하고 있어요!")
                    .font(.body.bold())
                    .foregroundStyle(.white)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                isDestinationActive = true
            }
        }
        .navigationDestination(isPresented: $isDestinationActive) {
            if (state == 1) {
                HomeView(viewModel: viewModel)
            } else {
                MapView(viewModel: viewModel)
            }
        }
        .toolbar(.hidden)
    }
}

#Preview {
    LoadingView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "2", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견 #활발한 #뛰는걸 좋아하는")), state: 1)
}
