import Foundation
import TipKit

struct ResetTip: Tip {
    var title: Text {
        Text("일정을 재설정 하세요")
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(.yellow400)
    }
    
    var message: Text? {
        Text("테마와 일정을 유지한 채 재생성 합니다.\n더 잘 맞는 일정을 짜드릴게요!")
            .font(.footnote)
            .foregroundStyle(.gray500)
    }
}

struct NewTip: Tip {
    var title: Text {
        Text("다른 일정을 생성해요")
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(.yellow400)
    }
    
    var message: Text? {
        Text("일정을 처음부터 다시 생성합니다.\nAI가 추천하는 장소도 둘러보세요!")
            .font(.footnote)
            .foregroundStyle(.gray500)
    }
}
