//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


JSONDecoding.registerJSONDecodable(name: User.registerName, creator: { return User() })
JSONDecoding.registerJSONDecodable(name: Post.registerName, creator: { return Post() })


// Create HTTP server.
let server = HTTPServer()

// Register your own routes and handlers
var routes = Routes()
routes.add(method: .get, uri: "/login", handler: {
		request, response in


//    JSONDecoding.createJSONConvertibleObject(name: User.registerName, values: [:])

        if let userId = request.param(name: "token") {
            do {
                let userPosts = File("\(request.documentRoot)/\(userId)")
                let size = userPosts.size
                let bytes = try userPosts.readSomeBytes(count: size)
                response.setHeader(.contentType, value: "text/json")
                response.setHeader(.contentLength, value: "\(bytes.count)")
                response.setBody(bytes: bytes)
            } catch {
                response.status = .internalServerError
                response.setBody(string: "Error handling request: \(error)")
            }
        }
        response.completed()
    }
)

routes.add(method: .post, uri: "/post/addPost", handler: {
    request, response in

    if let post = request.postBodyString, let userId = request.param(name: "token") {
        do {
            let userPosts = File("\(request.documentRoot)/\(userId)")
            let size = userPosts.size
            let currentPosts = try userPosts.readString()

            let decoded = try currentPosts.jsonDecode() as? [String:Any]
            // TODO: Add new post to the end
        } catch {
            response.status = .internalServerError
            response.setBody(string: "Error handling request: \(error)")
        }
    }

    response.completed()
}
)

// Add the routes to the server.
server.addRoutes(routes)

// Set a listen port of 8181
server.serverPort = 8181

// Set a document root.
// This is optional. If you do not want to serve static content then do not set this.
// Setting the document root will automatically add a static file handler for the route /**
server.documentRoot = "./webroot"

// Gather command line options and further configure the server.
// Run the server with --help to see the list of supported arguments.
// Command line arguments will supplant any of the values set above.
configureServer(server)

do {
	// Launch the HTTP server.
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
