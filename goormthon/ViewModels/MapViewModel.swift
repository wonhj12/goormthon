import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var locations: [Location] // All loaded locations
    @Published var location: Location {
        didSet{
            updateMapRegion(location: location)
        }
    } // Current selected location
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion() // 지도 표시 위치 region
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationData.locations
        self.locations = locations
        self.location = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
    }
    
}
