//
//  UIImage+.swift
//  SampleColor
//
//  Created by Nien Lam on 4/14/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {

        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)

        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4

        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        //print("red", r, "green", g, "blue", b)

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
