//
//  DouyinNetWork.swift
//  myDouyin
//
//  Created by jfx on 2019/11/29.
//  Copyright © 2019 zkbc. All rights reserved.
//

import Foundation
import Just
struct DouyinURL {
   static let baseLocal = "http://127.0.0.1:5500/"
   static let feedFile = "feed.json"
    static let commentLocal = URL(string: baseLocal + "/comment/xsy.json")!
    
}

typealias SuccessWithJson  = (Any?)->Void

struct DouyinNetWork {
    static let ERR = "json获取错误"
    static func getComment(url:URL,success:@escaping SuccessWithJson){
        DouyinNetWork.getJson(url: DouyinURL.commentLocal, success: success)
    }
    static func getJson(url:URL,success:@escaping SuccessWithJson){
        Just.get(url){
            (r) in
            if r.ok{
                success(r.content)
            }else{
                debugPrint(DouyinNetWork.ERR,r.reason)
            }
            
        }
    }
}
