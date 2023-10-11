//
//  ContentView.swift
//  HealthLife
//
//  Created by Student10 on 20/09/23.
//

import SwiftUI
struct GlobalString{
    
    static var usernameGlobal: String = "Usuário"
}


struct VerReceita: View {
    
        @Environment(\.dismiss) var dismiss
        @Binding var postagemSelecionada: postagem
        
        
    var body: some View {
            VStack {
                HStack {
                    
                    Text("Receita")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .padding(.leading, 10.0)
                    
                    Spacer()
                    Image("healthlogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.top, .bottom, .trailing], 20.0)
                        .padding(.leading, 70.0)
                        .frame(height: 100.0)
                }
                .frame(height: 80.0)
                .zIndex(1.0)
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .background(Color("Topo"))
                Spacer()
                Text(postagemSelecionada.titulo!)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .trailing], 10.0)
                
                AsyncImage(
                    url: URL(string: postagemSelecionada.imagem!),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 350, maxHeight: 350)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3)
                        
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                
                Text(postagemSelecionada.descricao!)
                    .padding()
                Spacer()
                    .frame(height: 200.0)
                
               
            }
            
        }
    
}

    struct Home: View {
        
        @State var a = 0
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        @StateObject var taskModel = TaskModel()
        @StateObject var feed = ViewModel()
        @State private var showingSheet = false
        @State var postagemAux = postagem(titulo: "a", imagem: "a", descricao: "a", ingrediente: "a", preparo: "a")
        
        var body: some View {
                VStack {
                    HStack {
                        
                        Text("Olá, \(GlobalString.usernameGlobal)!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .padding(.leading, 10.0)
                        
                        Spacer()
                        Image("healthlogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.top, .bottom, .trailing], 20.0)
                            .padding(.leading, 70.0)
                            .frame(height: 100.0)
                    }
                    .frame(height: 80.0)
                    .zIndex(1.0)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    .background(Color("Topo"))
                    ZStack
                    {
                        VStack
                        {
                            HStack {
                                
                                Text("Próximos Agendamentos")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(5)
                                
                            }
                            VStack {
                                ScrollView {
                                    ForEach(taskModel.tasks, id:\.self) { task in
                                        HStack
                                        {
                                            Text(task.titulo!)
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .padding(12)
                                            
                                            Spacer()
                                            Text(task.data!)
                                                .font(.system(size: 20))
                                                .padding(12)
                                        }
                                        
                                        .frame(width: 340,height: 70)
                                        
                                        .background(Color("themeTask"))
                                        .cornerRadius(5)
                                        .shadow(radius: 4)
                                        
                                        .padding(3)
                                    }
                                }
                                .background(Color("themeB"))
                            }
                            
                        }
                        .padding(.top)
                    }
                    .frame(width: 375.0, height: 270.0)
                    .background(Color("themeB"))
                    .cornerRadius(5)
                    .shadow(radius: 10)
                    
                    Text("Feed")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 10.0)
                        .padding(.bottom, -5)
                    
                    VStack() {
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(feed.chars, id:\.self){ index in
                                    VStack {
                                        AsyncImage(
                                            url: URL(string: "\(index.imagem!)"),
                                            content: { image in
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxWidth: 340, maxHeight: 310)
                                                    .cornerRadius(10)
                                                    .shadow(color: .gray, radius: 3)
                                                    .padding(10.0)
                                                
                                                
                                            },
                                            placeholder: {
                                                ProgressView()
                                            }
                                        )
                                        .onTapGesture {
                                            postagemAux = index
                                            showingSheet.toggle()
                                            
                                            
                                            
                                            
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                            VerReceita(postagemSelecionada: $postagemAux)
                                        }
                                        
                                        Text(index.titulo!)
                                            .font(.subheadline)
                                        Spacer()
                                            
                                    }
                                }
                                
                                
                                .padding(.bottom, 10.0)
                                
                                .padding(.vertical, 5.0)
                            }
                            .padding(.horizontal, 10.0)
                            
                        }
                        .frame(width: 355.0, height: 190.0)
                        .cornerRadius(5)
                        .background(Color("themeB"))
                        
                        
                        Spacer()
                    }
                    .onAppear{
                        taskModel.fetch2()
                        
                        feed.fetch()
                        
                    }
                    .cornerRadius(5.0)
                    
                }
            
        }
    
        struct Home_Previews: PreviewProvider {
            static var previews: some View {
                Home()
            }
        }
    }


