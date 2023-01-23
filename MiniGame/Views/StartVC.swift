//
//  ViewController.swift
//  MiniGame
//
//  Created by Максим Ломакин on 22.01.2023.
//

import UIKit

class StartVC: UIViewController {
    let label = UILabel()
    let button = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureLabel()
        configureButton()
    }
    
    func configureLabel() {
        view.addSubview(label)
        label.text = "My Awesome Game"
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureButton() {
        view.addSubview(button)
        button.backgroundColor = .blue
        button.setTitle("Start New Game", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 244),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}

