//: Playground - noun: a place where people can play

import UIKit

struct ImageFilter{
    
    public func filter(filterMethod:FILTERMETHOD = FILTERMETHOD.fiftyPercentBright,uiImage:UIImage) -> RGBAImage {
        let myRGBA = RGBAImage(image: uiImage)!
        if(filterMethod==FILTERMETHOD.greyscale){
            for y in 0..<myRGBA.height {
                for x in 0..<myRGBA.width {
                    let index = y * myRGBA.width + x
                    var pixel = myRGBA.pixels[index]
                    let greyValue = (Double(pixel.R) * 0.2126) + (Double(pixel.G) * 0.7152) + (Double(pixel.B) * 0.0722)
                    pixel.R = UInt8(greyValue)
                    pixel.G = UInt8(greyValue)
                    pixel.B = UInt8(greyValue)
                    myRGBA.pixels[index] = pixel
                }
            }
        }
        else{
            for y in 0..<myRGBA.height {
                for x in 0..<myRGBA.width {
                    let index = y * myRGBA.width + x
                    var pixel = myRGBA.pixels[index]
                    pixel.R = UInt8(min(255, Double(pixel.R)*1.5))
                    pixel.G = UInt8(min(255, Double(pixel.G)*1.5))
                    pixel.B = UInt8(min(255, Double(pixel.B)*1.5))
                    myRGBA.pixels[index] = pixel
                }
            }
        }
        return myRGBA
    }
}

enum FILTERMETHOD{
    case greyscale, fiftyPercentBright
}

let image = UIImage(named: "sample")!

var imgFilter = ImageFilter()

// Grayscale filter
let greyScaleImage = imgFilter.filter(filterMethod: FILTERMETHOD.greyscale, uiImage: image).toUIImage()

// 50% brightness filter
let fiftyPerBrightImage = imgFilter.filter(uiImage: image).toUIImage()
