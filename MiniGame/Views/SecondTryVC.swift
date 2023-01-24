//
//  SecondTryVC.swift
//  MiniGame
//
//  Created by Максим Ломакин on 24.01.2023.
//

import UIKit

class SecondTryVC: UIViewController {

    let secondTryLabel  = UILabel()
    let guessLabel      = UILabel()
    let numberTextField = UITextField()
    let guessButton     = UIButton(type: .system)
    let resultLabel     = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSecondTryUI()
    }
    
    func configureSecondTryUI() {
        configureSecondTryLabelUI()
        configureGuessLabelUI()
        configureNumberTFUI()
        configureGuessButtonUI()
        configureResultLabelUI()
    }
    
    func configureSecondTryLabelUI() {
        view.addSubview(secondTryLabel)
        secondTryLabel.text = "Try № 2"
        secondTryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            secondTryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureGuessLabelUI() {
        view.addSubview(guessLabel)
        guessLabel.text = "You are guessing"
        guessLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            guessLabel.topAnchor.constraint(equalTo: secondTryLabel.bottomAnchor, constant: 10),
            guessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureNumberTFUI() {
        view.addSubview(numberTextField)
        numberTextField.placeholder = "Guess the number"
        numberTextField.borderStyle = .roundedRect
        numberTextField.textAlignment = .center
        numberTextField.returnKeyType = .done
        numberTextField.delegate = self
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: guessLabel.bottomAnchor, constant: 40),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberTextField.widthAnchor.constraint(equalToConstant: 274),
            numberTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureGuessButtonUI() {
        view.addSubview(guessButton)
        guessButton.isEnabled = false
        guessButton.backgroundColor = .systemIndigo
        guessButton.setTitle("Guess", for: .normal)
        guessButton.setTitleColor(.white, for: .normal)
        guessButton.layer.cornerRadius = 10
        guessButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            guessButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 40),
            guessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guessButton.widthAnchor.constraint(equalToConstant: 274),
            guessButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureResultLabelUI() {
        view.addSubview(resultLabel)
        resultLabel.text = "No, my number is less than yours"
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: guessButton.bottomAnchor, constant: 30),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func checkText(_ text: String) -> Bool {
        if let intText = Int(text) {
            if intText >= 0 && intText <= 100 {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
}

extension SecondTryVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if checkText(textField.text ?? "") {
            self.guessButton.isEnabled = true
            self.guessButton.backgroundColor = .blue
            self.numberTextField.resignFirstResponder()
            return true
        } else {
            self.guessButton.isEnabled = false
            self.guessButton.backgroundColor = .systemIndigo
            self.numberTextField.resignFirstResponder()
            return true
        }
    }
    
}
