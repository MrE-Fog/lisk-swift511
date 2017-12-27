//
//  APINode.swift
//  Lisk
//
//  Created by Andrew Barba on 12/26/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import Foundation

public struct APINode {

    public let hostname: String

    public init(hostname: String) {
        self.hostname = hostname
    }
}

extension APINode {

    public static let mainnet: [APINode] = [
        .init(hostname: "node01.lisk.io"),
        .init(hostname: "node02.lisk.io"),
        .init(hostname: "node03.lisk.io"),
        .init(hostname: "node04.lisk.io"),
        .init(hostname: "node05.lisk.io"),
        .init(hostname: "node06.lisk.io"),
        .init(hostname: "node07.lisk.io"),
        .init(hostname: "node08.lisk.io")
    ]

    public static let testnet: [APINode] = [
        .init(hostname: "testnet.lisk.io")
    ]
}

extension APINode {

    public static func random(from nodes: [APINode] = APINode.mainnet) -> APINode {
        let index = Int(arc4random_uniform(UInt32(nodes.count)))
        return nodes[index]
    }
}
