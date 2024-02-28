import Foundation
import MapKit

class LocationData {
    static let locations: [Location] = [
        Location(name: "카카오 스페이스닷원", 
                 address: "제주특별자치도 제주시 첨단로 242",
                 coordinates: CLLocationCoordinate2D(latitude: 33.452342, longitude: 126.569523)),
        Location(name: "구룸스퀘어 인 제주",
                 address: "제주특별자치도 제주시 도남로 168-12",
                 coordinates: CLLocationCoordinate2D(latitude: 33.487198, longitude: 126.531686)),
        Location(name: "플레이스캠프 제주",
                 address: "제주특별자치도 서귀포시 성산읍 동류암로 20",
                 coordinates: CLLocationCoordinate2D(latitude: 33.449830, longitude: 126.918169)),
        
    ]
}

