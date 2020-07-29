//
//  RegisterViewModel.swift
//  StateAndDataFlow
//
//  Created by Koshlakov Sergey on 29.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class RegisterViewModel: ObservableObject {
    @Published var name = "" {
        didSet {
            nameCount = name.count
            buttonDisabled = nameCount < 3
            nameCountTextColor = nameCount < 3 ? .red : .green
        }
    }
    @Published var nameCount = 0
    @Published var nameCountTextColor: Color = .red
    @Published var buttonDisabled = true
}
