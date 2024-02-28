import SwiftUI

struct KakaoMapWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let kakaoMap = KakaoMapView()
        kakaoMap.baseMapType = .standard
        kakaoMap.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude: 33.388048, longitude: 126.563165)), animated: true)
        kakaoMap.setZoomLevel(1, animated: true)
        
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
