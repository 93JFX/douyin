//
//  User.swift
//  myDouyin
//
//  Created by jfx on 2019/12/5.
//  Copyright © 2019 zkbc. All rights reserved.
//

import Foundation

struct User:Codable {
    var nickname:String
    var avatar_thumb:avatar_thumb
}

struct avatar_thumb:Codable {
    var url_list : [String]
    
}
