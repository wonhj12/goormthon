import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var vm: MapViewModel
    
    @State private var reload: Bool = false
    
    @ObservedObject var viewModel : UserViewModel
    
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
                
                HStack {
                    Spacer()
                    
                    Button {
                        reload = true
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
                    }
                }
                
                Spacer()
                
                locationPreview // 하단 preview
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
                        .shadow(radius: 10)
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
                                
                                //                                // Right
                                //                                if (value.translation.width > 0) {
                                //                                    vm.prevLocation()
                                //                                }
                            }))
                    
                        .sheet(isPresented: $vm.showDetail) {
                            DetailView(location: location)
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
                        .shadow(radius: 10)
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
}
