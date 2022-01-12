//
//  PasswordView.swift
//  Screen Time
//
//  Created by Other user on 1/11/22.
//

import SwiftUI

struct PasswordView: View {
    enum FocusField: Hashable {
        case field
    }
    @FocusState private var focusedField: FocusField?
    @FocusState private var nameIsFocused: Bool
    @Binding var showEnter: Bool
    @State var myColor = Color.white
    @State var approved = false
    @Binding var presentedAsModal: Bool
    @State var text: String = ""
    
    @State var dots = [
        "circle",
        "circle",
        "circle",
        "circle",
    ]
    var body: some View {
        ZStack {
            myColor
                .ignoresSafeArea()
                .opacity(30)
            VStack {
                HStack {
                    Spacer()
                    Text("Enter Passcode")
                        .bold()
                        .padding()
                        .offset(x: 45)
                    Spacer()
                    Button("Cancel") { self.presentedAsModal = false }
                    
                    .padding()
                    
                }
                Spacer()
                Text("Enter Screen Time Passcode")
                    .bold()
                    .padding()
                HStack {
                    ForEach(dots, id: \.self) { dot in
                        Image(systemName: dot)
                            .padding(5)
                    }
                }
                TextField("hidden", text: $text)
                    .focused($focusedField, equals: .field)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  /// Anything over 0.5 seems to work
                            self.focusedField = .field
                        }
                    }
                    .keyboardType(.numberPad)
                    .onChange(of: text) { newValue in
                        check(val: newValue)
                    }
                    .opacity(0)
                Spacer()
//                if approved {
//                    NavigationLink(destination: DummyView(text: "hello")) {
//                        fakeCell()
//                    }
//                    .onTapGesture {
//                        presentedAsModal = false
//                    }
//                }
                
                
            }
        }
        
        
    }
    func check(val: String) {
        let len = val.count
        if len == 0 {
            dots = [
                "circle",
                "circle",
                "circle",
                "circle",
            ]
        }
        if len == 1 {
            dots = [
                "circle.fill",
                "circle",
                "circle",
                "circle",
            ]
        }
        if len == 2 {
            dots = [
                "circle.fill",
                "circle.fill",
                "circle",
                "circle",
            ]
        }
        if len == 3 {
            dots = [
                "circle.fill",
                "circle.fill",
                "circle.fill",
                "circle",
            ]
        }
        if len == 4 {
            dots = [
                "circle.fill",
                "circle.fill",
                "circle.fill",
                "circle.fill",
            ]
            hideKeyboard()
            approved = true
            presentedAsModal = false
            showEnter = true
        }
        
    }
    
}
struct fakeCell: View {
    var body: some View {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .padding(.horizontal, 4)
                        .frame(width: 350, height: 140)
                    VStack {
                        HStack(alignment: .center) {
                            Text("Approve For 15 Minutes")
                                .foregroundColor(.blue)
                        }.font(.body)
                        Divider()
                        HStack(alignment: .center) {
                            Text("Approve For 1 Hour")
                                .foregroundColor(.blue)
                        }.font(.body)
                            .padding(5)
                        Divider()
                        HStack(alignment: .center) {
                            Text("Approve for All Day")
                                .foregroundColor(.blue)
                        }.font(.body)
                            .padding(5)
                        
                        
                    }
                }
                //                ZStack {
                //                    RoundedRectangle(cornerRadius: 8)
                //                        .fill(.white)
                //                        .padding(.horizontal, 4)
                //                        .frame(width: 350, height: 35)
                //                    VStack {
                //                        HStack(alignment: .center) {
                //                            Text("")
                //                                .foregroundColor(.blue)
                //                        }.font(.body)
                //                    }
                //                }
            }
        
        .offset(y: -20)
    }
}
    //struct PasswordView_Previews: PreviewProvider {
    //    @Binding var dummy: Bool
    //    static var previews: some View {
    //        PasswordView(presentedAsModal: self.$dummy)
    //    }
    //}
#if canImport(UIKit)
    extension View {
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
#endif
    
    
