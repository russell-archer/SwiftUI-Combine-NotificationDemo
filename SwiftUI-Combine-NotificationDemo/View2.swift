//
//  View2.swift
//  SwiftUI-Combine-NotificationDemo
//
//  Created by Russell Archer on 29/07/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import SwiftUI
import Combine

struct View2: View {
    public static let notificationName = Notification.Name("View2Msg")

    var body: some View {
        VStack {
            Text("View2").font(.headline)
            Button("Send Message to ContentView") {
                NotificationCenter.default.post(name: View2.notificationName, object: "Hello from View2 at \(Date())")
            }
        }
    }
}

#if DEBUG
struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
#endif
