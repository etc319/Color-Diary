//
//  colorScreen.swift
//  SampleColor
//
//  Created by Elizabeth Chiappini on 4/14/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct colorScreen: View {
    //    @State var sampledColor: Color = .gray
    @State var sampledUIColor: UIColor = .gray
    // @Binding var count: Int
    @Binding var mycolors: [ColorInfo]

    
    var trueColorRed: CGFloat {
        let redColor = CGFloat (sampledUIColor.rgba.red)
        print("redColor", redColor)
        let multipliedColor = redColor * 255
        return multipliedColor
    }
    var trueColorGreen: CGFloat {
        let greenColor = sampledUIColor.rgba.green
        print("greenColor", greenColor)
        let multipliedColor = greenColor * 255
        return multipliedColor
    }
    var trueColorBlue: CGFloat {
        let blueColor = sampledUIColor.rgba.blue
        print("blueColor", blueColor)
        let multipliedColor = blueColor * 255
        return multipliedColor
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Image("tree-square")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipped()
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged { value in
                            // Get position of tap.
                            let tapPosition = value.startLocation
                            //print("Tap position:", tapPosition)
                            
                            // Get sample image.
                            let image = UIImage(named: "tree-square")!
                            
                            // Scale tap position to image resolution.
                            let xCoordinate = tapPosition.x * (image.size.width/300.0)
                            let yCoordinate = tapPosition.y * (image.size.width/300.0)
                            let scaledPosition = CGPoint(x: xCoordinate, y: yCoordinate)
                            
                            // Get pixel color and update state.
                            let color = image.getPixelColor(pos: scaledPosition)
                            self.sampledUIColor = color
                    })
                Color(self.sampledUIColor)
                    .frame(width: 200, height: 100)
                    .padding()
                
                .onTapGesture(count: 2, perform: {
                    let currentColorInfo = ColorInfo(color: self.sampledUIColor, date: Date())
                    self.mycolors.append(currentColorInfo)
                })
                
                // Text("\(self.sampledUIColor.rgba.red)")
                Text("\(trueColorRed, specifier: "%.0f"), \(trueColorGreen, specifier: "%.0f"), \(trueColorBlue, specifier: "%.0f")")
                
                //                Button(action: {
                //                }) {
                //                }
            }
            
        }
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}


//struct colorScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        colorScreen()
//    }
//}
