//
//  Bluetooth connectivity.swift
//  challenge2
//
//  Created by alexandre philippi on 09/05/18.
//  Copyright © 2018 alexandre philippi. All rights reserved.
//

import Foundation
import MultipeerConnectivity

protocol BluetoothAlerts {
    func messageAlert(mesage: String)
}

class BluetoothConnectivity: NSObject, MCSessionDelegate{
    
    var peerID:MCPeerID!
    var mcSession:MCSession!
    var mcAdvertiserAssistant:MCAdvertiserAssistant!
    
    var alerts:BluetoothAlerts?
    
    
    private override init() {
        super.init()
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self

        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "ba-td", discoveryInfo: nil, session: self.mcSession)
        mcAdvertiserAssistant.start()
    }
    
    
    func showMessage(){
        if let alertsObject = self.alerts {
            alertsObject.messageAlert(mesage: Info.messageReceived)
        }
    }
    
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case MCSessionState.connected:
            print("Connected: \(peerID.displayName)")
            
        case MCSessionState.connecting:
            print("Connecting: \(peerID.displayName)")
            
        case MCSessionState.notConnected:
            print("Not Connected: \(peerID.displayName)")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        do {
            Info.messageReceived = try JSONDecoder().decode(String.self, from: data)
            
            
        } catch  {
            fatalError()
        }
        showMessage()
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
    
}
