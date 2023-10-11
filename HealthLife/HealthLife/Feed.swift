//
//  ContentView.swift
//  Pagina
//
//  Created by Student17 on 22/09/23.
//

import SwiftUI
struct Feed: View {
    @StateObject var viewModel = ViewModel()
    

    var body: some View {
        VStack {
            NavigationStack {
                VStack{
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("Feed")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .padding([ .leading, .vertical], 20.0)
                        }
                        Spacer()
                        Image("healthlogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.top, .bottom, .trailing], 20.0)
                            .padding(.leading, 70.0)
                            .frame(height: 100.0)
                        
                        
                    }
                    .frame(height: 80.0)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    .background(Color(red: 0.2901960784313726, green: 0.7803921568627451, blue: 0.5411764705882353))
                    
                    .background(Color.green)
                    ScrollView{
                        ForEach(viewModel.chars, id:\.self){ index in
                            Text(index.titulo!)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 27.0)
                                .background( Color("Topo"))
                                .cornerRadius(50.0)
                            AsyncImage(
                                url: URL(string: "\(index.imagem!)"),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 350, maxHeight: 350)
                                        .cornerRadius(10)
                                        .shadow(color: .gray, radius: 3)
                                        .padding(10.0)
                                    
                                    
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            
                            Text(index.descricao!)
                                .fontWeight(.heavy)
                                .padding(.vertical, 10.0)
                                
                                
                            Text("Ingredientes")
                                .font(.title)
                                .padding(10.0)
                                
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Topo")/*@END_MENU_TOKEN@*/)
                                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                .cornerRadius(15.0)
                            Text(index.ingrediente!)
                                .multilineTextAlignment(.center)
                                .padding(.leading, 10.0)
                            Text("Preparo")
                                .font(.title)
                                .padding(10.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Topo")/*@END_MENU_TOKEN@*/)
                                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                .cornerRadius(15.0)
                            Text(index.preparo!)
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 10.0)
                            Text("                                                                                        ")
                                .padding(.vertical, 10.0)
                                .background(Color("separador"))
                            
                                
                            
                            
                        }
                        .padding(.top, 10.0)
                    }
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
                    Spacer()
                    
                }.onAppear(){
                    viewModel.fetch()
                }.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
            }
            
            
            .ignoresSafeArea()
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
    }
    
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}

