//
//  Bem vindo.swift
//  Aula3108
//
//  Created by Student10 on 31/08/23.
//

import SwiftUI

struct Bem_vindo: View {
    @State var nome: String = "Fulano"
    @State var alerta = false
    var body: some View {
        ZStack {
            
            Image("caminhao")
                .resizable()
                .aspectRatio(1/1, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .zIndex(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .blur(radius: 3)
                .opacity(0.2)
                .saturation(0.5)

            
            VStack {
                Text("Bem vindo, \(nome)")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                TextField("Digite Seu Nome", text: $nome)
                    .frame(width: 350)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Image("truck")
                        .resizable()
                        .scaledToFit()
                         
                }
                .frame(width: 250)

                Spacer()
                Button("Entrar") {
                            alerta = true
                }
                .alert(isPresented: $alerta) {
                            Alert(title: Text("ALERTA!"), message: Text("Você irá iniciar o desafio da aula agora"), dismissButton: .default(Text("Vamos lá!")))
                }
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    
                    
                
                                            
                
            }
            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
        }
    }
    
    struct Bem_vindo_Previews: PreviewProvider {
        static var previews: some View {
            Bem_vindo()
        }
    }
}
