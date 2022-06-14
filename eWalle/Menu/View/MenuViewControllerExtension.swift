//
//  MenuViewControllerExtension.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import Foundation
import UIKit

// MARK: - Configure View
extension MenuViewController {

  public func configureView() {
    configureUserView()
    configureLogoutImageView()
    configureLogoutButton()
    configureVersionLabel()
    configureCancelButton()
  }

  private func configureUserView() {
    userView = UserView(frame: CGRect(x: 0, y: 0, width: 210, height: 107), userName: userName, userLocation: userLocation, userImage: userImage)
    view.addSubview(userView)
  }
  private func configureLogoutImageView() {

    let logoutImage = UIImage(named: "Logout")
    let logoutImageView = UIImageView(image: logoutImage ?? UIImage())

    logoutImageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(logoutImageView)

    var bottomAnchorConstant: CGFloat = -107
    if view.frame.size.width < 381 {
      bottomAnchorConstant = -50
    }


      NSLayoutConstraint.activate([
        logoutImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        logoutImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomAnchorConstant),
        logoutImageView.widthAnchor.constraint(equalToConstant: 16),
        logoutImageView.heightAnchor.constraint(equalToConstant: 18)
      ])
  }


  private func configureLogoutButton() {
    let textColor: UIColor = UIColor(named: "Color#1B1D28") ?? .gray

    let logoutButton = UIButton(type: .system)
    logoutButton.setTitle("Logout", for: .normal)
    logoutButton.setTitleColor(textColor, for: .normal)
    logoutButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 16)
    logoutButton.addTarget(self, action:#selector(self.logoutAction(sender:)), for: .touchUpInside)
    logoutButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(logoutButton)

    var bottomAnchorConstant: CGFloat = -104
    if view.frame.size.width < 381 {
      bottomAnchorConstant = -47
    }

      NSLayoutConstraint.activate([
        logoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 54),
        logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomAnchorConstant),
        logoutButton.widthAnchor.constraint(equalToConstant: 55),
        logoutButton.heightAnchor.constraint(equalToConstant: 25)
      ])

  }

  private func configureVersionLabel() {
    let versionLabel = UILabel()
    versionLabel.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 10)
    versionLabel.text = "Version 2.0.1"
    versionLabel.textColor = #colorLiteral(red: 0.2274509804, green: 0.2588235294, blue: 0.462745098, alpha: 1)
    versionLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(versionLabel)

      NSLayoutConstraint.activate([
        versionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        versionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27),
        versionLabel.widthAnchor.constraint(equalToConstant: 68),
        versionLabel.heightAnchor.constraint(equalToConstant: 15)
      ])


  }

  private func configureCancelButton() {
    let cancelButton = UIButton()
    cancelButton.setImage(UIImage(named: "Cross"), for: .normal)
    cancelButton.addTarget(self, action:#selector(self.cancelAction(sender:)), for: .touchUpInside)
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(cancelButton)
      NSLayoutConstraint.activate([
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 47),
        cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -28),
        cancelButton.widthAnchor.constraint(equalToConstant: 23),
        cancelButton.heightAnchor.constraint(equalToConstant: 23)
      ])

  }
}
