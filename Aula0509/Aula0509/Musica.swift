//
//  Musica.swift
//  Aula0509
//
//  Created by Student10 on 05/09/23.
//

import SwiftUI


struct Icon : Identifiable {
    var id: Int
    var name: String
}

struct Musica: View {
    var musicaSelecionada: Song
    @State var bgcolor: Color = .blue
    var arrayIcons = [Icon(id: 1, name: "shuffle"),
                      Icon(id: 2, name: "backward.end.fill"),
                      Icon(id: 3, name: "play.fill"),
                      Icon(id: 4, name: "forward.end.fill"),
                      Icon(id: 5, name: "repeat")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [bgcolor,.black]), startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .zIndex(0.0)
            
            VStack {
                Spacer()
                    .frame(height: 70)
                
                    AsyncImage(
                                        url: URL(string: musicaSelecionada.capa),
                                        content: { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 275, maxHeight: 275)
                                                .cornerRadius(10.0)
                                                .shadow(color: .gray, radius: 5)

                                            
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
                        
                
    
                Text(musicaSelecionada.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text(musicaSelecionada.artist)
                    .font(.title2)
                    .foregroundColor(Color.white)
                Spacer()
                    .frame(height:90.0)
                HStack {
                    Image(systemName: "shuffle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 35, maxHeight: 35)
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 35, maxHeight: 35)
                    Spacer()
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 50, maxHeight: 50)
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 35, maxHeight: 35)
                    Spacer()
                    Image(systemName: "repeat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 30, maxHeight: 30)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
    


struct Musica_Previews: PreviewProvider {
    static var previews: some View {
        Musica(musicaSelecionada:  Song(id: 1, name: "Peace Sells", artist: "Megadeth", capa: "https://upload.wikimedia.org/wikipedia/en/4/40/Megadeth_-_Peace_Sells..._But_Who%27s_Buying-.jpg"))
    }
}
