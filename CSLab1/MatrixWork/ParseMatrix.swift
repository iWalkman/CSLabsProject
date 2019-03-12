//
//  ParseMatrix.swift
//  CSLab1
//
//  Created by Константин Фомин on 03/12/2018.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class ParseMatrix: NSObject {
    
   static func splitMatrix(matrix:[[CLongDouble]]) -> ([[CLongDouble]], [CLongDouble]) {
        var bClolumn = [CLongDouble]()
        var finalMatrix = [[CLongDouble]]()
        
        for row in matrix{
            var rowCopy = row
            bClolumn.append(rowCopy.removeLast())
            finalMatrix.append(rowCopy)
        }
        return (finalMatrix, bClolumn)
        
    }
}
