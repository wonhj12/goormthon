import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String    // 이름
    let locationType: String    // 종류
    let address: String // 주소
    let coordinates: CLLocationCoordinate2D // 경도, 위도
    let openHours: String   // 영업 시간
    let dogSize: String // 대형, 중형, 소형견
    let hashTags: String    // 장소 키워드
    let description: String // 세부 내용
    let imageName: String?  // 이미지 링크
    
    // Identify 위한 id 생성
    var id: String {
        name + locationType
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
