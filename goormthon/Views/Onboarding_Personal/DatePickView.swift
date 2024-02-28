import SwiftUI

struct DatePickView: View {
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    
    @State private var showStart: Bool = false
    @State private var showEnd: Bool = false
    
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
                    .fixedSize()
                
                Spacer()
            }
            
            
            HStack{
                Text("여행 일정을 입력해 주세요.")
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top, 8)
                
                Spacer()
            }
        
            // 일정
            VStack {
                DatePicker("여행 시작일", selection: $startDate, in: Date()..., displayedComponents: .date)
                    .onTapGesture {
                        withAnimation {
                            if (showEnd) { showEnd = false }
                            showStart.toggle()
                        }
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                
                Divider()
                    .padding(.leading, 16)
                
                if (showStart) {
                    DatePicker("", selection: $startDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 8)
                    
                    Divider()
                        .padding(.leading, 16)
                }
                
                DatePicker("여행 종료일", selection: $endDate, displayedComponents: .date)
                    .onTapGesture {
                        withAnimation {
                            if (showStart) { showStart = false }
                            showEnd.toggle()
                        }
                    }
                    .padding(.bottom, showEnd ? 0 : 8)
                    .padding(.horizontal, 16)
                
                if (showEnd) {
                    Divider()
                        .padding(.leading, 16)
                    
                    DatePicker("", selection: $endDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 8)
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.beigie100)
                
            }
            .padding(.horizontal)

            HStack{
                Text("AI가 여행지의 운영일을 고려해서 일정을 짜줘요!")
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                
                Spacer()
            }

            Spacer()
            
            HStack(alignment: .center) {
                Button(){
                    
                }
                label :
                {       Text("다음")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.yellow300)
                        .frame(width: 360,height: 42)
                        .shadow(radius: 4, x: 0, y: 4)
                    
                }
                .frame(width: 360,height: 42)
                .padding(.leading,16)
                .padding(.bottom,50)
            }
        }
    }
}

#Preview {
    DatePickView()
}
