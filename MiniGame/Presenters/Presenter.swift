//
//  Presenter.swift
//  MiniGame
//
//  Created by Максим Ломакин on 25.01.2023.
//

import Foundation

class Presenter {
    let model = Model()
    
    func moreNumber(minNumber: Int, maxNumber: Int) -> Int {
        if let newNumber = model.returnArrayOfNumberMore(minNumber: minNumber, maxNumber: maxNumber).randomElement() {
            return newNumber
        } else {
            print("Wrong presenter return new number from moreNumber func")
            return 50
        }
    }
    
    func lessNumber(minNumber: Int, maxNumber: Int) -> Int {
        if let newNumber = model.returnArrayOfNumberLess(minNumber: minNumber, maxNumber: maxNumber).randomElement() {
            return newNumber
        } else {
            print("Wrong presenter return new number from lessNumber func")
            return 50
        }
    }
}
