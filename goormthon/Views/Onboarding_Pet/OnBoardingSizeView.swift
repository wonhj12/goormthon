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
    
    @State private var petName = ""
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("\(viewModel.user.petName)의\n크기를 알려주세요! 🦮")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top,34)
                
                Spacer()
            }
            
            Spacer()
            
            HStack(alignment: .center){
                
                Button(){
                    self.isFirstButtonActive.toggle() // 버튼 상태 토글
                    // 다른 버튼 비활성화
                    self.isSecondButtonActive = false
                    self.isThirdButtonActive = false
                }
                label :
                {
                    HStack{
                        
                        Image(self.isFirstButtonActive ?  "L" : "Lwhite")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                            .foregroundStyle(self.isFirstButtonActive ? .clear : .white)
                            .padding(.leading,12)
                            .padding(.vertical,8)
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("대형견")
                                .frame(alignment: .leading)
                                .font(.title2)
                                .bold()
                                .padding(.bottom,8)
                                .foregroundStyle(self.isFirstButtonActive ? .gray500 : .white)
                            
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
                        .foregroundColor(self.isFirstButtonActive ? .beige100 : .yellow300)
                        .frame(width: 360,height: 116)
                        .shadow(radius:  4, x: 0, y:self.isFirstButtonActive ? 4 : 0)
                    
                }
                .frame(width: 360,height: 116)
                .padding(.leading,16)
                .padding(.bottom,50)
            }
            
            
        }
        
    }
}

#Preview {
    OnBoardingSizeView(viewModel: UserViewModel(user: User(petName: "또리", petSize: "", petAge: "", petPersonality: "", tripConcept: "")))
}
