//
//  FirstTryVC.swift
//  MiniGame
//
//  Created by Максим Ломакин on 23.01.2023.
//

import UIKit

class FirstTryVC: UIViewController {
    
    let presenter = Presenter()
    var guessNumber = 0
    var predictNumber = 50
    var maxNumber = 101
    var minNumber = 0
    var myCounter = 1
    let router: MainRouter = Router.shared
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
        tryLabel.text = "Try № 1: \(guessNumber)"
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
        questionLabel.text = "Your number is - \(predictNumber)?"
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
        moreButton.layer.cornerRadius   = 10
        equalsButton.layer.cornerRadius = 10
        lessButton.layer.cornerRadius   = 10
        moreButton.layer.borderWidth    = 1
        equalsButton.layer.borderWidth  = 1
        lessButton.layer.borderWidth    = 1
        moreButton.setTitleColor(.label, for: .normal)
        equalsButton.setTitleColor(.label, for: .normal)
        lessButton.setTitleColor(.label, for: .normal)
        equalsButton.addTarget(self, action: #selector(presentSecondTryVC), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(tapMoreButton), for: .touchUpInside)
        lessButton.addTarget(self, action: #selector(tapLessButton), for: .touchUpInside)
        equalsButton.setTitleColor(.systemGray4, for: .disabled)
        moreButton.setTitleColor(.systemGray4, for: .disabled)
        lessButton.setTitleColor(.systemGray4, for: .disabled)
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
    
    @objc func presentSecondTryVC() {
        if guessNumber == predictNumber {
            router.showSecondTry(from: self)
        } else {
            self.nameLabel.text = "I think you are cheating"
            equalsButton.layer.borderColor = UIColor.systemGray4.cgColor
            equalsButton.isEnabled = false
        }
    }
    
    @objc func tapMoreButton() {
        if self.guessNumber > self.predictNumber {
            nameLabel.text = "Computer is guessing"
            self.minNumber = predictNumber
            let newNumber = presenter.moreNumber(minNumber: minNumber, maxNumber: maxNumber)
            if newNumber != guessNumber {
                predictNumber = newNumber
                self.questionLabel.text = "Your number is - \(predictNumber)?"
            } else {
                predictNumber = newNumber
                self.questionLabel.text = "Your number is - \(predictNumber)?"
                moreButton.isEnabled = false
                lessButton.isEnabled = false
                equalsButton.isEnabled = true
                equalsButton.layer.borderColor = UIColor.label.cgColor
            }
        } else {
            self.nameLabel.text = "I think you are cheating"
        }
    }
    
    @objc func tapLessButton() {
        if self.guessNumber < self.predictNumber {
            nameLabel.text = "Computer is guessing"
            self.maxNumber = predictNumber
            let newNumber = presenter.moreNumber(minNumber: minNumber, maxNumber: maxNumber)
            if newNumber != guessNumber {
                predictNumber = newNumber
                self.questionLabel.text = "Your number is - \(predictNumber)?"
            } else {
                predictNumber = newNumber
                self.questionLabel.text = "Your number is - \(predictNumber)?"
                moreButton.isEnabled = false
                moreButton.layer.borderColor = UIColor.systemGray4.cgColor
                lessButton.isEnabled = false
                lessButton.layer.borderColor = UIColor.systemGray4.cgColor
                equalsButton.isEnabled = true
                equalsButton.layer.borderColor = UIColor.label.cgColor
            }
        } else {
            self.nameLabel.text = "I think you are cheating"
        }
    }
}
