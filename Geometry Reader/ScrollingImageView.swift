//
// Created for Geometry Reader
// by  Stewart Lynch on 2023-05-15
// Using Swift 5.0
// Running on macOS 13.3
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct ScrollingImageView: View {
    var imageNames: [String] {
          Array(1...7).map {"PalmSprings - \($0)"}
      }
      var body: some View {
          GeometryReader { screen in
              ScrollView(.horizontal) {
                  HStack(spacing: 0) {
                      ForEach(imageNames, id: \.self) { imageName in
                          GeometryReader { geometry in
                              Image(imageName)
                                  .resizable()
                                  .scaledToFill()
                                  .frame(width: screen.size.width)
                                  .offset(x: -geometry.frame(in: .global).origin.x)
                                  .clipped()
//                              Text(geometry.xOrigin(space: .global))
//                                  .font(.largeTitle)
//                                  .foregroundColor(.white)
//                                  .padding(100)
                          }
                          .frame(width: screen.size.width)
                      }
                  }
              }
          }
          .ignoresSafeArea()
      }
}

struct ScrollingImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingImageView()
    }
}
