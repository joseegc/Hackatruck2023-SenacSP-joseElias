//
//  ViewModel.swift
//  Aula1209
//
//  Created by Student10 on 12/09/23.
//


import Foundation

struct Character : Codable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let title: String?
    let family: String?
    let image: String?
    let imageUrl: String?
}

class ViewModel : ObservableObject {
    @Published var chars : [Character] = []
    
    func fetch(){
        guard let url = URL(string: "https://thronesapi.com/api/v2/Characters") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Character].self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
