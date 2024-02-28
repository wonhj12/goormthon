import SwiftUI

struct ContentView: View {
    @State private var vm = UserViewModel(user: User(petName: "", petSize: "", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#대형견#활발한#뛰는걸 좋아하는"))
    
    var body: some View {
        NavigationStack {
            OnboardingNameView(viewModel: vm)
        }
    }
}

#Preview {
    ContentView()
}
