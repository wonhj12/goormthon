import SwiftUI

struct OnBoardingPersonalView: View {
    
    @ObservedObject var viewModel : UserViewModel
    @FocusState private var focused: Bool
    @State private var isDestinationActive : Bool = false
    
    private let placeholder: String = "예시 문장)\n평소에 사람을 좋아하고 잘 따름.\n입질은 없는 편이지만 장난을 좋아해요.\n활동적인 편이라  넓은 공간을 뛰어 노는 것을 좋아합니다."
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(viewModel.user.petName)에 대해\n더 알려주세요! 👀")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray500)
                .padding(EdgeInsets(top: 34, leading: 16, bottom: 0, trailing: 16))
                .onAppear{
                    viewModel.user.petAge = String(3)
                }
            
            // 입력
            Text("AI 가 조금 더 컨셉에 맞게 추천해드려요!")
                .foregroundStyle(.gray500)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 50, leading: 16, bottom: 8, trailing: 16))
            
            ZStack(alignment: .topLeading) {
                // Texteditor
                TextEditor(text: $viewModel.user.petPersonality)
                    .background(Color.beigie100)
                    .cornerRadius(10.0)
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                    .focused($focused)
                
                
                // placeholder
                if (viewModel.user.petPersonality.isEmpty) {
                    Text(placeholder)
                        .foregroundStyle(.secondary)
                        .padding(EdgeInsets(top: 8, leading: 5, bottom: 0, trailing: 0))
                        .onTapGesture {
                            focused = true
                        }
                }
            }
            .frame(height: 200)
            .padding(.horizontal, 16)
            
            Spacer()
            
            Button() {
                isDestinationActive = viewModel.user.petPersonality != ""
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(viewModel.user.petPersonality != "" ? .yellow300 : .yellow50)
                    .frame(width: 360, height: 52)
                    .shadow(radius: viewModel.user.petPersonality != "" ? 4 : 0, x: 0, y: viewModel.user.petPersonality != "" ? 4 : 0)
                    .overlay {
                        Text("완료")
                            .foregroundStyle(viewModel.user.petPersonality != "" ? .white : .gray300)
                    }
            }
            .frame(width: 360, height: 52)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 50, trailing: 16))
        }
        .navigationDestination(isPresented: $isDestinationActive) {
            LoadingView(viewModel: viewModel, state: 1)
        }
    }
}


#Preview {
    OnBoardingPersonalView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")))
}
