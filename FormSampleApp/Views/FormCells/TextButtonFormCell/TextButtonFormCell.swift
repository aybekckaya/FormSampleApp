//
//  TextButtonFormCell.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import UIKit

protocol TextButtonFormCellDelegate {
    func textButtonFormCellOnTap(field:FormField)
}

class TextButtonFormCell: UICollectionViewCell {

    @IBOutlet weak var widthConstraintFormBtnAction: NSLayoutConstraint!
    @IBOutlet weak var btnFormAction: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var heightConstraintContentView: NSLayoutConstraint!
    @IBOutlet weak var widthConstraintContentView: NSLayoutConstraint!
    
    var delegateCell:TextButtonFormCellDelegate?
    private var currentField:FormField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.translatesAutoresizingMaskIntoConstraints = false
        let width = UIScreen.main.bounds.size.width - 16
        self.widthConstraintContentView.constant = width
        self.layoutIfNeeded()
    }
    
    @IBAction func btnActionOnTap(_ sender: Any) {
        guard let delegate = self.delegateCell  , let field = currentField else { return }
        delegate.textButtonFormCellOnTap(field: field)
    }
    
    func updateWith(field:FormField) {
        heightConstraintContentView.constant = 46
        currentField = field
        lblTitle.text = field.titleText
        lblTitle.textColor = UIColor.morhipoPurpleColor()
        lblTitle.sizeToFit()
        widthConstraintFormBtnAction.constant = lblTitle.frame.size.width
    }

}
