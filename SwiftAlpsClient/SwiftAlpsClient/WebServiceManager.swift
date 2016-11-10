//
//  WebServiceManager.swift
//  SwiftAlpsClient
//
//  Created by Michael Vilabrera on 11/10/16.
//  Copyright © 2016 Badoo. All rights reserved.
//

import Foundation

let localhost = "http://localhost:8000"

class WebServiceManager {
    
    func login(handle: String, completion: (_ success: Bool, _ message: String?) -> ()) {
        let loginObject = ["handle": handle]
        
        
    }
    
    private func get(request: NSMutableURLRequest, completion: (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
    private func post(request: NSMutableURLRequest, completion: (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }
    
    private func put(request: NSMutableURLRequest, completion: (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }
    
    private func delete(request: NSMutableURLRequest, completion: (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "DELETE", completion: completion)
    }
    
    private func clientURLRequest(path: String, params: Dictionary<String, AnyObject>? = nil) -> NSMutableURLRequest {
        
    }
    
    private func dataTask(request: MutableURLRequest, method: String, completion: (_ success: Bool, _ object: AnyObject?) -> ()) {
        request.httpMethod = method
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let solidRequest = request as? URLRequest
        
        session.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
    }
}
