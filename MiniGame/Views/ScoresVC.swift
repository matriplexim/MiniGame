//
//  ScoresVC.swift
//  MiniGame
//
//  Created by Максим Ломакин on 24.01.2023.
//

import UIKit

class ScoresVC: UIViewController {
    
    var myCounter = 0
    var CPUCounter = 0
    let router: MainRouter = Router.shared
    let titleLabel      = UILabel()
    let myCountLabel    = UILabel()
    let CPUCountLabel   = UILabel()
    let resultLabel     = UILabel()
    let mainButton      = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureScoresUI()
    }

    func configureScoresUI() {
        configureTitleLabelUI()
        configureMyCountLabelUI()
        configureCPUCountLabelUI()
        configureMainButtonUI()
        configureResultLabelUI()
    }
    
    func configureTitleLabelUI() {
        view.addSubview(titleLabel)
        titleLabel.text = "Scores:"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureMyCountLabelUI() {
        view.addSubview(myCountLabel)
        myCountLabel.text = "Your's tries count: \(myCounter)"
        myCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCountLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            myCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func configureCPUCountLabelUI() {
        view.addSubview(CPUCountLabel)
        CPUCountLabel.text = "Computer's tries count: \(CPUCounter)"
        CPUCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            CPUCountLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            CPUCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func configureMainButtonUI() {
        view.addSubview(mainButton)
        mainButton.backgroundColor = .blue
        mainButton.setTitle("Main menu", for: .normal)
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.layer.cornerRadius = 10
        mainButton.addTarget(self, action: #selector(presentMainMenu), for: .touchUpInside)
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.widthAnchor.constraint(equalToConstant: 264),
            mainButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureResultLabelUI() {
        view.addSubview(resultLabel)
        if myCounter < CPUCounter {
            resultLabel.text = "You Win"
        } else if CPUCounter < myCounter {
            resultLabel.text = "CPU Win"
        } else {
            resultLabel.text = "Draw"
        }
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -40)
        ])
    }
    
    @objc func presentMainMenu() {
        router.showStart(from: self)
    }
}
