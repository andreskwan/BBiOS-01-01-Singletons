//: [Previous](@previous)

import Foundation

class Video {
    let videoPlayed = "Pink Floyd in Rio"
    init() {
        print("we are in the Video Class initializer")
    }
}

class VideoPlayer: Video {
    var function: (() -> Bool)!
    
    override init(){
        super.init()
        print("we are in the VideoPlayer")
    }
    
    convenience init(isPlaying: @escaping () -> Bool) {
        self.init()
        print("we are in the convenience init of VideoPlayer")
        self.function = isPlaying
    }
}

//let videoPlayer = VideoPlayer()
let function: () -> Bool = { () in return true}
let videoPlayer = VideoPlayer(isPlaying: function)
videoPlayer.videoPlayed
videoPlayer.function()
//: [Next](@next)
