//
// Created for GeoReader
// by  Stewart Lynch on 2023-05-15
// Using Swift 5.0
// Running on macOS 13.3
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Or, Twitter, if it still exits: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

extension GeometryProxy {
    enum CoordSpace {
        case local
        case global
        case named(AnyHashable)
    }
    func info(space: CoordSpace) -> String {
        /* Display the round values for the origin and
         dimensions for the specified coordinate space
        */
        switch space {
            case .local:
                return "\(frame(in: .local).roundedDescription("Local")))"
            case .global:
                return "\(frame(in: .global).roundedDescription("Global")))"
            case .named(let name):
                return "\(frame(in: .named(name)).roundedDescription(name as! String)))"
        }
    }
    
    func xOrigin(space: CoordSpace) -> String {
        /* where is the origin x coordinate in relation to
         the specified coordinate space's x coordinate origin
         Use rounded values
        */
        switch space {
            case .local:
                return "\(Int(round(frame(in: .local).origin.x)))"
            case .global:
                return "\(Int(round(frame(in: .global).origin.x)))"
            case .named(let name):
                return "\(Int(round(frame(in: .named(name)).origin.x)))"
        }
    }
    
    func yOrigin(space: CoordSpace) -> String {
        /* where is the origin y coordinate in relation to
         the specified coordinate space's y coordinate origin
         Use rounded values
        */
        switch space {
            case .local:
                return "\(Int(round(frame(in: .local).origin.y)))"
            case .global:
                return "\(Int(round(frame(in: .global).origin.y)))"
            case .named(let name):
                return "\(Int(round(frame(in: .named(name)).origin.y)))"
        }
    }
}

extension CGRect {
    func roundedDescription(_ name: String) -> String {
        "\(name): (\(Int(round(origin.x))), \(Int(round(origin.y))), size: (\(Int(round(size.width))), \(Int(round(size.height)))"
    }
}
