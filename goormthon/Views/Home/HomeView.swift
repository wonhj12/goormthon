import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: UserViewModel
    @State private var createTrip: Bool = false
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            // 배경 이미지
            Image("Background")
                .resizable()
                .frame(height: 300)
                .ignoresSafeArea()
                .padding(.bottom, 32)
            
            // 제목
            Text("\(viewModel.user.petName)와 함께하는\n즐거운 제주여행! 🍊")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2.bold())
                .foregroundStyle(.gray500)
                .padding(.horizontal, 16)
            
            // 버튼
            HStack(alignment: .center) {
                Button() {
                    createTrip = true
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.white)
                        
                        Text("새로운 여행 일정 생성하기")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(viewModel.user.petAge  != "" ? .yellow300 : .yellow50)
                        .frame(width: 360,height: 52)
                        .shadow(radius:  4, x: 0, y:viewModel.user.petAge  != "" ? 4 : 0)
                }
                .frame(width: 360,height: 52)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 44, trailing: 0))
            }
            
            // AI 추천
            Text("AI 추천 장소")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            List {
                ForEach(LocationData.locations) { location in
                    RecommendTileView(location: location)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationDestination(isPresented: $createTrip) {
            DatePickView(viewModel: viewModel)
        }
        .toolbar(.hidden)
    }
}

#Preview {
    HomeView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "2", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")))
}
