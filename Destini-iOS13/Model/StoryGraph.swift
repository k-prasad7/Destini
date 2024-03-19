//
//  StoryGraph.swift
//  Destini-iOS13
//
//  Created by Kiran Prasad on 3/15/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

class StoryGraph {
    var storyBrain: StoryDatabase = StoryDatabase()
    var currentStoryKey: String

    init(){
        currentStoryKey = "0"
    }
    
    func getCurrentStory() -> StoryNode {
        guard let story = storyBrain.nodes[currentStoryKey] else {
            // Return a default story node if the key doesn't match
            return storyBrain.nodes["exit"]!
        }
        return story
    }

    
    func getCurrentChoices() -> [Choice]{
        let choiceA = getCurrentStory().choices[0]
        let choiceB = getCurrentStory().choices[1]
        return [choiceA,choiceB]
    }
    
    func nextStory(userChoice: String) {
        if let nextStoryID = storyBrain.nextStoryID(from: currentStoryKey, userChoice: userChoice) {
            self.currentStoryKey = nextStoryID
        } else {
            // Handle error or invalid choice
            print("Invalid choice or story node ID")
        }
    }


}

