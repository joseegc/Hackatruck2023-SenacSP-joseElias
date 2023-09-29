//
//  ContentView.swift
//  Aula1209
//
//  Created by Student10 on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                AsyncImage(
                    url: URL(string:  "https://e0.pxfuel.com/wallpapers/201/710/desktop-wallpaper-road-street-or-asphalt-texture-with-lines-road-texture-asphalt-texture-poster-background-design-thumbnail.jpg"),
                    content: { image in
                        image.resizable()
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .zIndex(0)
                .opacity(0.4)
                VStack {
                    ScrollView{
                        ForEach(viewModel.estacionamentos){ estacionamento in
                            
                            Text(estacionamento.estacionamento!)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(estacionamento.endereco!)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.bottom, 50.0)
                            
                            
                            ForEach(estacionamento.carro, id: \.self) { carro in
                                NavigationLink(destination: CarroSelecionado(carroSelecionado: Carro(modelo: carro.modelo!, ano: carro.ano!, cor: carro.cor!, preco: carro.preco!))) {
                                    VStack {
                                        Text(carro.modelo! + " " + String(carro.ano!) + " " + carro.cor!)
                                            .font(.title)
                                            .fontWeight(.medium)
                                        Text("R$" + String(carro.preco!))
                                            .font(.title2)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color.black)
                                            .italic()
                                        Text("")
                                    }
                                }
                                .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                
                            }
                        }
                    }
                    
                }
            }
            .padding()
        }.onAppear(){
            viewModel.fetch()
            
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

