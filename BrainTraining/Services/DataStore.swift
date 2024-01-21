//
//  DataStore.swift
//  BrainTraining
//
//  Created by Evgeni Glushko on 21.01.24.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    var dates: [Date] = []
    var time: [String] = []
    var mode: [String] = []
    
    private init() {}
}
