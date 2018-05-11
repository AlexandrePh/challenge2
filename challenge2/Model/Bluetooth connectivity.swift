//
//  Bluetooth connectivity.swift
//  challenge2
//
//  Created by alexandre philippi on 09/05/18.
//  Copyright © 2018 alexandre philippi. All rights reserved.
//

import Foundation
import MultipeerConnectivity

protocol BluetoothDelegate {
    func messageAlert(message: String)
}


let bluetooth = BluetoothConnectivity.sharedInstance

class BluetoothConnectivity: NSObject, MCSessionDelegate, MCNearbyServiceBrowserDelegate{
    
    static var sharedInstance = BluetoothConnectivity()
    
    var peerID:MCPeerID!
    var mcSession:MCSession!
    var mcBrowser:MCNearbyServiceBrowser!
    var advertiser:MCNearbyServiceAdvertiser!
    
    var bluetoothDelegate:BluetoothDelegate?
    
    var serviceType = "trolling"
    
   
    
    private override init() {
        super.init()
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        
        startAvertiser()
        
        
    }
    func startBrowser(){
        mcBrowser = MCNearbyServiceBrowser.init(peer: peerID, serviceType: serviceType)
        mcBrowser.delegate = self
        mcBrowser.startBrowsingForPeers()
        
        
    }
    func startAvertiser(){
        advertiser = MCNearbyServiceAdvertiser.init(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        enable()
    }
    
    
    func enable(){
       advertiser.startAdvertisingPeer()
    }
    
    func disable()  {
       advertiser.startAdvertisingPeer()
    }
    
    
    
    
    
    //MARK: - BlutoothAlerts protocol CALL
    private func showMessage(){
        if let alertsObject = self.bluetoothDelegate {
            alertsObject.messageAlert(message: Info.message)
        }
    }
    
    
    //MARK: - MCNearbyServiceBrowserDelegate
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        let data:Data = Data(base64Encoded: Info.message)!
        
        
        mcBrowser.invitePeer(peerID, to: mcSession, withContext: data, timeout: 10)
        
    }
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        
    }
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        
    }
    
    //MARK: - MCSessionDelegate implementation
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
            let message =  try JSONDecoder().decode(String.self, from: data)
            Info.message = message
            
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
