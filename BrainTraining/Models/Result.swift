//
//  Result.swift
//  BrainTraining
//
//  Created by Evgeni Glushko on 21.01.24.
//

import Foundation

struct Result {
    
    let date: Date
    let time: String
    let mode: String
    
    var getDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    static func getResults() -> [Result] {
        
        var results: [Result] = []
        let dataStore = DataStore.shared
        
        let dates = dataStore.dates
        let time = dataStore.time
        let mode = dataStore.mode
        
        let iterationCount = min(
            dates.count,
            time.count,
            mode.count
        )
        
        for index in 0..<iterationCount {
            let result = Result(
                date: dates[index],
                time: time[index],
                mode: mode[index]
            )
            
            results.append(result)
        }
        
        return results
    }
    
    static func addResult(date: Date, time: String, mode: String) {
        let dataStore = DataStore.shared
        
        dataStore.dates.append(date)
        dataStore.time.append(time)
        dataStore.mode.append(mode)
    }
}
