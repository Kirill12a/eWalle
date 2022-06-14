//
//  ServiceCell.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//


import UIKit

class ServiceCell: UICollectionViewCell {

    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!

    static let reuseId = "ServiceCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func set(service: Service) {
        serviceImage.image = UIImage(named: service.serviceIcon)
        serviceLabel.text = service.serviceName
    }
}
