//
//  ContentView.swift
//  Aula0409-2
//
//  Created by Student10 on 04/09/23.
//

import SwiftUI


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Ola usuario")
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: View1()) {
                Text("Modo 1")
            }
            NavigationLink(destination: View2()) {
                Text("Modo 2")
            }
            Button("Modo 3") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        SheetView()
                    }
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
