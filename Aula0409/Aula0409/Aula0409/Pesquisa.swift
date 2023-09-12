//
//  Pesquisa.swift
//  Aula0409
//
//  Created by Student10 on 04/09/23.
//

import SwiftUI

struct Pesquisa: View {
    var body: some View {
        HStack {
                VStack{
                    Text("Hacka")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.yellow)
                    Text("Truck")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.yellow)
                }
                VStack {
                    Text("Maker")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                    Text("Space")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
            }
        }
        .frame(width: 250.0, height: 250.0)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.72, saturation: 0.893, brightness: 0.32)/*@END_MENU_TOKEN@*/)
    }
}

struct Pesquisa_Previews: PreviewProvider {
    static var previews: some View {
        Pesquisa()
    }
}
