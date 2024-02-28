import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let address: String
    let coordinates: CLLocationCoordinate2D
    let imageName: String?
    
    // Identify 위한 id 생성
    var id: String {
        name + address
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
