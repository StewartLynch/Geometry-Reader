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

struct IntroductionView: View {
    var body: some View {
        NavigationStack {
            VStack {
               Rectangle()
                    .fill(.teal)
                    .frame(height: 200)
                GeometryReader { proxy in
                    Rectangle()
                        .fill(.green)
                    VStack(alignment: .leading) {
//                        Text("\(proxy.frame(in: .local).debugDescription)")
//                        Text("\(proxy.frame(in: .global).debugDescription)")
//                        Text("\(proxy.frame(in: .named("VStack")).debugDescription)")
                        Text(proxy.info(space: .local))
                        Text(proxy.info(space: .global))
                        Text(proxy.info(space: .named("VStack")))
                    }
                    Text("Where am I?")
//                        .position(x: proxy.frame(in: .local).midX,
//                                  y: proxy.frame(in: .local).midY)
                        .position(x: proxy.frame(in: .local).midX,
                                  y: proxy.frame(in: .named("VStack")).midY)
                }
            }
            .coordinateSpace(name: "VStack")
            .navigationTitle("GeometryReader")
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
