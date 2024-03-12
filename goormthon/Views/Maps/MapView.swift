import SwiftUI
import MapKit
import TipKit

struct MapView: View {
    @EnvironmentObject private var vm: MapViewModel
    @State private var reload: Bool = false
    @ObservedObject var viewModel : UserViewModel
    
    private let resetTip = ResetTip()
    private let newTip = NewTip()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                profile // 상단 profile info
                    .padding(.bottom, 8)
                
                // 재설정 버튼
                Button {
                    reload = true
                    vm.changeLocations()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 44, height: 44)
                            .foregroundStyle(.white)
                        
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(.gray200)
                            .bold()
                        
                        
                    }
                    .padding(.horizontal)
                    .popoverTip(resetTip)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                
                Spacer()
                
                // 전체 재설정 버튼
                Button {
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 44, height: 44)
                            .foregroundStyle(.white)
                        
                        Image(systemName: "lightbulb.min.fill")
                            .foregroundStyle(.gray200)
                            .bold()
                    }
                    .padding(.horizontal)
                    .popoverTip(newTip)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                
                // 현재 위치 버튼
                HStack {
                    Button {
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 44, height: 44)
                                .foregroundStyle(.white)
                            
                            Image(systemName: "location.fill")
                                .foregroundStyle(.gray200)
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                    
                    Spacer()
                }
                .padding(.top, 12)
                
                locationPreview // 하단 preview
                    .padding(.top, 12)
            }
        }
        .navigationDestination(isPresented: $reload) {
            ConceptView(viewModel: viewModel, reload: true)
        }
        .toolbar(.hidden)
    }
}

extension MapView {
    // 상단 profile info
    private var profile: some View {
        VStack {
            MapProfileView(viewModel: viewModel)
        }
        .padding(.top)
    }
    
    // 하단 preview
    private var locationPreview: some View {
        ZStack {
            ForEach(0 ..< vm.locations.count, id: \.self) { index in
                let location = vm.locations[index]
                
                if (vm.location == location) {
                    LocationPreviewView(index: index + 1, location: location)
                        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                        .padding(.bottom)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        .onTapGesture {
                            vm.showDetail.toggle()
                        }
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                // Left
                                if (value.translation.width < 0) {
                                    vm.nextLocation()
                                }
                            }))
                    
                        .sheet(isPresented: $vm.showDetail) {
                            DetailView(location: location, viewModel: viewModel)
                        }
                }
            }
        }
    }
    
    // 지도
    private var mapLayer: some View {
        Map(position: $vm.cameraPosition) {
            ForEach(0 ..< vm.locations.count, id: \.self) { index in
                let location = vm.locations[index]
                Annotation("", coordinate: location.coordinates) {
                    MarkerView(num: index + 1)
                        .scaleEffect(vm.location == location ? 1 : 0.7)
                        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                        .onTapGesture {
                            vm.showNextLocation(location: location) // 선택한 장소로 이동
                        }
                }
            }
            
            // 경로 선
            MapPolyline(coordinates: vm.locations.map{$0.coordinates})
                .stroke(.gray200, style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [5]))
        }
    }
}

#Preview {
    MapView(viewModel: UserViewModel(user: User(petName: "또리", petSize: "", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는")))
        .environmentObject(MapViewModel())
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .datastoreLocation(.applicationDefault)
            ])
        }
}
