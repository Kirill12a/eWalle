//
//  MenuModel.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import Foundation
import UIKit

enum MenuModel: CustomStringConvertible, CaseIterable {
    case home
    case profile
    case accounts
    case transactions
    case stats
    case settings
    case help
    
    var description: String {
        switch self {
        case .home: return "Home"
        case .profile: return "Profile"
        case .accounts: return "Accounts"
        case .transactions: return "Transactions"
        case .stats: return "Stats"
        case .settings: return "Setting"
        case .help: return "Help"
        }
    }
}
