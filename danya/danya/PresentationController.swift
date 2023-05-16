//
//  PresentationController.swift
//  danya
//
//  Created by Al Stark on 16.05.2023.
//

import UIKit

final class PresentationController: UIPresentationController {

  
  override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
      super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
      _ = Timer.scheduledTimer(timeInterval: TimeInterval(10), target: self, selector: #selector(dismissController), userInfo: nil, repeats: true)
  }
  
  override var frameOfPresentedViewInContainerView: CGRect {
      CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * 0.6),
             size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height *
              0.4))
  }

  
  override func containerViewWillLayoutSubviews() {
      super.containerViewWillLayoutSubviews()
    presentedView!.roundCorners([.topLeft, .topRight], radius: 22)
  }

  override func containerViewDidLayoutSubviews() {
      super.containerViewDidLayoutSubviews()
      presentedView?.frame = frameOfPresentedViewInContainerView
  }

  @objc func dismissController(){
      self.presentedViewController.dismiss(animated: true, completion: nil)
  }
}

extension UIView {
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
      let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                              cornerRadii: CGSize(width: radius, height: radius))
      let mask = CAShapeLayer()
      mask.path = path.cgPath
      layer.mask = mask
  }
}

