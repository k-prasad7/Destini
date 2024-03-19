//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct StoryNode {
    let id: String
    let text: String
    let choices: [Choice]
}

struct Choice {
    let text: String
    let destinationNodeId: String
}
