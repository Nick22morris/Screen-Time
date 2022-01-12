//
//  ContentView.swift
//  Screen Time
//
//  Created by Other user on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var presentingModal = false
    @State var showEnter = false
    @State var shiftButton = -40.0
    @State var showList = false
    @State var co = Color.white
    var body: some View {
        ZStack {
            co
                .opacity(15)
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
                .offset(y: shiftButton)
                
                if showList{
                    VStack {
                        ItemCell()
                        HStack(alignment: .center) {
                            Button("Enter Screen Time Passcode") {
                                self.presentingModal = true
                            }
                            .sheet(isPresented: $presentingModal) { PasswordView(presentedAsModal: self.$presentingModal) }
                        }.font(.body)
                            .offset(y: -107)
                        Button("Cancel") {
                            withAnimation {
                                showList.toggle()
                                co = Color.white
                                shiftButton = -40
                            }
                        }
                        .offset(y: -75)
                    }
                }
                if t.data {
                    fakeCell()
                }
                Button("Ask For More Time") {
                    withAnimation {
                        showList.toggle()
                        co = Color.gray
                        shiftButton = 40
                    }
                }
                .offset(y: -40)
            }
        }
        .ignoresSafeArea()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ItemCell: View {
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .padding(.horizontal, 4)
                    .frame(width: 350, height: 140)
                VStack {
                    HStack(alignment: .center) {
                        Text("One More Minute")
                            .foregroundColor(.blue)
                    }.font(.body)
                    Divider()
                    HStack(alignment: .center) {
                        Text("Send Request")
                            .foregroundColor(.blue)
                    }.font(.body)
                        .padding(5)
                    Divider()
                    HStack(alignment: .center) {
                        Text("")
                            .foregroundColor(.blue)
                    }.font(.body)
                        .padding(5)
                    
                    
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .padding(.horizontal, 4)
                    .frame(width: 350, height: 35)
                VStack {
                    HStack(alignment: .center) {
                        Text("")
                            .foregroundColor(.blue)
                    }.font(.body)
                }
            }
        }
        .offset(y: -20)
    }
}

