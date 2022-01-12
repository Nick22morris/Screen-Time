//
//  Stor.swift
//  Screen Time
//
//  Created by Other user on 1/12/22.
//

import Foundation
import SwiftUI

let t = Store()

struct Store {
    @State var data = false
    func tog() {
        data.toggle()
    }
}
