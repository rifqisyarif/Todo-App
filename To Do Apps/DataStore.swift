//
//  DataStore.swift
//  To Do Apps
//
//  Created by Reefkey on 17/02/21.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
    
}
class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
