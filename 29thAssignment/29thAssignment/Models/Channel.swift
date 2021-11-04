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
    
    static func loadDummyList() -> [Channel] {
        let channelImages = [
            Const.Image.ggamju1,
            Const.Image.ggamju2,
            Const.Image.ggamju3,
            Const.Image.ggamju4,
            Const.Image.ggamju5,
            Const.Image.ggamju6,
            Const.Image.ggamju7,
            Const.Image.ggamju8,
        ].compactMap({$0})
        
        return [
            Channel(channelImage: channelImages.randomElement(), channelTitle: "iOSPart"),
            Channel(channelImage: channelImages.randomElement(), channelTitle: "AndroidPart"),
            Channel(channelImage: channelImages.randomElement(), channelTitle: "ServerPart"),
            Channel(channelImage: channelImages.randomElement(), channelTitle: "WebPart"),
            Channel(channelImage: channelImages.randomElement(), channelTitle: "DesignPart"),
            Channel(channelImage: channelImages.randomElement(), channelTitle: "PlanPart"),
            Channel(channelImage: channelImages.randomElement(), channelTitle: "iOSPart"),
            Channel(channelImage: channelImages.randomElement(), channelTitle: "AndroidPart"),
        ]
    }
}
