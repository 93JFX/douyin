//
//  Comment.swift
//  myDouyin
//
//  Created by jfx on 2019/12/5.
//  Copyright © 2019 zkbc. All rights reserved.
//

import Foundation
//评论
struct Comment:Codable {
    var text : String
    var digg_count : Int
    var create_time : Int
    var user:User
    var reply_comment:[Comment]?
}
//评论数
struct Comments:Codable {
    var comments :[Comment]
    
}
