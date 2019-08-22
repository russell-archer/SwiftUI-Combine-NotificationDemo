//
//  ContentViewModel.swift
//  SwiftUI-Combine-NotificationDemo
//
//  Created by Russell Archer on 30/07/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    var notificationSub: AnyCancellable?
    var notifications = [String]()  // Holds a list of notifications received from View2 via NotificationCenter
    
    // By publishing this property we can ensure that our subscriber (ContentView) will be
    // re-rendered when the property changes (i.e. whenever there's a new notification)
    @Published var newNotification: String? {
        didSet {
            guard newNotification != nil else { return }
            
            notifications.append(newNotification!)
        }
    }
    
    init() {
        // Subscribe to "View2Msg" messages broadcast by NotificationCenter
        notificationSub = NotificationCenter.default.publisher(for: View2.notificationName)
            .map { notification in notification.object as? String }   // Transform the notification into a simple string
            .assign(to: \ContentViewModel.newNotification, on: self)  // Assign the msg to a property using a keypath
    }
}

extension String: Identifiable {
    public var id: String {
        return UUID().uuidString
    }
}
