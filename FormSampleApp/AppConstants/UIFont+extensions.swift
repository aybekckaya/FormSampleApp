//
//  UIFont+extensions.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import Foundation
import  UIKit

extension UIFont {
    static func regularFont(size:CGFloat)->UIFont {
       return UIFont(name: "Effra-Regular", size: size)!
    }
    
    static func lightFont(size:CGFloat)->UIFont {
        return UIFont(name: "EffraLight-Regular", size: size)!
    }
    
    static func boldFont(size:CGFloat)->UIFont {
        return UIFont(name: "Effra-Bold", size: size)!
    }
    
}
