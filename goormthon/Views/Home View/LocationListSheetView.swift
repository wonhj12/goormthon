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
                    .padding(.bottom,50)
                    
                }
                
                LocationListView()
            }    .padding(.leading,16)
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
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.beigie100)
                        .frame(width: 360,height: 116)
                        .shadow(radius: 4 , x: 0, y: 4)
                    
                    
                    HStack{
                        
                        
                        Image("Background")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 82,height: 82)
                            .aspectRatio(contentMode: .fill)
                            .padding(.leading,12)
                        
                        
                        VStack{
                            
                            Text(list[index].name)
                            //                                        .font(.headline)
                            //                                        .foregroundStyle(.gray100)
                            
                            HStack{
                                
                                ZStack{
                                    ForEach(list[index].hashTags.extractKeywords(), id: \.self) { tag in
                                        
                                        
                                        
                                        Text("#\(tag) ")
                                            .font(.headline)
                                            .foregroundStyle(.gray300)
                                        
                                    }.padding(.leading, -5)
                                    //                                        .background{
                                    //
                                    //                                            RoundedRectangle(cornerRadius: 99)
                                    //                                                .foregroundStyle(.beigie300)
                                    //                                                .overlay{
                                    //                                                    Text(list[index].k)
                                    //                                                        .font(.headline)
                                    //                                                }
                                    //                                        }
                                }
                            }
                        }
                        Spacer()
                    }
                    
                    
                    //.clipShape{Circle().frame(width: 64, height: 64)}
                    
                    
                    
                    
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
