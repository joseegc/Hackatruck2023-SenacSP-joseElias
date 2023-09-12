//
//  Home.swift
//  Aula0409
//
//  Created by Student10 on 04/09/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
            List(1...20, id:\.self) {
                Text("Item \($0)")
            }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
