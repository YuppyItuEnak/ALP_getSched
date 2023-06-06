////
////  WatchActivityViewModel.swift
////  WatchActivity Watch App
////
////  Created by MacBook Pro on 06/06/23.
////
//
//import Foundation
//import WatchConnectivity
//
//class WatchActivityViewModel: NSObject, WCSessionDelegate, ObservableObject {
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        if let error = error {
//            print("Session activation failed with error: \(error.localizedDescription)")
//        }else{
//            print("Success")
//        }
//    }
//    
//    private let activityKey = "savedActivities"
//    private var activities: [WatchActivityModel] = []
//    weak var delegate: WatchActivityViewModelDelegate?
//
//    override init() {
//        super.init()
//
//        if WCSession.isSupported() {
//            let session = WCSession.default
//            session.delegate = self
//            session.activate()
//        }
//    }
//
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//        if let receivedActivities = message["activities"] as? [WatchActivityModel] {
//            activities = receivedActivities
//            
//            delegate?.didReceiveUpdatedData(activities)
//        }
//    }
//    
//
//}
//
//protocol WatchActivityViewModelDelegate: AnyObject {
//    func didReceiveUpdatedData(_ activities: [WatchActivityModel])
//}
