//
//  FancyTimer.swift
//  HelloState
//
//  Created by Bilal on 2.04.2022.
//

import Foundation
import SwiftUI
import Combine

class FancyTimer: ObservableObject {
    
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            self.value += 1
            
        }
    }
}
