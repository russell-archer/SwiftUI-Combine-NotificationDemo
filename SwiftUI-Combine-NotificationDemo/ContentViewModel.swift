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
    var notifications = [String]()
    var newNotification: String? {
        didSet {
            guard newNotification != nil else { return }
            
            notifications.append(newNotification!)
            hasNewNotifications = true
            print("New notification: \(newNotification!)")
        }
    }
    
    @Published var hasNewNotifications = false
    
    init() {
        notificationSub = NotificationCenter.default
            .publisher(for: View2.notificationName)
            .map { notification in notification.object as? String }
            .assign(to: \ContentViewModel.newNotification, on: self)
    }
}

extension String: Identifiable {
    public var id: String {
        return UUID().uuidString
    }
}
