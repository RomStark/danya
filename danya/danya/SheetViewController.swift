//
//  SheetViewController.swift
//  danya
//
//  Created by Al Stark on 16.05.2023.
//

import UIKit

final class SheetViewController: UIViewController {

    let animateLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выключение самоката"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    let desciprionLabel: UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста, подождите несколько секнуд, пока самокат выключиться"
        label.numberOfLines = 0
        return label
    }()
    
    let scooterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    let scooterNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    let scooterChargeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let scooterCostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupAnimatePath()
        
    }
    
    public func configureVC(scooterName: String, scooterNumber: String, scooterCharge: String, scooterCost: String) {
        self.scooterNameLabel.text = scooterName
        self.scooterNumberLabel.text = scooterNumber
        self.scooterCostLabel.text = scooterCost
        self.scooterChargeLabel.text = scooterCharge
    }
    
}

private extension SheetViewController {
    func setupUI() {
        setupTitleLabel()
        setupCardView()
        setupAnimateLine()
        setupDescriptionLabel()
    }
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
    }
    func setupAnimateLine() {
        view.addSubview(animateLine)
        
        animateLine.translatesAutoresizingMaskIntoConstraints = false
        animateLine.centerYAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 20.0).isActive = true
        animateLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        animateLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        animateLine.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        animateLine.layer.cornerRadius = 7.5
        animateLine.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 60.0).isActive = true
        
        
    }
    func setupAnimatePath() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 7.5))
        path.addLine(to: CGPoint(x: 100, y: 7.5))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.lineWidth = 15.0
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        animateLine.layer.addSublayer(shapeLayer)
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = shapeLayer.position.x
        animation.toValue = animateLine.bounds.width - 100
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.duration = 2.0
        shapeLayer.add(animation, forKey: "lineAnimation")
    }
    
    func setupDescriptionLabel() {
        view.addSubview(desciprionLabel)
        desciprionLabel.translatesAutoresizingMaskIntoConstraints = false
        desciprionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        desciprionLabel.topAnchor.constraint(equalTo: animateLine.bottomAnchor, constant: 20.0).isActive = true
        desciprionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
    }
    
    
    
    func setupCardView() {
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40.0).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        cardView.layer.borderWidth = 2.0
        cardView.layer.borderColor = UIColor.purple.cgColor
        cardView.layer.cornerRadius = 20.0
        setupCardViewLabels()
    }
    
    func setupCardViewLabels() {
        setupScooterNameLabel()
        setupScooterNumberLabel()
        setupScooterChargeLabel()
        setupScooterCostLabel()
    }
    
    func setupScooterNameLabel() {
        cardView.addSubview(scooterNameLabel)
        scooterNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15.0).isActive = true
        scooterNameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15.0).isActive = true
    }
    
    func setupScooterNumberLabel() {
        cardView.addSubview(scooterNumberLabel)
        scooterNumberLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15.0).isActive = true
        scooterNumberLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15.0).isActive = true
    }
    
    func setupScooterChargeLabel() {
        cardView.addSubview(scooterChargeLabel)
        scooterChargeLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -15.0).isActive = true
        scooterChargeLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15.0).isActive = true
    }
    
    func setupScooterCostLabel() {
        cardView.addSubview(scooterCostLabel)
        scooterCostLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -15.0).isActive = true
        scooterCostLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15.0).isActive = true
    }
    
}
