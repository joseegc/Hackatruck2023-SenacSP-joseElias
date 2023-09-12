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
                
                LinearGradient(gradient: Gradient(colors: [Color.black, /*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.051, brightness: 0.201)/*@END_MENU_TOKEN@*/]), startPoint: /*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            
                VStack {
                    ScrollView{
                        
                        Text("Game Of Thrones Characters")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        ForEach(viewModel.chars, id: \.id){ personagem in
                            NavigationLink(destination: Personagem(personagemSelecionado: personagem)) {
                                HStack {
                                    AsyncImage(
                                        url: URL(string: personagem.imageUrl!),
                                        content: { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90, maxHeight: 90)
                                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                                .shadow(color: .gray, radius: 3)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                            
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
                                    Text(personagem.fullName!)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.white)
                                    Spacer()
                                }
                            }
                        }
                    }.onAppear(){
                        viewModel.fetch()
                    }
                    .padding()
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
