//
//  Strings+extensions.swift
//  FormSampleApp
//
//  Created by aybek can kaya on 12/03/2018.
//  Copyright © 2018 aybek can kaya. All rights reserved.
//

import Foundation


extension String {
    func localize()->String {
        return NSLocalizedString(self, comment: "")
    }
}
