//
//  NetworkDao.swift
//  challenge2
//
//  Created by alexandre philippi on 07/05/18.
//  Copyright © 2018 alexandre philippi. All rights reserved.
//

import Foundation
import GoogleSignIn
import  SpriteKit

let networking = Network.instance

class Network: NSObject,GIDSignInDelegate {
    static var  instance = Network()
    
    override init() {
        super.init()
        GIDSignIn.sharedInstance().clientID = "156682853486-gctdtk4qni4cvi05c9olfdjs2s7uh8sf.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
        }
        else {
           Info.isLogged = true
        }
    }
}
