//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
    
struct StoryDatabase {
    var nodes: [String: StoryNode] = [
        "0": StoryNode(
            id: "0",
            text: "Welcome traveler. Shall we begin?",
            choices: [
                Choice(text: "Yes", destinationNodeId: "1"),
                Choice(text: "No", destinationNodeId: "exit")
            ]
        ),
        "1": StoryNode(
            id: "1",
            text: "You wake up in an ancient forest, a path winding into the darkness and another leading to a bright clearing.",
            choices: [
                Choice(text: "Follow the dark path", destinationNodeId: "2"),
                Choice(text: "Head towards the light", destinationNodeId: "3")
            ]
        ),
        "2": StoryNode(
            id: "2",
            text: "The dark path leads you to an old, moss-covered stone door set into the hillside.",
            choices: [
                Choice(text: "Open the door", destinationNodeId: "4"),
                Choice(text: "Return to the fork in the path", destinationNodeId: "1")
            ]
        ),
        "3": StoryNode(
            id: "3",
            text: "Arriving at the clearing, you find a tranquil pond. Its waters shimmer with magical light.",
            choices: [
                Choice(text: "Drink from the pond", destinationNodeId: "5"),
                Choice(text: "Continue exploring the forest", destinationNodeId: "6")
            ]
        ),
        "4": StoryNode(
            id: "4",
            text: "Beyond the door lies a treasure chamber, filled with gold and jewels untold.",
            choices: [
                Choice(text: "Gather as much treasure as you can carry", destinationNodeId: "7"),
                Choice(text: "Search for a legendary artifact rumored to be in the chamber", destinationNodeId: "8")
            ]
        ),
        "5": StoryNode(
            id: "5",
            text: "The water grants you visions of distant lands and forgotten times. You feel a strange pull towards the mountains.",
            choices: [
                Choice(text: "Follow the visions to the mountains", destinationNodeId: "9"),
                Choice(text: "Stay by the pond to learn more", destinationNodeId: "exit")
            ]
        ),
        "6": StoryNode(
            id: "6",
            text: "Deeper in the forest, you encounter a mysterious traveler who offers you a choice.",
            choices: [
                Choice(text: "Accept the traveler's offer and gain unknown powers", destinationNodeId: "exit"),
                Choice(text: "Politely decline and continue on your way", destinationNodeId: "10")
            ]
        ),
        "7": StoryNode(
            id: "7",
            text: "As you leave the chamber, laden with treasure, the entrance collapses behind you. You're trapped forever.",
            choices: [
                Choice(text: "Start over", destinationNodeId: "1"),
                Choice(text: "Exit adventure", destinationNodeId: "exit")
            ]
        ),
        "8": StoryNode(
            id: "8",
            text: "You find the artifact, but it's cursed! Darkness falls upon the land.",
            choices: [
                Choice(text: "Try to lift the curse", destinationNodeId: "exit"),
                Choice(text: "Use the artifact's power for your own ends", destinationNodeId: "exit")
            ]
        ),
        "9": StoryNode(
            id: "9",
            text: "In the mountains, you discover the entrance to a hidden valley, filled with wonders unseen by mortal eyes.",
            choices: [
                Choice(text: "Enter the valley", destinationNodeId: "exit"),
                Choice(text: "Return to share the discovery with the world", destinationNodeId: "exit")
            ]
        ),
        "10": StoryNode(
            id: "10",
            text: "Continuing on your way, you find peace in the simple beauty of the forest. Your adventure ends here, but another awaits.",
            choices: [
                Choice(text: "Start a new adventure", destinationNodeId: "1"),
                Choice(text: "Exit", destinationNodeId: "exit")
            ]
        ),
        // Generic exit node without further choices
        "exit": StoryNode(
            id: "exit",
            text: "Your journey has come to an end, but countless others await. Will you venture forth once more, or rest until another day?",
            choices: [
                Choice(text: "Start a new adventure", destinationNodeId: "0"),
                Choice(text: "Exit", destinationNodeId: "exit"),
            ]
        )
    ]
    
    func nextStoryID(from currentNodeID: String, userChoice: String) -> String? {
        guard let currentNode = nodes[currentNodeID] else { return nil }
        for choice in currentNode.choices where choice.text == userChoice {
            return choice.destinationNodeId
        }
        return nil
    }
}
