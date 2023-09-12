//
//  Personagem.swift
//  Aula1209
//
//  Created by Student10 on 12/09/23.
//

import SwiftUI

struct Personagem: View {
    var personagemSelecionado: Character
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, /*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.051, brightness: 0.201)/*@END_MENU_TOKEN@*/]), startPoint: /*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                AsyncImage(
                    url: URL(string: personagemSelecionado.imageUrl!),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300, maxHeight: 300)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3)
                        
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                Text(personagemSelecionado.fullName!)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text(personagemSelecionado.title!)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                Text(personagemSelecionado.family!)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .italic()
                    .padding(.top, 60.0)
                Spacer()
            }
            .padding(.top, 35.0)
        }
    }
}

struct Personagem_Previews: PreviewProvider {
    static var previews: some View {
        Personagem(personagemSelecionado: Character(id: 0, firstName: "Daenerys", lastName: "Targaryen", fullName: "Daenerys Targaryen", title: "Mother Of Dragon", family: "House Targaryen", image: "daenerys.jpg", imageUrl: "https://thronesapi.com/assets/images/daenerys.jpg"))
    }
}
