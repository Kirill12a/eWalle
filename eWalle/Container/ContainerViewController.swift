//
//  ContainerViewController.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import UIKit
class ContainerViewController: UIViewController, HomeViewControllerDelegate {

  var controller: UIViewController!
  var menuViewController: UIViewController!
  var isMove = false

  override func viewDidLoad() {
    super.viewDidLoad()

    configureHomeViewController()
  }

  func configureHomeViewController() {
    let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController") as! HomeViewController
    homeViewController.delegate = self
    controller = homeViewController
    view.addSubview(controller.view)
    addChild(controller)
  }

  func configureMenuViewController() {
    if menuViewController == nil {
      let menuVC = MenuViewController()
      menuVC.delegate = self
      menuViewController = menuVC
      view.insertSubview(menuViewController.view, at: 0)
      addChild(menuViewController)
    }
  }

//MARK: - Меню открыть/закрыть
  func showMenuViewController(shouldMove: Bool) {
    if shouldMove {
      UIView.animate(withDuration: 0.5,
                     delay: 0,
                     usingSpringWithDamping: 0.8,
                     initialSpringVelocity: 0,
                     options: .curveEaseInOut,
                     animations: {
                      var t = CGAffineTransform.identity
                      t = t.translatedBy(x: 167, y:  0)
                      t = t.rotated(by: -CGFloat.pi/12)
                      t = t.scaledBy(x: 0.7, y: 0.7)
                      self.controller.view.transform = t
                      self.controller.view.layer.cornerRadius = 30
                      self.controller.view.isUserInteractionEnabled = false

                     }) { (open) in

      }
    } else {

      UIView.animate(withDuration: 0.5,
                     delay: 0,
                     usingSpringWithDamping: 0.8,
                     initialSpringVelocity: 0,
                     options: .curveEaseInOut,
                     animations: {
                      var t = CGAffineTransform.identity
                      t = t.translatedBy(x: 0, y: 0)
                      t = t.rotated(by: 0)
                      t = t.scaledBy(x: 1, y: 1)
                      self.controller.view.transform = t
                      self.controller.view.layer.cornerRadius = 0
                      self.controller.view.isUserInteractionEnabled = true
                     }) { (close) in

      }
    }
  }

  // MARK: FoodViewControllerDelegate

  func toggleMenu() {
    configureMenuViewController()
    isMove = !isMove
    showMenuViewController(shouldMove: isMove)
  }

}

