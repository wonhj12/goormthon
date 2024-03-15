import SwiftUI
import Lottie

struct dogLoadingView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<dogLoadingView>) -> some UIView {
        let view = UIView(frame: .zero)
        let lottieAnimation = LottieAnimation.named("DogScanAnimation")
        let animationView = LottieAnimationView(animation: lottieAnimation)
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
