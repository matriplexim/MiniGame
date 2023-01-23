//
//  FirstTryVC.swift
//  MiniGame
//
//  Created by Максим Ломакин on 23.01.2023.
//

import UIKit

class FirstTryVC: UIViewController {
    
    let tryLabel        = UILabel()
    let nameLabel       = UILabel()
    let questionLabel   = UILabel()
    let numberLabel     = UILabel()
    let stackView       = UIStackView()
    let moreButton      = UIButton(type: .system)
    let equalsButton    = UIButton(type: .system)
    let lessButton      = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureFirstTryUI()
    }
    
    func configureFirstTryUI() {
        configureTryLabelUI()
        configureNameLabelUI()
        configureQuestionLabelUI()
        configureStackViewUI()
        addButtonsToStack()
        configureNumberLabelUI()
    }
    
    func configureTryLabelUI() {
        view.addSubview(tryLabel)
        tryLabel.translatesAutoresizingMaskIntoConstraints = false
        tryLabel.text = "Try № 1"
        NSLayoutConstraint.activate([
            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureNameLabelUI() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Computer is guessing"
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureQuestionLabelUI() {
        view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = "Your number is - 80?"
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureStackViewUI() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        stackView.axis = .horizontal
        stackView.spacing = 10
    }
    
    func addButtonsToStack() {
        stackView.addArrangedSubview(moreButton)
        stackView.addArrangedSubview(equalsButton)
        stackView.addArrangedSubview(lessButton)
        moreButton.setTitle(">", for: .normal)
        equalsButton.setTitle("=", for: .normal)
        lessButton.setTitle("<", for: .normal)
        moreButton.layer.cornerRadius = 10
        equalsButton.layer.cornerRadius = 10
        lessButton.layer.cornerRadius = 10
        moreButton.layer.borderWidth = 1
        equalsButton.layer.borderWidth = 1
        lessButton.layer.borderWidth = 1
        moreButton.setTitleColor(.label, for: .normal)
        equalsButton.setTitleColor(.label, for: .normal)
        lessButton.setTitleColor(.label, for: .normal)
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 60),
            moreButton.heightAnchor.constraint(equalToConstant: 60),
            
            equalsButton.widthAnchor.constraint(equalToConstant: 60),
            equalsButton.heightAnchor.constraint(equalToConstant: 60),
            
            lessButton.widthAnchor.constraint(equalToConstant: 60),
            lessButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureNumberLabelUI() {
        view.addSubview(numberLabel)
        numberLabel.text = "My number is ..."
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            numberLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        ])
    }
    
}
