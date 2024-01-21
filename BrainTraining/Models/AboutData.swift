//
//  AboutData.swift
//  BrainTraining
//
//  Created by Tia M on 1/21/24.
//

import Foundation

struct AppInfo {
    let description: String
    let creators: String
    
    static func getAppInfo() -> AppInfo {
        AppInfo(description: appInfo.description, creators: appInfo.creators)
    }
}

let appInfo = AppInfo(
    description: 
                """
                The Schulte tables game is a brain training exercise that helps \
                to improve peripheral vision, attention, memory, and reading speed. \

                Choose the appropriate difficulty level (simple, classic, or difficult) \
                for your skill level. Position the phone at your usual reading \
                distance and concentrate your gaze on the center of the table. \
                Throughout the game, try to keep your gaze fixed on the center. \
                Use your peripheral vision to scan the table for numbers in sequential order.
                Complete the table quickly and accurately to train your brain to \
                process information more efficiently.
                """,
     creators: "Created by Evgeni Glushko and Tatyana Mastykova")

