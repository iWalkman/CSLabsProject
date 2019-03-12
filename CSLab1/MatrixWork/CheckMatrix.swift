//
//  CheckMatrix.swift
//  CSLab1
//
//  Created by Константин Фомин on 03/12/2018.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class CheckMatrix: NSObject {
    static func checkMatrix(matrix: [[CLongDouble]]) -> Bool {
        for i in 0...(matrix.count-1){
            if (matrix[i][i] == 0 || (matrix[i].count - matrix.count) != 1 ){
                return false
            }
        }
        return true
    }
}
