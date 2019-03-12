//
//  MatrixParser.swift
//  CSLab1
//
//  Created by Константин Фомин on 03/12/2018.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class MatrixParser: NSObject {
    
    var matrix : [[CLongDouble]]?
    init(matrixString: String) {
        
        var finalMatrix = [[CLongDouble]]()
        let rowStringArray = matrixString.components(separatedBy: "\n").map{ $0.components(separatedBy: " ")}
        for row in rowStringArray{
            finalMatrix.append(row.map{CLongDouble($0)!})
        }
        self.matrix = finalMatrix

    }

}
