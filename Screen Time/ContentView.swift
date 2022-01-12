//
//  ContentView.swift
//  Screen Time
//
//  Created by Other user on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var presentingModal = false
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .frame(width: 75, height: 75)
            Text("Time Limit")
                .bold()
                .font(.title)
            Text("You've reached your time limit on Shortcuts.")
            Spacer()
            ZStack{
                Capsule()
                    .foregroundColor(.blue)
                    .frame(width: 175, height: 50, alignment: .center)
                Text("OK")
                    .foregroundColor(.white)
            }
            Button("Ask For More Time") { self.presentingModal = true }
                    .sheet(isPresented: $presentingModal) { PasswordView(presentedAsModal: self.$presentingModal) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

