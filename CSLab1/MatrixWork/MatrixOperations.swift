//
//  MatrixOperations.swift
//  CSLab1
//
//  Created by Константин Фомин on 03/12/2018.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class MatrixOperations: NSObject {
    
    static func  multiple(aMatrix: [[CLongDouble]], bMatrix: [CLongDouble]) -> [[CLongDouble]] {
        var finalMatrix = [[CLongDouble]]()
        
        for row in aMatrix{
            let rowOfSummingElements = zip(row, bMatrix).map(*)
            finalMatrix.append([rowOfSummingElements.reduce(0, +)])
        }
        
        return finalMatrix
    }
    
    static func  transpon(matrix: [[CLongDouble]]) -> [[CLongDouble]]{
        var finalMatrix = Array(repeating: Array(repeating: CLongDouble(0.0), count:  matrix.count), count: matrix.count)
        
        for i in 0..<matrix.count{
            for j in 0..<matrix.count{
                finalMatrix[j][i] = matrix[i][j]
            }
        }
        return finalMatrix
    }
    
    static func  createBcoef(aMatrix: [[CLongDouble]], bMatrix: [CLongDouble] ) -> [CLongDouble]{
        var bCoef = [CLongDouble]()
        
        for i in 0..<bMatrix.count{
            bCoef.append(bMatrix[i]/aMatrix[i][i])
        }
        
        return bCoef
    }
    
    static func  createAlpfaCoef(aMatrix: [[CLongDouble]], bMatrix: [CLongDouble] ) -> [[CLongDouble]]{
        
        var finalMatrix = Array(repeating: Array(repeating: CLongDouble(0.0), count:  aMatrix.count), count: aMatrix.count)
        for i in 0..<aMatrix.count{
            for j in 0..<aMatrix.count{
                if i == j {
                    finalMatrix[i][j] = 0
                } else {
                    finalMatrix[i][j] = -1 * (aMatrix[i][j]/aMatrix[i][i])
                }
            }
        }
        
        return finalMatrix
    }
}
