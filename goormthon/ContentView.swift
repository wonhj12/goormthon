import SwiftUI

struct ContentView: View {
    var body: some View {
        OnBoardingSizeView(viewModel: UserViewModel(user: User(petName: "", petSize: "", petAge: "", petPersonality: "", tripConcept: "")))
        //LocationInfoView()
        // MapView()
    }
}

#Preview {
    ContentView()
}
