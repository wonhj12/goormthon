//
//  LocationListSheetView.swift
//  goormthon
//
//  Created by dasoya on 2/28/24.
//

import SwiftUI

struct LocationListSheetView: View {
    
        @ObservedObject var viewModel : UserViewModel
        @State private var isDestinationActive : Bool = false
        init(viewModel: UserViewModel) {
            self.viewModel = viewModel
        }

        
    
    var body: some View {
        NavigationView{
            
            VStack{
                Text("\(viewModel.user.petName)와 함께하는\n즐거운 제주여행!🍊")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray500)
                    .padding(.leading,16)
                    .padding(.top,34)
                
                NavigationLink(destination: OnBoardingPersonalView(viewModel:viewModel),isActive:$isDestinationActive) {
                    Button(){
                        if( self.viewModel.user.petAge  != ""){
                            isDestinationActive = true
                        }
                    }
                    label :
                    {      
                        HStack{
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.white)
                            Text("새로운 여행 일정 생성하기")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
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
                
                LocationListView()
            }
        }
    }
}

struct LocationListView: View {
    
    var list : [Location] = LocationData.locations
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("AI 추천 장소")
                .font(.callout)
                .bold()
                .foregroundStyle(.gray500)
                
            
            ForEach(0..<list.count){ index in
                
                Text(list[index].name)
                    .background{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.beigie100)
                            .frame(width: 360,height: 116)
                            .shadow(radius: 4 , x: 0, y: 4)
                        
                    }
                    .frame(width: 360,height: 116)
                
              
                
            }
            Spacer()
        }
    }
}

#Preview {
    LocationListSheetView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "2", petPersonality: "", tripConcept: "")))
}
