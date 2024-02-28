//
//  UserInputViewModel.swift
//  goormthon
//
//  Created by dasoya on 2/28/24.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }
}
