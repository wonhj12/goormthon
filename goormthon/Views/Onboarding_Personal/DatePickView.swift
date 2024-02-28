import SwiftUI

struct DatePickView: View {
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            // 타이틀
            HStack{
                Text("여행 일정을\n등록해주세요! 🗓 ️")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top,34)
                
                Spacer()
            }
            
            //
            HStack{
                Text("여행 일정을 입력해 주세요.")
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top,51)
                
                Spacer()
            }
            
            // 일정
            Form {
                DatePicker("여행 시작일", selection: $startDate, in: Date()..., displayedComponents: .date)
                    .listRowBackground(Color.beigie100)
                DatePicker("여행 종료일", selection: $startDate, displayedComponents: .date)
                    .listRowBackground(Color.beigie100)
            }
            .tint(.yellow400)
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
            
            
        }
    }
}

#Preview {
    DatePickView()
}
