//
//  ViewController.swift
//  danya
//
//  Created by Al Stark on 16.05.2023.
//

import UIKit

final class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("нажaть", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupButton()
    }

    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc private func buttonTapped() {
        let controller = SheetViewController()
        controller.configureVC(scooterName: "Самокат Юрент", scooterNumber: "037-107", scooterCharge: "100% - 25км", scooterCost: "5р/мин")
        controller.modalPresentationStyle = .pageSheet
        
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self
        
        self.present(controller, animated: true, completion: nil)
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {
func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

