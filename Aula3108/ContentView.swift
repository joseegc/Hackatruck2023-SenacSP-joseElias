//
//  ContentView.swift
//  Aula3108
//
//  Created by José Elias on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Image("caminhao")
                .resizable()
                .scaledToFit()
            Text("Hackatruck")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            
            HStack {
                Text("Maker")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                   
                
                Text("Space")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    
            }
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
