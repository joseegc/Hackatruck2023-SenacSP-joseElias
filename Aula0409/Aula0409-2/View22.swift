//
//  View22.swift
//  Aula0409-2
//
//  Created by Student10 on 04/09/23.
//

import SwiftUI

struct View22: View {
    @State var nome1: String
    var body: some View {
        Text("Volte, \(nome1)")
    }
}

struct View22_Previews: PreviewProvider {
    static var previews: some View {
        View22(nome1: "")
    }
}
