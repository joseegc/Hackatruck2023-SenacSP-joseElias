//
//  ViewModel.swift
//  Aula1209
//
//  Created by Student10 on 12/09/23.
//


import Foundation

struct Carro : Codable, Hashable {
let modelo: String?
let ano: Int?
let cor: String?
let preco: Double?
}

struct Estacionamento : Codable, Identifiable {
    let id: Int?
    //let _id: String?
    //let _rev : String?
    let estacionamento: String?
    let endereco: String?
    let vaga: Int?
    let carro: [Carro]
}

class ViewModel : ObservableObject {
    @Published var estacionamentos : [Estacionamento] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/joseeliasREAD") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.estacionamentos = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

