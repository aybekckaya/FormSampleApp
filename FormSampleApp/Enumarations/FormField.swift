//
//  FormField.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import Foundation
import UIKit



enum FormField {
    case email
    case password
    case uyeGirisiBtn
    case sifremiUnuttum
    case hemenUyeOl
}

extension FormField {
    
    var identifier:String {
        switch self {
        case .email: return "emailAddressField"
        case .password: return "passwordField"
        case .uyeGirisiBtn: return "uyeGirisiField"
        case .sifremiUnuttum: return "sifremiUnuttumField"
        case .hemenUyeOl: return "hemenUyeOlField"
        }
    }
    
    
    var nib:UINib {
        switch self {
        case .email , .password: return UINib(nibName: TextfieldFormCell.className, bundle: nil)
        case .sifremiUnuttum: return UINib(nibName: TextButtonFormCell.className, bundle: nil)
        case .hemenUyeOl , .uyeGirisiBtn : return UINib(nibName: ButtonFormCell.className, bundle: nil)
        }
    }
    
    var cellIdentifier:String {
        switch self {
        case .email , .password: return TextfieldFormCell.className
        case .sifremiUnuttum: return TextButtonFormCell.className
        case .hemenUyeOl , .uyeGirisiBtn : return ButtonFormCell.className
        }
    }
    
    var titleText:String {
        switch self {
        case .email: return "e-posta-adresiniz".localize()
        case .password: return "sifreniz-text".localize()
        case .uyeGirisiBtn: return "uye-girisi-btn-text".localize()
        case .sifremiUnuttum: return "sifremi-unuttum-text".localize()
        case .hemenUyeOl: return "hemen-uye-ol-btn-text".localize()
        }
    }
    
    var placeholder:String {
        switch self {
        case .email: return "e-posta-adresiniz".localize()
        case .password: return "sifreniz-text".localize()
        default: return ""
        }
    }
    
}

