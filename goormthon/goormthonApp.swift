import SwiftUI

@main
struct goormthonApp: App {
    @StateObject private var vm = MapViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
