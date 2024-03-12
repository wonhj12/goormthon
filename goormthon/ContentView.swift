import SwiftUI

struct ContentView: View {
    @State private var vm = UserViewModel(user: User(petName: "", petSize: "", petAge: "", petPersonality: "", tripDate: "", tripConcept: "", tags: "#소형견#활발한#달리기"))
    
    var body: some View {
        NavigationStack {
            OnboardingNameView(viewModel: vm)
        }
    }
}

#Preview {
    ContentView()
}
