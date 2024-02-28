import SwiftUI

struct DetailView: View {
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                // Image
                Group {
                    if let imageName = location.imageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 393, height: 228)
                    } else {
                        Rectangle()
                            .foregroundStyle(.gray100)
                            .frame(width: 393, height: 228)
                    }
                }
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack {
                    // Title
                    Text(location.name)
                        .foregroundStyle(.gray500)
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 6)
                    
                    // 종류
                    Text(location.locationType)
                        .foregroundStyle(.gray100)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                    
                    // 대형견
                    
                    
                    // 해시태그
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.yellow300)
                        .frame(width: 80, height: 32)
                    
                    // 주소
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(.gray100)
                        
                        Text(location.address)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.gray100)
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 8, trailing: 0))
                    
                    // 전화번호
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundStyle(.gray100)
                        
                        Text("010-0000-1111")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.gray100)
                    }
                    .padding(.bottom, 8)
                    
                    // 이메일
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundStyle(.gray100)
                        
                        Text("www.goormthon.com")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.gray100)
                    }
                    .padding(.bottom, 8)
                    
                    // 영업시간
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundStyle(.gray100)
                        
                        Text(location.openHours)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.gray100)
                    }
                    
                    Spacer()
                    
                    
                    // 추천 이유
                    ZStack(alignment: .bottom) {
                        // 하단 삼각형
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(45))
                            .foregroundStyle(.yellow50)
                            .offset(y: 10)
                        
                        VStack {
                            Text("이러한 이유로 추천했어요!")
                                .font(.caption)
                                .foregroundStyle(.gray100)
                                .padding(.top, 12)
                            
                            Text("초코는 대형견이고 활발해서 뛰어 놀기를 좋아해요.\n이러한 특성에 맞춰서 넓은 마당이 있고 호텔링이 가능한\n이곳을 추천해드렸어요!")
                                .font(.footnote.bold())
                                .foregroundStyle(.gray200)
                                .multilineTextAlignment(.center)
                                .padding(.top, 18)
                            
                            
                            Spacer()
                        }
                        .background {
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 353, height: 117)
                                    .foregroundStyle(.yellow50)
                                
                                
                            }
                        }
                    }
                    .frame(width: 353, height: 117)
                    .padding(.top, 16)
                    
                    // 강아지 이미지
                    Image("Dog")
                        .padding(.top, 24)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding([.horizontal, .top])
            }
        }
        .ignoresSafeArea()
    }
}

extension DetailView {
}

#Preview {
    DetailView(location: LocationData.locations.first!)
}
