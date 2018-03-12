//
//  UIViewControllerProtocol.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 11/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import Foundation
import UIKit

protocol NameResolvable {
    static var className:String { get }
}


extension NameResolvable {
    static var className:String {
        return String(describing: self)
    }
}


extension UIViewController:NameResolvable {}
extension UICollectionViewCell:NameResolvable {}
