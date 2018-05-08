//
//  InitialViewController.swift
//  challenge2
//
//  Created by alexandre philippi on 07/05/18.
//  Copyright © 2018 alexandre philippi. All rights reserved.
//

import UIKit
import GoogleSignIn

class InitialViewController: UIViewController, GIDSignInUIDelegate{
    
    @IBOutlet weak var googleButton: GIDSignInButton!
    
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = networking
        GIDSignIn.sharedInstance().uiDelegate = self
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fuck), userInfo: nil, repeats: true)
        
    }
    
    @objc func fuck(){
        if Info.isLogged {
        self.performSegue(withIdentifier: "aSegue", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
