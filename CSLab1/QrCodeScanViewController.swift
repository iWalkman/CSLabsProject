//
//  QrCodeScanViewController.swift
//  CSLab1
//
//  Created by Константин Фомин on 13/12/2018.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit
import iosMath

class QrCodeScanViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var equationView: MTMathUILabel!
    @IBOutlet var inputEquationLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputEquationLabel.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        equationView.latex = inputEquationLabel.text
        equationView.sizeToFit()
        return true
    }
}
