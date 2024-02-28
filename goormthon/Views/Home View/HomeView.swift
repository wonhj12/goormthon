//
//  HomeView.swift
//  goormthon
//
//  Created by dasoya on 2/28/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel : UserViewModel
    @State private var isPresented = true
    
    var body: some View {
        
        
        VStack{
            Image("Background")
                .resizable()
                .frame(height: 300)
                .ignoresSafeArea()
            
            Spacer()
        }
        .sheet(isPresented: $isPresented) {
            
            GeometryReader { geometry in
                // 표시할 Sheet 내용
                LocationListSheetView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "2", petPersonality: "", tripConcept: "")))
                    .frame(minHeight: 1200)
                    .presentationDetents([
                        .fraction(0.7), // 임의 비율
                        .large // 전체 높이
                    ])
                // DragIndicatior 비활성화
                //   .presentationDragIndicator(.hidden)
                // 인터랙션 비활성화
                    .interactiveDismissDisabled(geometry.size.width < 900 )
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView(viewModel: UserViewModel(user: User(petName: "", petSize: "또리", petAge: "2", petPersonality: "", tripConcept: "")))
}
