//
//  Post.swift
//  SwiftAlpsClient
//
//  Created by João Pereira on 10/11/16.
//  Copyright © 2016 Badoo. All rights reserved.
//

import Foundation

#if !CLIENT
    import PerfectLib
#endif

class Post: JSONConvertibleObject {
    static let registerName = "post"

    var id:String = ""
    var date:TimeInterval = 0
    var draft = true
    var title:String = ""
    var body:String = ""
//    let comments:[Comment]

    override func setJSONValues(_ values: [String : Any]) {
        self.id = getJSONValue(named: "id", from: values, defaultValue: "")
        self.date = getJSONValue(named: "date", from: values, defaultValue: 0)
        self.draft = getJSONValue(named: "draft", from: values, defaultValue: true)
        self.title = getJSONValue(named: "title", from: values, defaultValue: "")
        self.body = getJSONValue(named: "body", from: values, defaultValue: "")
    }

    override func getJSONValues() -> [String : Any] {
        return [
            JSONDecoding.objectIdentifierKey:Post.registerName,
            "id":id,
            "date":date,
            "draft":draft,
            "title":title,
            "body":body
        ]
    }
}
