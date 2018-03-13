//
//  ButtonFormCell.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import UIKit

protocol ButtonFormCellDelegate {
    func buttonFormCellOnTap(field:FormField)
}


class ButtonFormCell: UICollectionViewCell {

    @IBOutlet weak var btnFormCell: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    var delegateCell:ButtonFormCellDelegate?
    private var currentField:FormField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.translatesAutoresizingMaskIntoConstraints = false
        let width = UIScreen.main.bounds.size.width - 16
        self.widthConstraint.constant = width
        self.layoutIfNeeded()
    }
    
    @IBAction func buttonFormCellOnTap(_ sender: Any) {
        guard let delegate = delegateCell , let field = currentField else { return }
        delegate.buttonFormCellOnTap(field: field)
    }
    func updateWith(field:FormField) {
        self.heightConstraint.constant = 66
        self.currentField = field
        
        self.btnFormCell.backgroundColor = field == .hemenUyeOl ? UIColor.backgroundColor() : UIColor.morhipoPurpleColor()
       self.btnFormCell.setTitle(field.titleText, for: UIControlState.normal)
        self.btnFormCell.setTitleColor(field == .hemenUyeOl ? UIColor.morhipoPurpleColor():UIColor.backgroundColor() , for: UIControlState.normal)
        
        self.btnFormCell.titleLabel?.text = field.titleText
        
        self.layoutIfNeeded()
    }

}
