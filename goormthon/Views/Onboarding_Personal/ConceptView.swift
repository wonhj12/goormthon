import SwiftUI

struct ConceptView: View {
    @FocusState private var focused: Bool
    @State private var text: String = ""
    
    private let placeholder = "예시 문장)\n똘이의 생일이라서 더 특별 했으면 좋겠다.\n똘이와 자연 속에서 힐링하고 싶어요.\n실내 여행지만 다니고 싶어요."
    
    @ObservedObject var viewModel : UserViewModel
    
    init(viewModel: UserViewModel, reload: Bool) {
        self.viewModel = viewModel
        self.reload = reload
    }
    
    var reload: Bool = false
    
    @State private var isDestinationActive: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            // 타이틀
            HStack{
                Text("\(viewModel.user.petName)와\n함께하고 싶은 여행은?😎")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top,34)
                    .fixedSize()
                
                Spacer()
            }
            
            HStack{
                Text(reload ? "원하는 여행에 대해서 더 자세히 알려주세요!" : "AI 가 조금 더 컨셉에 맞게 추천해드려요!")
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top, 50)
                
                Spacer()
            }
            
            ZStack(alignment: .topLeading) {
                // Texteditor
                TextEditor(text: $text)
                    .background(Color.beigie100)
                    .cornerRadius(10.0)
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                    .focused($focused)
                
                
                // placeholder
                if (text.isEmpty) {
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
                isDestinationActive = text != ""
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(text != "" ? .yellow300 : .yellow50)
                    .frame(width: 360, height: 52)
                    .shadow(radius: text != "" ? 4 : 0, x: 0, y: text != "" ? 4 : 0)
                    .overlay {
                        Text(reload ? "다시 여행지 추천 받기" : "여행지 추천 받기")
                            .foregroundStyle(.white)
                    }
            }
            .frame(width: 360, height: 52)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 50, trailing: 16))
        }
        .navigationDestination(isPresented: $isDestinationActive) {
            LoadingView(viewModel: viewModel, state: 2)
        }
    }
}

#Preview {
    ConceptView(viewModel: UserViewModel(user: User(petName: "또리", petSize: "", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")), reload: false)
}
