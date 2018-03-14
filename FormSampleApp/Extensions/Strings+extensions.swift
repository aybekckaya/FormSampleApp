//
//  Strings+extensions.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func localize()->String {
        return NSLocalizedString(self, comment: "")
    }
    
    func emailValidation()->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
     func passwordValidation()->Bool {
        return self.count > 3
    }
    
}

