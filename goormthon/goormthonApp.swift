import SwiftUI
import TipKit

@main
struct goormthonApp: App {
    @StateObject private var vm = MapViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate)
//                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
