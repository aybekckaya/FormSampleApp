//
//  LoginVC.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 11/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import UIKit

typealias FormFieldInput = (text:String , success:Bool)

class LoginVC: UICollectionViewController   {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    fileprivate var arrFormFields:[FormField] = [FormField.email , FormField.password , FormField.sifremiUnuttum , FormField.uyeGirisiBtn , FormField.hemenUyeOl ]
    fileprivate var dctFormFields:[String:FormFieldInput] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpFormFields()
        self.flowLayout.minimumInteritemSpacing = 0
        self.flowLayout.minimumLineSpacing = 0
        self.flowLayout.sectionInset = UIEdgeInsetsMake(8, 0, 8, 0)
    }

    private func setUpUI() {
        self.view.backgroundColor = UIColor.backgroundColor()
        self.collectionView?.backgroundColor = UIColor.clear
        self.title = "uye-girisi".localize()
        self.collectionView?.delegate = self
    }
    
    private func setUpFormFields() {
        for index in 0..<arrFormFields.count {
            let field:FormField = arrFormFields[index]
            let formInput:FormFieldInput = (text:"" , success:false)
            dctFormFields[field.identifier] = formInput
            self.collectionView?.register(field.nib, forCellWithReuseIdentifier: field.cellIdentifier)
        }
        self.collectionView?.reloadData()
        if let layout = self.flowLayout {
            layout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFormFields.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let field:FormField = arrFormFields[indexPath.row]
        switch field {
        case .email:
            return emailField(field: field, indexPath: indexPath)
        case .password:
            return passwordField(field: field, indexPath: indexPath)
        case .sifremiUnuttum:
            return sifremiUnuttumField(field: field, indexPath: indexPath)
        case .hemenUyeOl , .uyeGirisiBtn:
            return buttonFormCell(field: field, indexPath: indexPath)
        }
    }

    
    private func buttonFormCell(field:FormField , indexPath:IndexPath)->ButtonFormCell {
        let cell:ButtonFormCell = collectionView?.dequeueReusableCell(withReuseIdentifier: field.cellIdentifier, for: indexPath) as! ButtonFormCell
        cell.updateWith(field: field)
        cell.delegateCell = self
        return cell
    }
    
    private func emailField(field:FormField , indexPath:IndexPath)->TextfieldFormCell {
        let cell:TextfieldFormCell = collectionView?.dequeueReusableCell(withReuseIdentifier: field.cellIdentifier, for: indexPath) as! TextfieldFormCell
        cell.updateFromField(field: field, inputText: "")
        cell.delegateCell = self
        return cell
    }
    
    private func passwordField(field:FormField , indexPath:IndexPath)->TextfieldFormCell {
        let cell:TextfieldFormCell = collectionView?.dequeueReusableCell(withReuseIdentifier: field.cellIdentifier, for: indexPath) as! TextfieldFormCell
       cell.updateFromField(field: field, inputText: "")
        cell.delegateCell = self
        return cell
    }
    
    private func sifremiUnuttumField(field:FormField , indexPath:IndexPath)->TextButtonFormCell {
        let cell:TextButtonFormCell = collectionView?.dequeueReusableCell(withReuseIdentifier: field.cellIdentifier, for: indexPath) as! TextButtonFormCell
        cell.updateWith(field: field)
        cell.delegateCell = self
        return cell
    }
}


extension LoginVC: TextButtonFormCellDelegate, ButtonFormCellDelegate , TextfieldFormCellDelegate {
    func textButtonFormCellOnTap(field: FormField) {
        
    }
    
    func buttonFormCellOnTap(field: FormField) {
        if field == .uyeGirisiBtn {
            self.view.endEditing(true)
        }
    }
    
    func textFieldDidChanged(field: FormField, currentText: String) {
        
    }
    
    func textFieldDidChangedValidation(field: FormField, currentText: String, validation: Bool) {
        dctFormFields[field.identifier] = (text:currentText , success:validation)
    }
    
    
}


