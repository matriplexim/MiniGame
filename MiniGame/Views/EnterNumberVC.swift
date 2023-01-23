//
//  EnterNumberVC.swift
//  MiniGame
//
//  Created by Максим Ломакин on 23.01.2023.
//

import UIKit

class EnterNumberVC: UIViewController {
    
    let textField   = UITextField()
    let enterButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureEnterNumberUI()
    }
    
    func configureEnterNumberUI() {
        configureTextField()
        configureEnterButton()
    }
    
    func configureTextField() {
        view.addSubview(textField)
        textField.placeholder = "Guess the number"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.returnKeyType = .done
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 244),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureEnterButton() {
        view.addSubview(enterButton)
        enterButton.isEnabled = false
        enterButton.backgroundColor = .systemIndigo
        enterButton.setTitle("Enter the Number", for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.layer.cornerRadius = 10
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 244),
            enterButton.heightAnchor.constraint(equalToConstant: 44)
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

extension EnterNumberVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if checkText(textField.text ?? "") {
            self.enterButton.isEnabled = true
            self.enterButton.backgroundColor = .blue
            self.textField.resignFirstResponder()
            return true
        } else {
            self.enterButton.isEnabled = false
            self.enterButton.backgroundColor = .systemIndigo
            self.textField.resignFirstResponder()
            return true
        }
    }
    
}
