//
//  Helper.swift
//  myDouyin
//
//  Created by jfx on 2019/12/3.
//  Copyright © 2019 zkbc. All rights reserved.
//

import Foundation
extension Int{
    var toWanStr: String {
        if self > 10000{
            let a = Double(exactly: self)!/10000.0
            return round(a).description + "W"
            
        }
        return self.description
    }
    
}

