//
//  MatrixOperationsViewController.swift
//  CSLab1
//
//  Created by Константин Фомин on 03/12/2018.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit
import iosMath

class MatrixOperationsViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    @IBOutlet var answerTextField: UITextView!
    @IBOutlet var matrixSizeTextField: UITextField!
    @IBOutlet var matrixTextView: UITextView!
    @IBOutlet var calculateButton: UIButton!
    @IBOutlet var epsilonTextField: UITextField!
    
    
    
    @IBAction func calculate(_ sender: Any) {
        
        let matrixParsed = MatrixParser(matrixString: matrixTextView.text)
        
        if CheckMatrix.checkMatrix(matrix: matrixParsed.matrix! ){
            self.calculateRoots(matrix: matrixParsed.matrix!)
        } else {
            useAlert()
        }
        
        matrixTextView.resignFirstResponder()
    }
    
    func useAlert(){
        let alert = UIAlertController(title: "Not Normal Matrix", message: "Check settings.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func calculateRoots(matrix : [[CLongDouble]]) {
        
        let eps = CLongDouble(epsilonTextField.text!)
        
        if eps == nil {
            useAlert()
            return
        }
        
        let (aMatrix, bMatrix) =  ParseMatrix.splitMatrix(matrix: matrix)
        
        var alphaMatrix = MatrixOperations.createAlpfaCoef(aMatrix: aMatrix, bMatrix: bMatrix)
        var bettaMatrix = MatrixOperations.createBcoef(aMatrix: aMatrix, bMatrix: bMatrix)
        
        var oldBMatrix = MatrixOperations.multiple(aMatrix: alphaMatrix, bMatrix: bettaMatrix)
        var currentEps = CLongDouble(0.0)
        var finalX = Array(repeating: CLongDouble(0.0), count:  bettaMatrix.count)
        
        repeat {
            let oldBMatrix =  bettaMatrix
            finalX = zip(oldBMatrix, finalX).map{$0 + $1}
            bettaMatrix = MatrixOperations.multiple(aMatrix: alphaMatrix, bMatrix: bettaMatrix).map{ $0[0]}
            currentEps =  zip(oldBMatrix, bettaMatrix).map{ abs($0 - $1) }.max()!
        } while currentEps > eps!
        
        finalX = zip(bettaMatrix, finalX).map{$0 + $1}
        
        var answer = ""
        
        for row in finalX{
            answer += ( String(row) + "\n")
        }
        
        answerTextField.text = answer
        
        
    }
    
    var matrixSize : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.matrixSizeTextField.delegate = self
        self.matrixTextView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        matrixSize =  Int(matrixSizeTextField.text!)
        return true
    }

    @IBAction func randmMatrixGenerate(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
