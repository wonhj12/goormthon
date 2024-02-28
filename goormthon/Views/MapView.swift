import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var vm: MapViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion,
                annotationItems: vm.locations,
                annotationContent: {location in
                MapMarker(coordinate: location.coordinates, tint: .blue)
            })
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
            .background(.thickMaterial)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

//#Preview {
//    MapView()
//}
