//
//  OnBoardingSizeView.swift
//  goormthon
//
//  Created by dasoya on 2/28/24.
//

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
        NavigationView {
            VStack(alignment: .leading,spacing: 0){
                HStack{
                    Text("\(viewModel.user.petName)의\n크기를 알려주세요! 🦮")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.gray500)
                        .padding(.leading,16)
                        .padding(.top,34)
                    
                    Spacer()
                }
                
                
                //1
                HStack(alignment: .center){
                    
                    Button(){
                        self.isFirstButtonActive = true // 버튼 상태 토글
                        // 다른 버튼 비활성화
                        self.isSecondButtonActive = false
                        self.isThirdButtonActive = false
                        self.viewModel.user.petSize = "대형견"
          
                    }
                    label :
                    {
                        HStack{
                            
                            Image(!self.isFirstButtonActive ?  "L" : "Lwhite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                                .padding(.leading,12)
                                .padding(.vertical,8)
                                .animation(nil)
                            
                            
                            VStack(alignment: .leading){
                                
                                Text("대형견")
                                    .frame(alignment: .leading)
                                    .font(.title2)
                                    .bold()
                                    .padding(.bottom,8)
                                    .foregroundStyle(self.isFirstButtonActive ?  .white : .gray500)
                                    .animation(nil)
                                
                                Text("성견 기준 25kg 이상")
                                    .font(.body)
                                    .foregroundStyle(.gray200)
                            }
                            .padding(.leading,12)
                            .padding(.vertical,29)
                            Spacer()
                        }
                        
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(!self.isFirstButtonActive ? .beigie100 : .yellow300)
                            .frame(width: 360,height: 116)
                            .shadow(radius:  self.isFirstButtonActive ? 4 : 0, x: 0, y:self.isFirstButtonActive ? 4 : 0)
                        
                    }
                    .frame(width: 360,height: 116)
                    .padding(.leading,16)
                    
                }.padding(.bottom,16)
                    .padding(.top,50)
                
                //2
                HStack(alignment: .center){
                    
                    Button(){
                        self.isSecondButtonActive = true // 버튼 상태 토글
                        // 다른 버튼 비활성화
                        self.isFirstButtonActive = false
                        self.isThirdButtonActive = false
                        self.viewModel.user.petSize = "중형견"

                    }
                    label :
                    {
                        HStack{
                            
                            Image(!self.isSecondButtonActive ?  "M" : "Mwhite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100,height: 100)
                                .padding(.leading,12)
                                .padding(.vertical,8)
                                .animation(nil)
                            
                            
                            VStack(alignment: .leading){
                                
                                Text("중형견(스텐다드)")
                                    .frame(alignment: .leading)
                                    .font(.title2)
                                    .bold()
                                    .padding(.bottom,8)
                                    .foregroundStyle(self.isSecondButtonActive ?  .white : .gray500)
                                    .animation(nil)
                                
                                Text("성견 기준 10kg~25kg 미만")
                                    .font(.body)
                                    .foregroundStyle(.gray200)
                            }
                            .padding(.leading,12)
                            .padding(.vertical,29)
                            Spacer()
                        }
                        
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(!self.isSecondButtonActive ? .beigie100 : .yellow300)
                            .frame(width: 360,height: 116)
                            .shadow(radius:  self.isSecondButtonActive ? 4 : 0, x: 0, y:self.isSecondButtonActive ? 4 : 0)
                        
                    }
                    .frame(width: 360,height: 116)
                    .padding(.leading,16)
                    .padding(.bottom,16)
                }
                
                //3
                HStack(alignment: .center){
                    
                    Button(){
                        self.isThirdButtonActive = true // 버튼 상태 토글
                        // 다른 버튼 비활성화
                        self.isSecondButtonActive = false
                        self.isFirstButtonActive = false
                        self.viewModel.user.petSize = "소형견"
           
                    }
                    label :
                    {
                        HStack{
                            
                            Image(!self.isThirdButtonActive ?  "S" : "Swhite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                                .padding(.leading,12)
                                .padding(.vertical,8)
                                .animation(nil)
                            
                            
                            VStack(alignment: .leading){
                                
                                Text("소형견")
                                    .frame(alignment: .leading)
                                    .font(.title2)
                                    .bold()
                                    .padding(.bottom,8)
                                    .foregroundStyle(self.isThirdButtonActive ?  .white : .gray500)
                                    .animation(nil)
                                
                                Text("성견 기준 10kg 미만")
                                    .font(.body)
                                    .foregroundStyle(.gray200)
                            }
                            .padding(.leading,12)
                            .padding(.vertical,29)
                            Spacer()
                        }
                        
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(!self.isThirdButtonActive ? .beigie100 : .yellow300)
                            .frame(width: 360,height: 116)
                            .shadow(radius: self.isThirdButtonActive ? 4 : 0, x: 0, y:self.isThirdButtonActive ? 4 : 0)
                        
                    }
                    .frame(width: 360,height: 116)
                    .padding(.leading,16)
                    .padding(.bottom,50)
                }
                
                Spacer()
                
                HStack(alignment: .center){
                    NavigationLink(destination: OnBoardingAgeView(),isActive:$isDestinationActive) {
                        Button(){
                            
                            if(viewModel.user.petSize  != ""){
                                isDestinationActive = true
                            }
                        }
                        label :
                        {       Text("다음")
                                .font(.headline)
                                .foregroundStyle(viewModel.user.petSize != "" ? .white : .gray300)
                        }
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(viewModel.user.petSize  != "" ? .yellow300 : .yellow50)
                                .frame(width: 360,height: 42)
                                .shadow(radius:  4, x: 0, y:viewModel.user.petSize  != "" ? 4 : 0)
                            
                        }
                        .frame(width: 360,height: 42)
                        .padding(.leading,16)
                        .padding(.bottom,50)
               
                     
                    }
                }
                
            }
            
        }}
}

#Preview {
    OnBoardingSizeView(viewModel: UserViewModel(user: User(petName: "또리", petSize: "", petAge: "", petPersonality: "", tripConcept: "")))
}
