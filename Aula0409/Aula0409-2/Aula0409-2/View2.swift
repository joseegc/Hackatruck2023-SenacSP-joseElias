//
//  View2.swift
//  Aula0409-2
//
//  Created by Student10 on 04/09/23.
//

import SwiftUI

struct View2: View {
    
    @State private var nome = ""
    var body: some View {
        VStack {
            TextField("Digite Seu Nome", text: $nome)
            
            Text("Digite seu nome para passar")
            
            NavigationLink(destination: View22(nome1: nome)) {
                    Text("Acessar Alguma Coisa")
            }
        }
    }
    
    struct View2_Previews: PreviewProvider {
        static var previews: some View {
            View2()
        }
    }
}


