//
//  Perfil.swift
//  HealthLife
//
//  Created by Student10 on 22/09/23.
//

import SwiftUI

struct Perfil: View {
    @State var username: String = ""
    @State var dataDeNascimento: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack
        {
            HStack {
                
                Text("Perfil")
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
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 175, alignment: .center)
                        .padding(.bottom)
                        .foregroundColor(Color("themePerfil"))
                        .offset(y:20)
                    
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 55, alignment: .center)
                        .padding(.top, -45.0)
                        .foregroundColor(Color("Topo"))
                        .offset(y:20)
                            
                    
                                
                                            
                }
            }
            VStack
            {
                HStack
                {
                    Text("Nome: ")
                        
                    TextField(
                           "Nome ",
                           text: $username
                       )
                    
                }
                
                HStack
                {
                    Text("Data de Nascimento: ")
                    TextField(
                           "Data ",
                           text: $dataDeNascimento
                       )
                }
                HStack
                {
                    Text("E-mail: ")
                    TextField(
                           "Endereço de e-mail ",
                           text: $email
                       )
                }
                
                Spacer()
                    .frame(height: 50.0)
                Button("Salvar"){
                    GlobalString.usernameGlobal = username
                }
                .padding(50.0)
                .frame(width: 150.0, height: 50.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Topo")/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .bold()
                .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
            }
            .padding([.top, .leading], 20.0)
            
            
                
            Spacer()
            
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
       
    } }

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}
