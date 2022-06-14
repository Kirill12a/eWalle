//
//  PeopleCell.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import Foundation
import UIKit

protocol PeopleCellViewModel {
    var name: String { get }
    var profileImage: String { get }
}


class PeopleCell: UICollectionViewCell {
    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var peopleLabel: UILabel!
    
    static let reuseId = "PeopleCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        peopleImage.layer.cornerRadius = peopleImage.bounds.height / 2
        peopleImage.clipsToBounds = true
    }
    
    func set(peopleCellViewModel: PeopleCellViewModel) {
        peopleImage.image = UIImage(named: peopleCellViewModel.profileImage)
        peopleLabel.text = peopleCellViewModel.name
    }
    
}
