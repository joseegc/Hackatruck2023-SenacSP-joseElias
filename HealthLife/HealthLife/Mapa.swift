
//
//  ContentView.swift
//  Aula0609
//
//  Created by Student10 on 06/09/23.
//

import SwiftUI
import Foundation
import MapKit


struct Location: Identifiable {
    let id: Int?
    let nome: String?
    let endereco: String?
    let avaliacao: Double?
    let coordenada: CLLocationCoordinate2D
    let mapaURL: String?
    let imagemURL: String?
    let imagemURL2: String?
}




struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var localSelecionado: Location
    
    var body: some View {
        VStack {
            Text(localSelecionado.nome!)
                .font(.title)
                .fontWeight(.semibold)
            
            
            
            Text(String(localSelecionado.avaliacao!) +
                 "★")
            .font(.title)
            .fontWeight(.semibold)
            
            
            Link(localSelecionado.endereco!, destination: URL(string: localSelecionado.mapaURL!)!)
                .font(.headline)
                .frame(width: 300.0)
                .fontWeight(.semibold)
                .padding(.vertical, 10.0)
            
            
            AsyncImage(
                url: URL(string: localSelecionado.imagemURL!),
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
            .padding(.bottom, 5.0)
            AsyncImage(
                url: URL(string: localSelecionado.imagemURL2!),
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
            Spacer()
        }
        .padding(.top, 20.0)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
        
        
        
    }
}


struct Mapa: View {
    let locationManager = CLLocationManager()
    
    var arrayLocais: [Location] = [
        Location(id: 1, nome: "Hospital Albert Einstein", endereco: "Av. Albert Einstein, 627/701 - Morumbi, São Paulo - SP", avaliacao: 4.4, coordenada: CLLocationCoordinate2D(latitude: -23.59996, longitude: -46.715211), mapaURL: "https://www.google.com/maps/d/viewer?mid=1ie4bLF8a-KGm78ZKYx3vXSggCtY&hl=en_US&ll=-23.598992000000017%2C-46.715018000000015&z=17", imagemURL: "https://upload.wikimedia.org/wikipedia/commons/a/aa/Hospital_Albert_Einstein_S%C3%A3o_Paulo.jpg", imagemURL2: "https://ictq.com.br/images/atencao-farmaceuticos-einstein-vai_contratar-1-4-mil-profissionais-de_saude-durante-pandemia.jpg"),
        
        
        Location(id: 2, nome: "Doutor Consulta", endereco: "Shopping Sp Market - Av. das Nações Unidas, 22540 - Jurubatuba, São Paulo - SP", avaliacao: 3.9, coordenada: CLLocationCoordinate2D(latitude: -23.678545, longitude: -46.698598),mapaURL: "https://www.google.com.br/maps/place/dr.consulta/@-23.6785547,-46.708134,16z/data=!4m10!1m2!2m1!1sclinicas!3m6!1s0x94ce50269d3fda09:0xc0acb02404e26266!8m2!3d-23.678555!4d-46.698607!15sCghjbGluaWNhc1oKIghjbGluaWNhc5IBDm1lZGljYWxfY2VudGVymgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVVF0YTNSZlZsQm5FQUXgAQA!16s%2Fg%2F11cpmsdplj?entry=ttu", imagemURL: "https://lh3.googleusercontent.com/p/AF1QipNJ-GRgH6_PVUTzEx4-uaOEFJYbdV_TR1G8U-9M=s1360-w1360-h1020", imagemURL2: "https://lh3.googleusercontent.com/p/AF1QipNNyckYfzLLhIE2II4Kso9R2M7qQ9_UbC0_hHNI=s1360-w1360-h1020"),
        
        Location(id: 3, nome: "Clínica de Psicologia", endereco: "R. Profa. Maria de Lourdes Souza Nogueira, 292 - Vila Gea, São Paulo - SP", avaliacao: 0, coordenada: CLLocationCoordinate2D(latitude: -23.675930, longitude: -46.688536), mapaURL: "https://www.google.com.br/maps/place/Cl%C3%ADnica+de+Psicologia/@-23.6759968,-46.6883853,21z/data=!4m10!1m2!2m1!1sclinicas!3m6!1s0x94ce516b07f776b9:0x8fd7e129a29afcd5!8m2!3d-23.6759392!4d-46.6885451!15sCghjbGluaWNhc5IBFG1lbnRhbF9oZWFsdGhfY2xpbmlj4AEA!16s%2Fg%2F11h5m8b7yl?entry=ttu", imagemURL: "https://www.charlotteathleticclub.com/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png", imagemURL2: "https://www.charlotteathleticclub.com/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png"),
        
        
        Location(id: 4, nome: "Hospital Ruben Berta", endereco: "Av. Rubem Berta, 1100 - Indianópolis, São Paulo - SP", avaliacao: 3.8, coordenada: CLLocationCoordinate2D(latitude: -23.6023003, longitude: -46.6516758), mapaURL: "https://www.google.com/maps/place/Hospital+Ruben+Berta/@-23.6023003,-46.6516758,15z/data=!4m6!3m5!1s0x94ce5a17deee9531:0x6e8b52fafaffd6e8!8m2!3d-23.6023003!4d-46.6516758!16s%2Fg%2F1tqnmry7?entry=ttu", imagemURL: "https://lh3.googleusercontent.com/p/AF1QipMDvG-mDESsWU3tmGJDiQYeIFAU7riOKJESQSbe=s1360-w1360-h1020", imagemURL2: "https://lh3.googleusercontent.com/p/AF1QipMevFnJnOy60q14s3coojUwIGT8kGn5gnO3Nn2q=s1360-w1360-h1020"),
        
        Location(id: 5, nome: "Clínica Domingos Sávio", endereco: "Av. Atlântica, 1237 - Socorro, São Paulo - SP, 04768-200", avaliacao: 4.6, coordenada: CLLocationCoordinate2D(latitude: -23.6773018, longitude: -46.7533651), mapaURL: "https://www.google.com/maps/place/Hospital+Ruben+Berta/@-23.6023003,-46.6516758,15z/data=!4m6!3m5!1s0x94ce5a17deee9531:0x6e8b52fafaffd6e8!8m2!3d-23.6023003!4d-46.6516758!16s%2Fg%2F1tqnmry7?entry=ttu", imagemURL: "https://lh3.googleusercontent.com/p/AF1QipMDvG-mDESsWU3tmGJDiQYeIFAU7riOKJESQSbe=s1360-w1360-h1020", imagemURL2: "https://lh3.googleusercontent.com/p/AF1QipMevFnJnOy60q14s3coojUwIGT8kGn5gnO3Nn2q=s1360-w1360-h1020")
        
        
        
    ]
    
    
    
    @State var aux =   Location(id: 1, nome: "Hospital Albert Einstein", endereco: "Avenida Albert Einstein, 627", avaliacao: 4.4, coordenada: CLLocationCoordinate2D(latitude: -23.59996, longitude: -46.715211), mapaURL: "https://www.google.com/maps/d/viewer?mid=1ie4bLF8a-KGm78ZKYx3vXSggCtY&hl=en_US&ll=-23.598992000000017%2C-46.715018000000015&z=17", imagemURL: "https://upload.wikimedia.org/wikipedia/commons/a/aa/Hospital_Albert_Einstein_S%C3%A3o_Paulo.jpg", imagemURL2: "https://ictq.com.br/images/atencao-farmaceuticos-einstein-vai_contratar-1-4-mil-profissionais-de_saude-durante-pandemia.jpg")
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.6702073, longitude: -46.7006395),span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State private var showingSheet = false
    
    
    
    var body: some View {
        
        ZStack {
            
            VStack {
                HStack {
                    Text("Consultórios")
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
                
                
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: arrayLocais) { local in
                    MapAnnotation(coordinate: local.coordenada) {
                        
                        Circle()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.033, brightness: 0.245))
                            .overlay(
                                Circle()
                                    .frame(width: 27.0, height: 27.0)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                    .overlay(
                                        
                                        
                                        Button(" ") {
                                            aux = local
                                            showingSheet.toggle()
                                        }
                                            .sheet(isPresented: $showingSheet) {
                                                SheetView(localSelecionado: $aux)
                                            }
                                            .frame(width: 24.0, height: 24.0)
                                            .background(Color(hue: 1.0, saturation: 0.865, brightness: 0.693))
                                            .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                                    )
                            )
                            .shadow(radius: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                        
                        //ontapgesture{}
                    }
                }
                .padding(.top, -10.0)
                .onAppear{
                    locationManager.requestWhenInUseAuthorization()
                }
                
                
                
                
            }             }
    }
}





struct Mapa_Previews: PreviewProvider {
    static var previews: some View {
        Mapa()
    }
}




