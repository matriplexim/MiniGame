//
//  Model.swift
//  MiniGame
//
//  Created by Максим Ломакин on 25.01.2023.
//

import Foundation

class Model {
    
    func returnArrayOfNumberMore(minNumber: Int, maxNumber: Int) -> [Int] {
        var array:[Int] = []
        for i in (minNumber + 1)...maxNumber {
            array.append(i)
        }
        return array
    }
    
    func returnArrayOfNumberLess(minNumber: Int, maxNumber: Int) -> [Int] {
        var array:[Int] = []
        for i in minNumber...(maxNumber - 1) {
            array.append(i)
        }
        return array
    }
}
