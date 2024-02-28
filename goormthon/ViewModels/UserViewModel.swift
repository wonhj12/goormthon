import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }
}
