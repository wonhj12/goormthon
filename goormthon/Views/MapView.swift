import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var vm: MapViewModel
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                locationsList // 하단 장소 리스트
            }
            .padding()
        }
    }
}

extension MapView {
    // 하단 장소 리스트
    private var locationsList: some View {
        LocationsListView()
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
    
    private var mapLayer: some View {
        Map(position: $vm.cameraPosition) {
            ForEach(vm.locations) { location in
                Annotation("", coordinate: location.coordinates) {
                    MarkerView()
                        .scaleEffect(vm.location == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location) // 선택한 장소로 이동
                        }
                }
            }
            
            MapPolyline(coordinates: vm.locations.map{$0.coordinates})
                .stroke(.black, style: StrokeStyle(lineWidth: 1, dash: [10]))
                
        }
    }
}

#Preview {
    MapView()
        .environmentObject(MapViewModel())
}
