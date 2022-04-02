//
//  HelloStateApp.swift
//  HelloState
//
//  Created by Bilal on 2.04.2022.
//

import SwiftUI

@main
struct HelloStateApp: App {
    
    let userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView7().environmentObject(userSettings)
        }
    }
}
