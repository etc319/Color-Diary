//
//  diaryScreen.swift
//  SampleColor
//
//  Created by Elizabeth Chiappini on 4/14/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct diaryScreen: View {
    @State private var isActive: Bool = false
    @State var isPresented = false
    @State var presentedColor: UIColor = .gray
    //@Binding var sampledUIColor: UIColor
    
    let count = 1
    @Binding var mycolors: [ColorInfo]
  
    var myColorsChunked: [[ColorInfo]] {
        return mycolors.chunked(into: 4)
       }
    
    
//    var trueColorRed: CGFloat {
//         let redColor = CGFloat (sampledUIColor.rgba.red)
//         print("redColor", redColor)
//         let multipliedColor = redColor * 255
//         return multipliedColor
//     }
//     var trueColorGreen: CGFloat {
//         let greenColor = sampledUIColor.rgba.green
//         print("greenColor", greenColor)
//         let multipliedColor = greenColor * 255
//         return multipliedColor
//     }
//     var trueColorBlue: CGFloat {
//         let blueColor = sampledUIColor.rgba.blue
//         print("blueColor", blueColor)
//         let multipliedColor = blueColor * 255
//         return multipliedColor
//     }
//
    
    
    var body: some View {
        // colorScreen(count: $count)
        
        NavigationView {
            ScrollView(.vertical){
                VStack (alignment: .leading){
                    ForEach(myColorsChunked.indices, id: \.self) { rowIndex in
                        HStack {
                            ForEach(self.myColorsChunked[rowIndex].indices, id: \.self) { columnIndex in
                            Button(action: {
                                self.isPresented.toggle()
                                self.presentedColor = self.myColorsChunked[rowIndex][columnIndex].color
                            }, label: {
                                Circle()
                                    .fill(Color(self.myColorsChunked[rowIndex][columnIndex].color))
                                    .frame(width: 80, height: 80)})
                        }
                        .navigationBarTitle("Lizzy's Color Diary")
                            .sheet(isPresented: self.$isPresented, content: {
                                Spacer()
                                Circle()
                                    .fill(Color(self.presentedColor))
                                    .frame(width: 250, height: 250)
                                Text ("Color ID Here")
//                                Text("\(self.trueColorRed, specifier: "%.0f"), \(self.trueColorGreen, specifier: "%.0f"), \(self.trueColorBlue, specifier: "%.0f")")
//                                    .font(.largeTitle)
                                Spacer()
                            })
                        
                        //logic for grid using Vstack and Hstack
                    }
                }
                //make new variable outside of for each in body which is current date
                //for each color in mycolors: if current date is ! = to color.date (self.mycolor[i]) then make a new vstack else
                //each time looped update the current date variable update to color.date
            }
        }
    }
}
}
//}

//struct diaryScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        diaryScreen()
//    }
//}
