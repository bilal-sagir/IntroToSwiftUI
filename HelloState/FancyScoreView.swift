//
//  FancyScoreView.swift
//  HelloState
//
//  Created by Bilal on 2.04.2022.
//

import SwiftUI

struct FancyScoreView: View {
    
    //@Binding var score: Int
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        
        VStack {
            //Text("\(self.score)")
            Text("\(self.userSettings.score)")
            Button("Increment Score") {
                //self.score += 1
                self.userSettings.score += 1
            }.padding().background(.green)
        }.padding().background(.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
    }
}
