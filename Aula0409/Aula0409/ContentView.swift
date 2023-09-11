//
//  ContentView.swift
//  Aula0409
//
//  Created by Student10 on 04/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            TabView {
                Home()
                    .tabItem() {
                        Label("Home", systemImage: "figure.stand.line.dotted.figure.stand")
                    }
                    .badge(2)

                Pesquisa()
                    .tabItem() {
                        Label("", systemImage: "magnifyingglass")
                    }
                Fotos()
                    .tabItem() {
                        Label("Fotos", systemImage: "photo")
                    }
                Mensagens()
                    .tabItem() {
                        Label("Mensagens", systemImage: "")
                    }
                    .badge("!")

                
                Perfil()
                    .tabItem() {
                        Label("Perfil", systemImage: "person.crop.circle")
                    }
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
