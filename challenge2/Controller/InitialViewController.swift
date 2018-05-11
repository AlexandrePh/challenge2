//
//  InitialViewController.swift
//  challenge2
//
//  Created by alexandre philippi on 10/05/18.
//  Copyright © 2018 alexandre philippi. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController,BluetoothDelegate {
    func messageAlert(message: String) {
        showAlert(message: message)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bluetooth.bluetoothDelegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func showAlert(message:String){
        
        let alert = UIAlertController(title: "Sucesso!!", message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                print(">>>>>>>>>>Olá!!!")
                
            }))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
      
        
    }
    
    
    
    
    
    



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
