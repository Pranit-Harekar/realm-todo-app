//
//  Constants.swift
//  RealmToDoApp_Example
//
//  Created by Pranit  Harekar on 4/28/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct Constants {
    static let MY_INSTANCE_ADDRESS = "realmtodoapp.us1.cloud.realm.io"
    static let AUTH_URL = URL(string: "https://\(MY_INSTANCE_ADDRESS)")!
    static let REALM_URL = URL(string: "realms://\(MY_INSTANCE_ADDRESS)/ToDo")!
}
