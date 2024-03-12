import SwiftUI

struct OnBoardingSizeView: View {
    @ObservedObject var viewModel : UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var isFirstButtonActive = false
    @State private var isSecondButtonActive = false
    @State private var isThirdButtonActive = false
    @State private var isDestinationActive : Bool = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            Text("\(viewModel.user.petName)의\n크기를 알려주세요! 🦮")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray500)
                .padding(EdgeInsets(top: 34, leading: 16, bottom: 0, trailing: 16))
            
            //1
            Button(){
                self.isFirstButtonActive = true // 버튼 상태 토글
                // 다른 버튼 비활성화
                self.isSecondButtonActive = false
                self.isThirdButtonActive = false
                self.viewModel.user.petSize = "Large"
            } label: {
                HStack {
                    Image(!self.isFirstButtonActive ?  "L" : "Lwhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                        .padding(.leading, 12)
                        .padding(.vertical, 8)
                        .animation(nil, value: UUID())
                    
                    VStack(alignment: .leading) {
                        Text("대형견")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .padding(.bottom, 8)
                            .foregroundStyle(self.isFirstButtonActive ?  .white : .gray500)
                            .animation(nil, value: UUID())
                        
                        Text("성견 기준 25kg 이상")
                            .font(.body)
                            .foregroundStyle(.gray200)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(nil, value: UUID())
                    }
                }
            }
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(!self.isFirstButtonActive ? .beigie100 : .yellow300)
                    .frame(width: 360, height: 116)
                    .shadow(radius: self.isFirstButtonActive ? 4 : 0, x: 0, y: self.isFirstButtonActive ? 4 : 0)
            }
            .frame(width: 360,height: 116)
            .padding(EdgeInsets(top: 50, leading: 16, bottom: 0, trailing: 16))
            
            //2
            Button(){
                self.isSecondButtonActive = true // 버튼 상태 토글
                // 다른 버튼 비활성화
                self.isFirstButtonActive = false
                self.isThirdButtonActive = false
                self.viewModel.user.petSize = "Medium"
            } label: {
                HStack {
                    Image(!self.isSecondButtonActive ?  "M" : "Mwhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100,height: 100)
                        .padding(.leading, 12)
                        .padding(.vertical, 8)
                        .animation(.none, value: 0)
                    
                    VStack(alignment: .leading) {
                        Text("중형견(스텐다드)")
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                            .foregroundStyle(self.isSecondButtonActive ?  .white : .gray500)
                            .animation(nil, value: UUID())
                        
                        Text("성견 기준 10kg~25kg 미만")
                            .font(.body)
                            .foregroundStyle(.gray200)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(nil, value: UUID())
                    }
                }
            }
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360, height: 116)
                    .foregroundColor(!self.isSecondButtonActive ? .beigie100 : .yellow300)
                    .shadow(radius:  self.isSecondButtonActive ? 4 : 0, x: 0, y:self.isSecondButtonActive ? 4 : 0)
                
            }
            .frame(width: 360,height: 116)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            
            //3
            Button(){
                self.isThirdButtonActive = true // 버튼 상태 토글
                // 다른 버튼 비활성화
                self.isSecondButtonActive = false
                self.isFirstButtonActive = false
                self.viewModel.user.petSize = "Small"
            } label: {
                HStack {
                    Image(!self.isThirdButtonActive ?  "S" : "Swhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .padding(.leading, 12)
                        .padding(.vertical, 8)
                        .animation(nil, value: UUID())
                    
                    VStack(alignment: .leading) {
                        Text("소형견")
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                            .foregroundStyle(self.isThirdButtonActive ? .white : .gray500)
                            .animation(nil, value: UUID())
                        
                        Text("성견 기준 10kg 미만")
                            .font(.body)
                            .foregroundStyle(.gray200)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(nil, value: UUID())
                    }
                }
            }
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360, height: 116)
                    .foregroundColor(!self.isThirdButtonActive ? .beigie100 : .yellow300)
                    .shadow(radius: self.isThirdButtonActive ? 4 : 0, x: 0, y: self.isThirdButtonActive ? 4 : 0)
                
            }
            .frame(width: 360, height: 116)
            .padding(.horizontal, 16)
            
            Spacer()
            
            Button() {
                isDestinationActive = viewModel.user.petSize  != ""
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(viewModel.user.petSize != "" ? .yellow300 : .yellow50)
                    .frame(width: 360, height: 52)
                    .shadow(radius: viewModel.user.petSize != "" ? 4 : 0, x: 0, y: viewModel.user.petSize != "" ? 4 : 0)
                    .overlay {
                        Text("다음")
                            .foregroundStyle(viewModel.user.petSize != "" ? .white : .gray300)
                    }
            }
            .frame(width: 360, height: 52)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 50, trailing: 16))
        }
        .navigationDestination(isPresented: $isDestinationActive) {
            OnBoardingAgeView(viewModel: viewModel)
        }
    }
}

#Preview {
    OnBoardingSizeView(viewModel: UserViewModel(user: User(petName: "또리", petSize: "", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")))
}
