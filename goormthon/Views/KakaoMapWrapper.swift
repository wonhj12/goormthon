import SwiftUI

struct KakaoMapWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let kakaoMap = KakaoMapView()
        kakaoMap.baseMapType = .standard
        kakaoMap.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude: 33.4996213, longitude: 126.5311884)), animated: true) // 제주도 위경도
        kakaoMap.setZoomLevel(8, animated: false) // 제주도 한눈에 보이도록 zoom level 설정
        
        return kakaoMap
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class KakaoMapView : MTMapView {
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}
