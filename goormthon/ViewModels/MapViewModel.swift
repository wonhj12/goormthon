import Foundation
import MapKit
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var locations: [Location] // All loaded locations
    @Published var location: Location {
        didSet{
            updateMapRegion(location: location)
        }
    } // Current selected location
    @Published var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion())    // 지도 표시 위치 region
    @Published var mapSelection: MKMapItem?
    
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationData.locations
        self.locations = locations
        self.location = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        cameraPosition = .region(MKCoordinateRegion(
            center: location.coordinates,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000))
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeOut) {
            self.location = location
        }
    }
    
}
