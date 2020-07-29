//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation
import Combine

final class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
    private let defaults = UserDefaults.standard
    
    init(){
        self.isRegister = defaults.object(forKey: "isRegister") as? Bool ?? false
        self.name = defaults.object(forKey: "name") as? String ?? ""
    }
    
    init(name: String) {
        self.name = name
    }

    func saveUser() {
        defaults.set(name, forKey: "name")
        defaults.set(isRegister, forKey: "isRegister")
    }

    func removeUser() {
        isRegister = false
        name = ""
        defaults.removeObject(forKey: "name")
        defaults.removeObject(forKey: "isRegister")
    }
}
