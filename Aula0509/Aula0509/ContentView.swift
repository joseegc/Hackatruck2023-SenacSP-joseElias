//
//  ContentView.swift
//  Aula0509
//
//  Created by Student10 on 05/09/23.
//

import SwiftUI

struct Song : Identifiable {
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

struct ContentView: View {
    
   
    
    var arrayMusicas = [
        Song(id: 1, name: "Peace Sells", artist: "Megadeth", capa: "https://upload.wikimedia.org/wikipedia/en/4/40/Megadeth_-_Peace_Sells..._But_Who%27s_Buying-.jpg"),
        
        Song(id: 2, name: "Rainbow In The Dark", artist: "Dio", capa: "https://www.revolvermag.com/sites/default/files/styles/original_image__844px_x_473px_/public/media/section-media/screen_shot_2017-08-14_at_12.18.16_pm.png?itok=m21SuqGf&timestamp=1508359501"),
        
        Song(id: 3, name: "By The Way", artist: "Red Hot Chili Peppers", capa: "https://upload.wikimedia.org/wikipedia/pt/2/27/Red_Hot_Chili_Peppers_-_By_the_Way.jpg"),
        
        Song(id: 4, name: "Redbone", artist: "Childish Gambino", capa: "https://upload.wikimedia.org/wikipedia/en/1/10/Childish_Gambino_-_Awaken%2C_My_Love%21.png"),
        
        Song(id: 5, name: "Instant Crush", artist: "Daft Punk, Julian Casablancas", capa: "https://upload.wikimedia.org/wikipedia/commons/7/74/Daft_Punk_-_Random_Access_Memories.jpg"),
        
        Song(id: 6, name: "Bring Me To Life", artist: "Evanescence", capa: "https://i.pinimg.com/564x/2d/e1/44/2de144811ed1da2cea2764268e86c1c9.jpg"),
        
        Song(id: 7, name: "Ride The Lightning", artist: "Metallica", capa: "https://www.revolvermag.com/sites/default/files/styles/original_image__844px_x_473px_/public/media/section-media/ridethelightning.jpg?itok=Fd0KtaS2&timestamp=1549044407"),
        
        Song(id: 8, name: "Back to Black", artist: "Amy Winehouse", capa: "https://upload.wikimedia.org/wikipedia/en/6/67/Amy_Winehouse_-_Back_to_Black_%28album%29.png"),
        
        Song(id: 9, name: "B.Y.O.B", artist: "System Of a Down", capa: "https://upload.wikimedia.org/wikipedia/en/0/02/Mezmerize-LP.jpg"),
        
        Song(id: 10, name: "Anna Júlia", artist: "Los Hermanos", capa: "https://upload.wikimedia.org/wikipedia/pt/e/e7/Los_Hermanos_1999_Los_Hermanos.jpg")
    ]
    
    var arraySugeridos = [
        Song(id: 11, name: "Chau", artist: "No Te Va Gustar", capa: "https://e.snmc.io/i/1200/s/e48505c61e51283e75f813f673604c21/3360652"),
        
        Song(id: 12, name: "Enamorado Tuyo", artist: "El Cuarteto de Nos", capa: "https://upload.wikimedia.org/wikipedia/en/3/3f/Porfiado_-_El_Cuarteto_de_Nos.jpg"),
        
        Song(id: 13, name: "Back In Black", artist: "AC/DC", capa: "https://upload.wikimedia.org/wikipedia/pt/b/b6/Back_in_Black.jpg"),
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(0.0)
                
                ScrollView {
                    VStack{
                        
                        AsyncImage(
                            url: URL(string: "https://www.cimm.com.br/portal/uploads/cimm/asset/file/10856/wide_20200204_fb828dac9c7e4cc39747dc252a64ce0b_novo-actros-hackatruck-4.jpg"),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 300, maxHeight: 300)
                                    .cornerRadius(10.0)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        .padding(.top, 30.0)
                        
                        
                        VStack {
                            HStack {
                                Text("HackaFM")
                                    .font(.largeTitle)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.white)
                                    .padding(.leading, 20.0)
                                Spacer()
                            }
                            HStack {
                                Image("truck")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0)
                                
                                Text("HackaSong")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                Spacer()
                            }
                            .padding(.leading, 25.0)
                            .frame(maxWidth: .infinity)
                        }
                        
                        
                        ForEach(arrayMusicas) { song in
                            NavigationLink(destination: Musica(musicaSelecionada: song )) {
                            HStack{
                                AsyncImage(
                                    url: URL(string: song.capa),
                                    content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 60, maxHeight: 60)
                                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                            .shadow(color: .gray, radius: 3)

                                    },
                                    placeholder: {
                                        ProgressView()
                                    }
                                )
                                .zIndex(3.0)
                                
                                
                                VStack(alignment: .leading) {
                                    Text(song.name)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    Text(song.artist)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.leading)
                                    
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundColor(Color.white)
                                    .padding(.trailing, 10.0)
                                
                            }
                            .padding(.leading, 20.0)
                            
                            
                            .frame(maxWidth: .infinity)
                            .zIndex(10.0)
                        }
                            
                            
                            
                        }
                        .padding(.top, 20.0)
                        Spacer()
                            .frame(height: 40.0)
                        
                            Text("Sugeridos")
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(0)
                                .padding(.leading, 20.0)
                                .frame(maxWidth: .infinity, alignment:
.leading)
                                ScrollView(.horizontal, showsIndicators: false) {
                                
                                    HStack {
                                ForEach(arraySugeridos) { song in
                                    NavigationLink(destination: Musica(musicaSelecionada: song)) {
                                        VStack {
                                            AsyncImage(
                                                url: URL(string: song.capa),
                                                content: { image in
                                                    image.resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(maxWidth: 150, maxHeight: 150)
                                                        .cornerRadius(10.0)
                                                        .shadow(color: .gray, radius: 3)

                                                    
                                                },
                                                placeholder: {
                                                    ProgressView()
                                                }
                                            )
                                            
                                            Text(song.name)
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                            Text(song.artist)
                                                .font(.headline)
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                            
                                        }
                                        .padding(.horizontal, 10.0)
                                    }
                                        }
                                    
                                    
                                }
                                Spacer()
                                }
                                
                            }
                            
                            
                        
                    
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
