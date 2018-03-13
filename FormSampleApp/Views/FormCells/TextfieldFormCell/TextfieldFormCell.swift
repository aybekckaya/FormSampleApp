//
//  TextfieldFormCell.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import UIKit

protocol TextfieldFormCellDelegate {
    func textFieldDidChanged(field:FormField , currentText:String)
    func textFieldDidChangedValidation(field:FormField , currentText:String , validation:Bool)
}


class TextfieldFormCell: UICollectionViewCell, UITextFieldDelegate {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var viewTFOuter: UIView!
    
    private var currentField:FormField?
    var delegateCell:TextfieldFormCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    self.translatesAutoresizingMaskIntoConstraints = false
        let width = UIScreen.main.bounds.size.width - 16
        self.widthConstraint.constant = width
        self.layoutIfNeeded()
        
      viewTFOuter.layer.borderWidth = 1
      viewTFOuter.layer.borderColor = UIColor.textfieldBGColor().cgColor
    }
    
    func updateFromField(field:FormField , inputText:String) {
        currentField = field
        self.heightConstraint.constant = 78
        self.lblTitle.text = field.titleText
        self.tfInput.placeholder = field.placeholder
        self.tfInput.isSecureTextEntry = field == FormField.password
        self.tfInput.autocorrectionType = .no
        self.tfInput.autocapitalizationType = .none
        self.tfInput.text = inputText.isEmpty ? "" : inputText
        self.tfInput.delegate = self
        self.layoutIfNeeded()
        self.tfInput.addTarget(self, action: #selector(textFieldOnChange), for: UIControlEvents.editingChanged)
        // buranın altına SAKIN birşey yazma , yanarsın .
        guard let delegate = self.delegateCell , let field = currentField else { return }
        delegate.textFieldDidChanged(field: field, currentText: inputText)
    }
    
    @objc func textFieldOnChange() {
        guard let delegate = self.delegateCell , let field = currentField  , let text = self.tfInput.text else { return }
        delegate.textFieldDidChanged(field: field, currentText: text)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.viewTFOuter.layer.borderColor = UIColor.textfieldDefaultBorderColor().cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let delegate = self.delegateCell , let field = currentField ,let text = self.tfInput.text  else { return }
        let validationResult = validate()
        delegate.textFieldDidChangedValidation(field: field, currentText: text, validation: validationResult)
       viewTFOuter.layer.borderColor = validationResult == true ? UIColor.textfieldDefaultBorderColor().cgColor : UIColor.textfieldErrorBorderColor().cgColor
    }
    
    private func validate()->Bool {
        guard let field = currentField , let text = self.tfInput.text, !text.isEmpty  else { return false }
        if field == .email {
            return emailValidation(text: text)
        }
        else if field == .password {
            return passwordValidation(text: text)
        }
        
        return false
    }
    
    private func emailValidation(text:String)->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    
    private func passwordValidation(text:String)->Bool {
        return text.count > 3
    }
    
}
