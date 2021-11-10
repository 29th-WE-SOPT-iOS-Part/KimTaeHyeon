//
//  Channel.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/04.
//

import UIKit

struct Channel {
    let channelImage: UIImage?
    let channelTitle: String
}

extension Channel {
    static let dummy: [Channel] = [
        Channel(channelImage: Image.ggamju1, channelTitle: "iOSPart"),
        Channel(channelImage: Image.ggamju2, channelTitle: "AndroidPart"),
        Channel(channelImage: Image.ggamju3, channelTitle: "ServerPart"),
        Channel(channelImage: Image.ggamju4, channelTitle: "WebPart"),
        Channel(channelImage: Image.ggamju5, channelTitle: "DesignPart"),
        Channel(channelImage: Image.ggamju6, channelTitle: "PlanPart"),
        Channel(channelImage: Image.ggamju7, channelTitle: "iOSPart"),
        Channel(channelImage: Image.ggamju8, channelTitle: "AndroidPart"),
    ]
}
