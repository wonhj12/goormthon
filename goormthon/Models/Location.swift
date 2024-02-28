import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let address: String
    let coordinates: CLLocationCoordinate2D
    
    // Identify 위한 id 생성
    var id: String {
        name + address
    }
}
