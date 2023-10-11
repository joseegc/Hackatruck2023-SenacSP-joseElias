import Foundation


struct postagem: Hashable, Decodable{
    let titulo : String?
    let  imagem : String?
    let descricao : String?
    let ingrediente : String?
    let preparo: String?
}

class ViewModel : ObservableObject {
    @Published var chars : [postagem] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.203:1880/feedGET" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([postagem].self, from: data)
                
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


