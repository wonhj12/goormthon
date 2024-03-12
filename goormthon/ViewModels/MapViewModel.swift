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
    @Published var showDetail: Bool = false
    
    @Published var reload: Bool = false
    
    init() {
        let locations = LocationData.locations
        self.locations = locations
        self.location = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        cameraPosition = .region(MKCoordinateRegion(
            center: location.coordinates,
            latitudinalMeters: 4000,
            longitudinalMeters: 4000))
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeOut) {
            self.location = location
        }
    }
    
    // 다음 순서에 있는 관광지 가져오기
    func nextLocation() {
        // Get current index
        guard let currentIndex = locations.firstIndex(where: { $0 == location }) else {
            return
        }
        
        // Check index
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is not valid
            // Restart 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    // 이전 순서에 있는 관광지 가져오기
    func prevLocation() {
        // Get current index
        guard let currentIndex = locations.firstIndex(where: { $0 == location }) else {
            return
        }
        
        // Check index
        let nextIndex = currentIndex - 1
        guard locations.indices.contains(nextIndex) else {
            // Prev index is not valid
            guard let lastLocation = locations.last else { return }
            showNextLocation(location: lastLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    func changeLocations() {
        locations = LocationData.location2
        location = locations.first!
    }
}
