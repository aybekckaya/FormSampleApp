//
//  UIViewController+extensions.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 14/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertView(alertMessage message:String, alertTitle title:String = "Error".localize() , alertStyle style:UIAlertControllerStyle = .alert , cancelButtonTitle cancelTitle:String = "Cancel".localize() , otherButtonTitles otherTitles:[String] = [] , cancelBlock:@escaping ()->Void  , tapBlock:@escaping (Int)->() ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { action in
            cancelBlock()
        }
        alertController.addAction(cancelAction)
        
        for index in 0..<otherTitles.count {
            let action = UIAlertAction(title: otherTitles[index], style: .default, handler: { action in
                tapBlock(index)
            })
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
