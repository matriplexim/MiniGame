//
//  MainRouter.swift
//  MiniGame
//
//  Created by Максим Ломакин on 25.01.2023.
//

import Foundation
import UIKit

protocol MainRouter {
    func showEnterNumber(from: UIViewController)
    func showFirstTry(from: UIViewController, number: Int)
    func showSecondTry(from: UIViewController)
    func showScores(from: UIViewController)
    func showStart(from: UIViewController)
}

extension Router: MainRouter {
    func showEnterNumber(from: UIViewController) {
        let vc = EnterNumberVC()
        vc.modalPresentationStyle = .fullScreen
        from.present(vc, animated: true)
    }
    
    func showFirstTry(from: UIViewController, number: Int) {
        let vc = FirstTryVC()
        vc.guessNumber = number
        vc.modalPresentationStyle = .fullScreen
        from.present(vc, animated: true)
    }
    
    func showSecondTry(from: UIViewController) {
        let vc = SecondTryVC()
        vc.modalPresentationStyle = .fullScreen
        from.present(vc, animated: true)
    }
    
    func showScores(from: UIViewController) {
        let vc = ScoresVC()
        vc.modalPresentationStyle = .fullScreen
        from.present(vc, animated: true)
    }
    
    func showStart(from: UIViewController) {
        let vc = StartVC()
        vc.modalPresentationStyle = .fullScreen
        from .present(vc, animated: true)
    }
}
