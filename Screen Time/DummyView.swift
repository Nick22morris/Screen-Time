//
//  DummyView.swift
//  Screen Time
//
//  Created by Other user on 1/11/22.
//

import SwiftUI

struct DummyView: View {
    let text: String
    @State var show = false
    var body: some View {
        ZStack {
            Image("dummy")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            Rectangle()
                .ignoresSafeArea()
                .frame(width: 400, height: 30, alignment: .center)
                .foregroundColor(.white)
                .offset(y: -385)
            Button(action: {
                show.toggle()
            }, label: {
                Rectangle()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.white)
                    .offset(x: 50, y: -300)
                    .ignoresSafeArea()
            })
            if show {
                Text(text)
            }
        }
        
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView(text: "Hello")
    }
}
