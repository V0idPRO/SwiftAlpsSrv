//
//  Post.swift
//  SwiftAlpsClient
//
//  Created by João Pereira on 10/11/16.
//  Copyright © 2016 Badoo. All rights reserved.
//

import Foundation

struct Post {
    let id:String
    let date:Date
    var draft = true
    var title:String
    var body:String
    let comments:[Comment]
}
