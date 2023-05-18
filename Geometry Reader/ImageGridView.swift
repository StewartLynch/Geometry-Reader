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

struct ImageGridView: View {
    @State private var numImages: Double = 7
    var body: some View {
        var imageNames: [String] {
            Array(1...Int(numImages)).map {"PalmSprings - \($0)"}
        }
        VStack {
            Slider(value: $numImages, in: 1...7, step: 1.0)
            GeometryReader { geometry in
                let minCellWidth: CGFloat = geometry.size.width / 4
                let maxCellWidth: CGFloat = geometry.size.width / CGFloat(imageNames.count)
                let optimalCellWidth = max(minCellWidth, maxCellWidth)
                let numberOfColumns = Int(geometry.size.width / optimalCellWidth)
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: numberOfColumns)) {
                    ForEach(imageNames, id: \.self) { name in
                        Image(name)
                            .resizable()
                            .aspectRatio(1,contentMode: .fill)
                            .border(Color.black)
                    }
                }
            }
        }
        .padding()
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}
