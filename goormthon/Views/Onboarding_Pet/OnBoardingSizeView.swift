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

    
    @State private var petName = ""
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("\(viewModel.user.petName)의 크기를 알려주세요! 🦮")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray500)
         //           .shadow(radius: 4, x: 0, y: 4)
                    .padding(.leading,16)
                    .padding(.top,34)
                
                Spacer()
            }
            
            HStack{
                Text("여행에 함께 할 반려가족의 이름을 알려주세요.")
                    .font(.footnote)
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top,51)
                    
                Spacer()
            }
            
            HStack{
                
                TextField("반려 가족의 이름", text: $viewModel.user.petName)
                    .padding(.leading ,16)
                    //.background(.beigie400)
                .background
                {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.beigie200)
                        .frame(width: 360,height: 42)
                        .font(.footnote)
                     
                
                }
                
                .padding(.top,8)
                
                    
                Spacer()
            }
            
            Spacer()
            HStack(alignment: .center){
                
                Button(){
                    
                }
                label :
                {       Text("다음")
                        .font(.headline)
                        .foregroundStyle(viewModel.user.petName != "" ? .white : .gray300)
                     
                        
                }
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(viewModel.user.petName != "" ? .yellow300 : .yellow50)
                        .frame(width: 360,height: 42)
                        .shadow(radius:  4, x: 0, y:viewModel.user.petName != "" ? 4 : 0)
                 
                }
                .frame(width: 360,height: 42)
                .padding(.leading,16)
                .padding(.bottom,50)
            }
            
      
        }
        
    }
}

#Preview {
    OnBoardingSizeView(viewModel: UserViewModel(user: User(petName: "", petSize: "", petAge: "", petPersonality: "", tripConcept: "")))
}
