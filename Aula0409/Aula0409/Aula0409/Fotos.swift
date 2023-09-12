//
//  Fotos.swift
//  Aula0409
//
//  Created by Student10 on 04/09/23.
//

import SwiftUI

struct Fotos: View {
    private var imagens = ["pawprint.fill",
                   "tortoise.fill",
                    "hare.fill",
                    "ant.fill",
                   "ladybug.fill"]
    var body: some View {
        VStack {
            
            
            ScrollView(showsIndicators: false) {
                ForEach(imagens, id: \.self) { index in
                    Image(systemName: index)
                        .font(.system(size: 150))
                        .padding()
                }
            }
            
            }
        }
    }

struct Fotos_Previews: PreviewProvider {
    static var previews: some View {
        Fotos()
    }
}
