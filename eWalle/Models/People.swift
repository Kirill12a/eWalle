//
//  People.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import Foundation
struct People: Codable, PeopleCellViewModel {
    let id: Int
    let name: String
    let email: String
    let profileImage: String
    let location: String
}
