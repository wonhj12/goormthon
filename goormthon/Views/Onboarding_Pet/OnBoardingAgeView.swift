//
//  OnBoardingAgeView.swift
//  goormthon
//
//  Created by dasoya on 2/28/24.
//

import SwiftUI

struct OnBoardingAgeView: View {
    
    
    @ObservedObject var viewModel : UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
   @State private var isFirstButtonActive = false
   @State private var isDestinationActive : Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading,spacing: 0){
                HStack{
                    Text("우리 \(viewModel.user.petAge)는\n몇 살 인가요?🐶")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.gray500)
                        .padding(.leading,16)
                        .padding(.top,34)
                    
                    Spacer()
                }.onAppear{
                    viewModel.user.petAge = String(3)
                }
                
                //1
                HStack(alignment: .center){
                    
                    Button(){
                
                       
          
                    }
                    label :
                    {
                        HStack(alignment: .bottom){
                            
                            
                            TextField("", text: $viewModel.user.petAge)
                                .font(.system(size: 91))
                                .bold()
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: 120)
                                .onReceive(viewModel.user.petAge.publisher.collect()) { newValue in
                                
                                                let filtered = String(newValue.prefix(2))
                                                if filtered != self.viewModel.user.petAge {
                                                    self.viewModel.user.petAge = filtered
                                                }
                                       
                                    }
                               // .background(.red)
                                .padding(-10)
                                .padding(.leading,-20)
                            
                            Text("살")
                                .frame(alignment: .leading)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.bottom,8)
                            
                                .animation(nil)
                            
                        }.padding(.leading,132)
                    }
                 
                    
                }.padding(.bottom,16)
                    .padding(.top,50)
                
                
                Spacer()
                
                HStack(alignment: .center){
                    NavigationLink(destination: OnBoardingPersonalView(viewModel:viewModel),isActive:$isDestinationActive) {
                        Button(){
                            
                            if( self.viewModel.user.petAge  != ""){
                                isDestinationActive = true
                            }
                        }
                        label :
                        {       Text("다음")
                                .font(.headline)
                                .foregroundStyle(viewModel.user.petAge != "" ? .white : .gray300)
                        }
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(viewModel.user.petAge  != "" ? .yellow300 : .yellow50)
                                .frame(width: 360,height: 42)
                                .shadow(radius:  4, x: 0, y:viewModel.user.petAge  != "" ? 4 : 0)
                            
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
    OnBoardingAgeView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "2", petPersonality: "", tripConcept: "")))
}
