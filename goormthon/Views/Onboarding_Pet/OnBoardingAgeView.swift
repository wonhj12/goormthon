import SwiftUI

struct OnBoardingAgeView: View {
    @ObservedObject var viewModel : UserViewModel
    @FocusState private var focused: Bool
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var isFirstButtonActive = false
    @State private var isDestinationActive : Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("우리 \(viewModel.user.petName)는\n몇 살 인가요?🐶")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray500)
                .padding(EdgeInsets(top: 34, leading: 16, bottom: 0, trailing: 16))
                .onAppear{
                    viewModel.user.petAge = String(3)
                }
            
            // 나이
            Button() {
            } label: {
                HStack(alignment: .bottom) {
                    TextField("", text: $viewModel.user.petAge)
                        .focused($focused)
                        .font(.system(size: 91))
                        .bold()
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: 120)
                        .onReceive(viewModel.user.petAge.publisher.collect()) { newValue in
                            let filtered = String(newValue.prefix(2))
                            if filtered != self.viewModel.user.petAge {
                                self.viewModel.user.petAge = filtered
                            }
                        }
                        .padding(-10)
                        .padding(.leading,-20)
                    
                    Text("살")
                        .frame(alignment: .leading)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding(.bottom,8)
                }
                .padding(EdgeInsets(top: 80, leading: 136, bottom: 0, trailing: 0))
            }
            
            Spacer()
            
            Button() {
                isDestinationActive = viewModel.user.petAge  != ""
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(viewModel.user.petAge != "" ? .yellow300 : .yellow50)
                    .frame(width: 360, height: 52)
                    .shadow(radius: viewModel.user.petAge != "" ? 4 : 0, x: 0, y: viewModel.user.petAge != "" ? 4 : 0)
                    .overlay {
                        Text("다음")
                            .foregroundStyle(viewModel.user.petAge != "" ? .white : .gray300)
                    }
            }
            .frame(width: 360, height: 52)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 50, trailing: 16))
        }
        .navigationDestination(isPresented: $isDestinationActive) {
            OnBoardingPersonalView(viewModel: viewModel)
        }
        .onAppear {
            focused = true
        }
    }
}


#Preview {
    OnBoardingAgeView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "2", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")))
}
