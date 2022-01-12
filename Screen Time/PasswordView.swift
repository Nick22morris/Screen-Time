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
    
    @Binding var presentedAsModal: Bool
    @State private var text: String = ""
    @State var dots = [
        "circle",
        "circle",
        "circle",
        "circle",
    ]
    var body: some View {
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
        }
        
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
