//
//  ContentView.swift
//  Aula0109
//
//  Created by Student10 on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var peso: String = ""
    @State var altura: String = ""
    @State var condicaoIMC: String = "Normal"
    @State var corFundo: String = "normal"
    @State var imc: Double = 20


    var body: some View {
        ZStack {
            Color(corFundo)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.top, -17.0)
                
                VStack {
                        TextField("Peso (kg)", text: $peso)
                        .frame(width: 370, height: 40)
                        .multilineTextAlignment(.center)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        .cornerRadius(5.0)
                        .padding(.all)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                
                    TextField("Altura (m)", text: $altura)
                        .padding(.all)
                        .frame(width: 370, height: 40)
                        .multilineTextAlignment(.center)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        .cornerRadius(5.0)
                        .padding(.all)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    Button("Calcular") {

                        imc = Double(peso)! / (Double(altura)! * Double(altura)!)
                        
                            if (imc < 18.5) {
                                condicaoIMC = "Baixo Peso"
                                corFundo = "baixoPeso"
                            } else if (imc >= 18.5 && imc < 25) {
                                condicaoIMC = "Normal"
                                corFundo = "normal"
                            } else if (imc >= 25 && imc < 30) {
                                condicaoIMC = "Sobrepeso"
                                corFundo = "sobrepeso"
                            } else {
                                condicaoIMC = "Obesidade"
                                corFundo = "obesidade"
                            }
                            
                        
                    }
                    
                    .frame(width: 130.0, height: 45.0)
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                }
                Spacer()
                Text(condicaoIMC)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
                Image("tabela-IMC")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(1/1, contentMode: .fill)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
