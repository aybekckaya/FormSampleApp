//
//  TextfieldFormCell.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import UIKit

class TextfieldFormCell: UICollectionViewCell {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    self.translatesAutoresizingMaskIntoConstraints = false
        let width = UIScreen.main.bounds.size.width - 16
        self.widthConstraint.constant = width
        self.layoutIfNeeded()
        
        tfInput.layer.borderWidth = 2
        tfInput.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func updateFromField(field:FormField , inputText:String) {
        self.heightConstraint.constant = 78
        self.layoutIfNeeded()
        
    }

}
