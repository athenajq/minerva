//
//  Reply.swift
//  git practice
//
//  Created by Elsa B on 4/22/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation
import Firebase

protocol HelpFirestore {
    init?(dictionary:[String:Any])
}

 
struct Reply {
    var name:String
    var content: String
    var timeStamp:Date
    
    var dictionary:[String:Any]{
        return [
            "name": name,
            "content": content,
            "timeStamp":timeStamp,
             
        ]
    }
}
extension Reply : HelpFirestore {
    init?(dictionary:[String:Any]){
        guard let name = dictionary["name"] as? String,
              let content = dictionary["content"] as? String,
              let timeStamp = dictionary ["timeStamp"] as? Date
        else {return nil}
        self.init(name: name, content: content, timeStamp: timeStamp)
            }
        }
