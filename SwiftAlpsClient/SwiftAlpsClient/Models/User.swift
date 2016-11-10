//
//  User.swift
//  SwiftAlpsClient
//
//  Created by João Pereira on 10/11/16.
//  Copyright © 2016 Badoo. All rights reserved.
//

import Foundation

#if !CLIENT
    import PerfectLib
#endif

class User: JSONConvertibleObject {
    static let registerName = "user"

    var id:String = ""
    var name:String = ""

    override func setJSONValues(_ values: [String : Any]) {
        self.id = getJSONValue(named: "id", from: values, defaultValue: "")
        self.name = getJSONValue(named: "name", from: values, defaultValue: "")
    }

    override func getJSONValues() -> [String : Any] {
        return [
            JSONDecoding.objectIdentifierKey:User.registerName,
            "id":id,
            "name":name
        ]
    }
}
