//
//  InitialViewController.swift
//  challenge2
//
//  Created by alexandre philippi on 10/05/18.
//  Copyright © 2018 alexandre philippi. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController,BluetoothAlerts {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func messageAlert(mesage: String) {
        print(mesage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
