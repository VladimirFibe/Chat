//
//  UserStatusViewModel.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import Foundation

class UserStatusViewModel: ObservableObject {
  @Published var status = UserStatus.notConfigured
}
