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
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}

struct JustifiedText: UIViewRepresentable {
  private let text: String
  private let font: UIFont

  init(_ text: String, font: UIFont = .systemFont(ofSize: 18)) {
    self.text = text
    self.font = font
  }

  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.font = font
    textView.textAlignment = .justified
    return textView
  }

  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
  }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var paisSelecionado: Location
    
    var body: some View {
        HStack {
            Text(paisSelecionado.flag)
                .font(.largeTitle)
            Text(paisSelecionado.name)
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding(.top, 20.0)
        VStack {
            JustifiedText(paisSelecionado.description)
                .padding(.horizontal, 10.0)
        }
        Spacer()
    }
}


struct ContentView: View {
    
    
    var arrayPaises = [
        Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -15.7801, longitude: -47.9292), flag: "🇧🇷", description: "O Brasil é o maior país da América do Sul, com área de mais de 8,5 milhões de km². Tem como capital a cidade de Brasília.\n\nApresenta uma grande variedade climática e paisagística, que pode ser analisada mediante os domínios morfoclimáticos.A população brasileira chegou a 213.317.639 habitantes em 2021, de acordo com o IBGE, com mais de 87% dela vivendo nas cidades. São Paulo, capital do estado de mesmo nome, constitui a maior área urbana do Brasil, com 12 milhões de habitantes. \n\nA economia brasileira, embora liderada pelo setor terciário, se destaca também em áreas como a indústria petroquímica e automobilística e na produção agropecuária, que tem a soja como carro-chefe."),
        
        Location(name: "Estados Unidos", coordinate: CLLocationCoordinate2D(latitude: 38.89511, longitude: -77.03637), flag: "🇺🇸", description: "Estados Unidos ou Estados Unidos da América (EUA), como é chamado oficialmente, são um país localizado no continente americano (subcontinente América do Norte). O país é considerado o mais influente do mundo e exerce forte domínio político, econômico, militar e cultural.\n\nOs EUA participam de diversas organizações, como o Conselho das Nações Unidas; o Acordo Estados Unidos-México-Canadá (USMCA), antigo Nafta; a Otan, dentre outros. A nação mantém relações diplomáticas com a maioria dos países em todas as regiões do mundo.\n\nOs Estados Unidos são também considerados uma nação multicultural. A grande extensão territorial confere ao país uma elevada biodiversidade e o encontro de diversas etnias, contribuindo para uma cultura riquíssima, repleta de particularidades em cada região do país.\n\nSeus aspectos naturais são também bastante diversificados, seja no relevo, no clima, na vegetação, na fauna e na flora, dando ao país o status de “megadiverso” (país que abriga a maioria das espécies da Terra)."),
        
        Location(name: "Chile", coordinate: CLLocationCoordinate2D(latitude: -33.45694, longitude: -70.64827), flag: "🇨🇱", description: "O Chile é um país localizado na América do Sul, e tem como capital o município de Santiago. Dispõe de um extenso litoral banhado pelo oceano Pacífico, a oeste, e conta com a presença da cordilheira dos Andes, a leste, o que lhe confere um relevo montanhoso.\n\nPossui climas muito diversos que vão de seco, ao norte, a úmido, ao sul do país, proporcionando uma paisagem bastante heterogênea. Grande exportador de cobre, o Chile se consolida atualmente como uma das maiores economias latino-americanas."),
        
        Location(name: "Bolivia", coordinate: CLLocationCoordinate2D(latitude: -16.489689, longitude: -68.119293), flag: "🇧🇴", description: "Bolívia, ou Estado Plurinacional da Bolívia, é um país sul-americano localizado na região conhecida como América Andina. O território boliviano é constituído por uma variedade de paisagens naturais marcadas pela presença da cordilheira dos Andes e do Altiplano, assim como de florestas e estepes, a depender da variabilidade do clima. \n\nRico em recursos naturais, como gás natural e petróleo, sua população enfrenta um elevado índice de pobreza e desigualdade que o coloca entre os mais pobres países da América do Sul."),
        
        Location(name: "Zimbábue", coordinate: CLLocationCoordinate2D(latitude: -17.824858, longitude: 31.0485), flag: "🇿🇼", description: "Situado na porção sudeste do continente africano, o território do Zimbábue não possui saída para o mar e limita-se com Moçambique (a nordeste e a leste), África do Sul (ao sul), Botswana (a sudoeste e a oeste) e Zâmbia (ao norte e a noroeste). O nome do país significa “casa de pedra”, no dialeto chona.\n\nCom predominância de clima tropical, Zimbábue possui belas paisagens naturais, sobretudo nas savanas que abrigam diversos animais selvagens. O solo é fértil, fato que possibilita a prática da agricultura. Os principais produtos cultivados são milho, tabaco, algodão, café, cana-de-açúcar, entre outros. Outra importante atividade econômica é a mineração, pois o país possui grandes reservas de ouro, níquel, amianto, etc.\n\nApesar desse potencial econômico, a nação sofre com diversos problemas econômicos, sociais e políticos. A maioria da população vive abaixo da linha de pobreza, ou seja, com menos de 1,25 dólar por dia; mais de 40% dos zimbabuanos são subnutridos; e muitos habitantes são portadores do vírus HIV, fato que reflete diretamente na baixa expectativa de vida (47 anos).\n\nDe acordo com relatório divulgado em 2010 pela Organização das Nações Unidas (ONU), o Índice de Desenvolvimento Humano (IDH) do Zimbábue é de apenas 0,140, sendo a pior média entre os 169 países que compõem o ranking mundial."),
        
        Location(name: "Japão", coordinate: CLLocationCoordinate2D(latitude: 35.6894, longitude: 139.692), flag: "🇯🇵", description: "O Japão é um país asiático banhado pelo oceano Pacífico. Seu território é formado por milhares de ilhas, das quais se destacam quatro: Honshu, a maior delas e onde fica a capital japonesa, Tóquio, Hokkaido, Shikoku e Kyushu.\n\nSituado em uma das áreas mais geologicamente instáveis do mundo, o Japão possui um relevo montanhoso que influencia a distribuição de umidade pelo país. Dois climas são predominantes, o temperado e o tropical. O país possui uma população de mais de 126 milhões de habitantes, além de uma economia altamente desenvolvida e reconhecida pela utilização de avançada tecnologia no setor industrial."),
        
        Location(name: "Itália", coordinate: CLLocationCoordinate2D(latitude: 41.8905, longitude: 12.4942), flag: "🇮🇹", description: "A Itália é um país europeu situado na porção sul do continente. Sua capital é a cidade de Roma. Banhada pelo mar Mediterrâneo, a Itália dispõe de climas mediterrâneo e temperado, o que varia conforme a altitude. O relevo do país é caracterizado por regiões planas e acidentadas, com destaque para feições como os Alpes e os Apeninos. \n\nAlém do mais, a Itália abriga o maior vulcão ativo da Europa. O país tem mais de 60 milhões de habitantes e uma economia altamente desenvolvida, centrada no setor de serviços, com destaque para o turismo, e na indústria.")
            ]
    
    
    @State private var showingSheet = false
    
    @State var aux = Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -15.7801, longitude: -47.9292), flag: "🇧🇷", description: "O Brasil é o maior país da América do Sul, com área de mais de 8,5 milhões de km². Tem como capital a cidade de Brasília.\n\nApresenta uma grande variedade climática e paisagística, que pode ser analisada mediante os domínios morfoclimáticos.A população brasileira chegou a 213.317.639 habitantes em 2021, de acordo com o IBGE, com mais de 87% dela vivendo nas cidades. São Paulo, capital do estado de mesmo nome, constitui a maior área urbana do Brasil, com 12 milhões de habitantes. \n\nA economia brasileira, embora liderada pelo setor terciário, se destaca também em áreas como a indústria petroquímica e automobilística e na produção agropecuária, que tem a soja como carro-chefe.")
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .zIndex(0.0)
                .opacity(0.5)
            
            VStack {
                Text("Mapa do Mundo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    Text(aux.flag)
                        .font(.title)
                    Text(aux.name)
                        .fontWeight(.semibold)
                }
                .font(.title)
                
                
                Map(coordinateRegion: $region, annotationItems: arrayPaises) { pais in
                    MapAnnotation(coordinate: pais.coordinate) {
                        Circle()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.033, brightness: 0.245))
                            .overlay(
                                Circle()
                                    .frame(width: 27.0, height: 27.0)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                    .overlay(
                                        Button(" ") {
                                            aux = pais
                                            showingSheet.toggle()
                                        }
                                            .sheet(isPresented: $showingSheet) {
                                                SheetView(paisSelecionado: $aux)
                                            }
                                            .frame(width: 25.0, height: 25.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                                    )
                            )
                            .shadow(radius: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                        
                        //ontapgesture{}
                        
                        
                        
                    }
                    
                }
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(arrayPaises) { pais in
                            Button(pais.name) {
                                
                                aux = pais
                                region = MKCoordinateRegion(center: aux.coordinate,span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
                            }
                            .padding(.all, 10.0)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.578, saturation: 0.825, brightness: 0.711)/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .shadow(radius: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                            
                            
                            
                        }
                        
                    }
                    .padding([.top, .leading, .trailing], 10.0)
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
