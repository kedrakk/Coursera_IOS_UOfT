import UIKit

let image = UIImage(named:"forest.png")!

let myRGBA = RGBAImage(image: image)!

//! 1. Test with only R value in a specific place
//let x = 10
//let y = 10
//let index = y * myRGBA.width + x
//var pixel = myRGBA.pixels[index]
//pixel.R
//pixel.G
//pixel.B
//pixel.R = 255
//pixel.G = 0
//pixel.B = 0
//myRGBA.pixels[index] = pixel
//let newImage = myRGBA.toUIImage()

//! 2. Test to get avgerage value of R,G,B
//var totalRed = 0
//var totalGreen = 0
//var totalBlue = 0
//
//for y in 0..<myRGBA.height{
//    for x in 0..<myRGBA.width{
//        let index = y * myRGBA.width + x
//        var pixels = myRGBA.pixels[index]
//        totalRed += Int(pixels.R)
//        totalGreen += Int(pixels.G)
//        totalBlue += Int(pixels.B)
//    }
//}
//
//let count = myRGBA.width * myRGBA.height
//let avgRed = totalRed/count
//let avgGreen = totalGreen/count
//let avgBlue = totalBlue/count

let avgRed = 78
let avgGreen = 115
let avgBlue = 48

for y in 0..<myRGBA.height {
    for x in 0..<myRGBA.width {
        let index = y * myRGBA.width + x
        var pixel = myRGBA.pixels[index]
        var redDiff = Int(pixel.R) - avgRed
        if redDiff>0 {
            pixel.R = UInt8(max(0,min(255, avgRed + redDiff*5)))
            myRGBA.pixels[index] = pixel
        }
    }
}

let newImage2 = myRGBA.toUIImage()
image

