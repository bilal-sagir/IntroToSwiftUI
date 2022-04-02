//
//  ContentView.swift
//  HelloState
//
//  Created by Bilal on 2.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "John"
    
    var body: some View {
        VStack{
            Text(name)
                .font(.largeTitle)
            
            Button("Change Name") {
                self.name = "Mary"
            }
        }
    }
}

struct ContentView2: View {
    
    @State var tasks = [Task]()
    
    private func addTask(){
        self.tasks.append(Task(name: "Wash the car"))
        
    }
    
    var body: some View {
        
        List{
            Button("Add Task") {
                addTask()
            }
            ForEach(tasks){ task in
                Text(task.name)
            }
        }
    }
}

struct ContentView3: View {
    
    var model = Dish.all()
    
    @State private var isSpicy = false
    
    
    var body: some View {
 
        List{
            
            Toggle(isOn: $isSpicy) {
                Text("Spicy")
                    .font(.title)
            }
            
            ForEach(model.filter { $0.isSpicy == self.isSpicy }){ dish in
                
                HStack{
                    Image(dish.imageURL)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(dish.name)
                        .font(.title)
                        .lineLimit(nil)
                    
                    Spacer()
                    
                    if(dish.isSpicy){
                        Image("spicy-icon")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                }
            }
        }
    }
}

struct ContentView4: View {
    
    @State var name: String = ""
    
    private func printName(){
        print(self.name)
    }
    
    var body: some View {
        
        VStack {
            Text(name)
            TextField("Enter name", text: $name)
                .padding(12)
            
            Button("Show Name Value") {
                printName()
            }
            
        }
    }
}

struct ContentView5: View {
    
    let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2019")
    
    @State private var isPlaying = false
    
    var body: some View {
        
        VStack {
            
            Text(self.episode.name)
                .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            
            Text(self.episode.track)
                .foregroundColor(.secondary)
            
            PlayButton(isPLaying: $isPlaying)
        }
    }
}

struct PlayButton: View{ // Binding
    
    @Binding var isPLaying: Bool
    
    var body: some View{
        
        Button("Play") {
            self.isPLaying.toggle()
        }
        .padding(12)
    }
}

struct ContentView6: View { // Observable object
    
    @ObservedObject var fancyTimer = FancyTimer()
    
    var body: some View {
        
        Text(" \(self.fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct ContentView7: View {
    
    //@ObservedObject var userSettings = UserSettings()
    @EnvironmentObject var userSettings: UserSettings
    
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)
            
            
            Button("Increment Score") {
                self.userSettings.score += 1
            }
            
            //FancyScoreView(score: self.$userSettings.score)
            FancyScoreView()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let userSettings = UserSettings()
        ContentView()
        ContentView2()
        ContentView3()
        ContentView4()
        ContentView5()
        ContentView6()
        ContentView7().environmentObject(userSettings)
    }
}
