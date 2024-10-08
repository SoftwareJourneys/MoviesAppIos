import SwiftUI
import Foundation
import AVKit

struct CommonTrailer: View {
    let videoURL: URL
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoURL))
            .onAppear {
                let player = AVPlayer(url: videoURL)
                player.play()
            }
            .frame(height: 300) 
    }
}

