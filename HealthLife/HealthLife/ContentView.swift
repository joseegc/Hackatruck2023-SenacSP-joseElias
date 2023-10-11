//
//  ContentView.swift
//  HealthLife
//
//  Created by Student10 on 20/09/23.
//

import SwiftUI
    //  @Published var usernameGlobal: String: "Usuário"
    //}
    struct ContentView: View {
        // @St
        var body: some View {
            
            
            TabView {
                Home()
                    .tabItem() {
                        Label("Início", systemImage: "house.circle.fill")
                    }
                Agenda()
                    .tabItem() {
                        Label("Agenda", systemImage: "calendar.circle.fill")
                    }
                
                
                Feed()
                    .tabItem() {
                        Label("Feed", systemImage: "newspaper.circle.fill")
                    }
                Mapa()
                    .tabItem() {
                        Label("Mapa", systemImage: "map.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    }
                
                
                Perfil()
                    .tabItem() {
                        Label("Perfil", systemImage: "person.crop.circle")
                    }
                
            }
            .background(.green)
            
            
            
            
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

