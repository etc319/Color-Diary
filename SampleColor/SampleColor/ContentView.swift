//
//  ContentView.swift
//  SampleColor
//
//  Created by Nien Lam on 4/14/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

//make struct to contain list of dates and colors

//observed object here and then pass to the two views

struct ColorInfo {
    var color: UIColor
    var date: Date
}

class ColorModel: ObservableObject {
    var pickedColors: [ColorInfo]

    init() {
        pickedColors = []
    }
    
    func addColor (newColor: UIColor) {
        let currentColorInfo = ColorInfo(color: newColor, date: Date())
        pickedColors.append(currentColorInfo)
    }
    
    func getColor(index: Int)-> UIColor {
        return pickedColors[index].color
    }
    
//    func getRGB (index: Int) -> String {
//        let target = pickedColors[index]
//        // let's move the true color logic here
//        return "100, 40, 245"
//    }
    
}

struct ContentView: View {
    @State private var isActive: Bool = false
    @State private var isActiveDiary: Bool = false
    @ObservedObject var mycolors = ColorModel()
  //  @Binding var sampledUIColor: UIColor

    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: colorScreen(mycolors: $mycolors.pickedColors), isActive: self.$isActive) {
                    Text ("")
                }
                
                Button(action: {
                    self.isActive = true
                }) {
                    Text("Add Color")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .padding(10)
                    //.border(Color.purple, width: 5)
                }
                
                NavigationLink(destination: diaryScreen(mycolors: $mycolors.pickedColors), isActive: self.$isActiveDiary) {
                    Text ("")
                }
                
                Button(action: {
                    self.isActiveDiary = true
                }) {
                    Text("My Diary")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .padding(10)
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
