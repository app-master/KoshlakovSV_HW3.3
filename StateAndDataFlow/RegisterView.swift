//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $viewModel.name)
                    .multilineTextAlignment(.center)
                Text("\(viewModel.nameCount)")
                    .font(.system(size: 12))
                    .foregroundColor(viewModel.nameCountTextColor)
            }

            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled(viewModel.buttonDisabled)
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if !viewModel.name.isEmpty {
            user.name = viewModel.name
            user.isRegister = true
            user.saveUser()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
