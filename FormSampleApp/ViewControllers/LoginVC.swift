//
//  LoginVC.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 11/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import UIKit

class LoginVC: UICollectionViewController   {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    fileprivate var arrFormFields:[FormField] = [FormField.email , FormField.password ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpFormFields()
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
            self.collectionView?.register(field.nib, forCellWithReuseIdentifier: field.cellIdentifier)
        }
        self.collectionView?.reloadData()
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

    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath:  NSIndexPath) -> CGSize {
        
        return CGSize(width: 120, height:120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(20, 20, 20, 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let field:FormField = arrFormFields[indexPath.row]
        switch field {
        case .email:
            return emailField(field: field, indexPath: indexPath)
        case .password:
            return passwordField(field: field, indexPath: indexPath)
        default : return UICollectionViewCell()
        }
    }

    
    
    
    private func emailField(field:FormField , indexPath:IndexPath)->TextfieldFormCell {
        let cell:TextfieldFormCell = collectionView?.dequeueReusableCell(withReuseIdentifier: field.cellIdentifier, for: indexPath) as! TextfieldFormCell
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    private func passwordField(field:FormField , indexPath:IndexPath)->TextfieldFormCell {
        let cell:TextfieldFormCell = collectionView?.dequeueReusableCell(withReuseIdentifier: field.cellIdentifier, for: indexPath) as! TextfieldFormCell
        return cell
    }
    
    
    
    
}
