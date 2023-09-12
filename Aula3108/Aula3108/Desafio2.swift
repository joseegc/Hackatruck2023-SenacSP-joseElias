//
//  Desafio2.swift
//  Aula3108
//
//  Created by Student10 on 31/08/23.
//

import SwiftUI

struct Desafio2: View {
    var body: some View {
        VStack {
            Image("caminhao")
                .resizable()
                .scaledToFit()
            Spacer()
            Image("caminhao")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Text("Hackatruck")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 110.0)
                )
            Spacer()
            HStack {
                Text("Maker")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                    .padding(.bottom, 50.0)
                   
                
                Text("Space")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding(.bottom, 50.0)
                    
            }
            .frame(width: 200.0, height: 120.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
           
        }
    }
    
    struct Desafio2_Previews: PreviewProvider {
        static var previews: some View {
            Desafio2()
        }
    }
}
