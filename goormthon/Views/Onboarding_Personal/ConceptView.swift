import SwiftUI

struct ConceptView: View {
    @FocusState private var focused: Bool
    @State private var text: String = ""
    
    private let placeholder = "예시 문장)\n평소에 사람을 좋아하고 잘 따름.\n입질은 없는 편이지만 장난을 좋아해요.\n활동적인 편이라  넓은 공간을 뛰어 노는 것을 좋아합니다."
    
    var body: some View {
        VStack(alignment: .leading) {
            // 타이틀
            HStack{
                Text("이번 여행의\n컨셉이 있으신가요? 😎")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top,34)
                    .fixedSize()
                
                Spacer()
            }
            
            HStack{
                Text("AI 가 조금 더 컨셉에 맞게 추천해드려요!")
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
            
            HStack(alignment: .center) {
                Button(){
                    
                }
                label :
                {       Text("여행지 추천 받기")
                        .font(.headline)
                        .foregroundStyle(text != "" ? .white : .gray300)
                }
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(text != "" ? .yellow300 : .yellow50)
                        .frame(width: 360, height: 42)
                        .shadow(radius: 4, x: 0, y: text != "" ? 4 : 0)
                    
                }
                .frame(width: 360,height: 42)
                .padding(.leading,16)
                .padding(.bottom,50)
            }
        }
    }
}

#Preview {
    ConceptView()
}
