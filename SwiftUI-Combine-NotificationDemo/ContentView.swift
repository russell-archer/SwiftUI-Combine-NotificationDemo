//
//  ContentView.swift
//  SwiftUI-Combine-NotificationDemo
//
//  Created by Russell Archer on 29/07/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//
// Tested and working with Xcode 11 Beta 6 on Mojave 10.14.6
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var model = ContentViewModel()  // Subscribe to changes to our model (i.e. new notifications)
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: View2()) {
                    Text("Goto View2")
                }
  
                List(model.notifications) { notification in
                    Text(notification)
                }
            }
            .navigationBarTitle(Text("Notification Center Demo"), displayMode: .inline)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
