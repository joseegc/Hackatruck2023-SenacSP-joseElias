//
//  Model.swift
//  HealthLife
//
//  Created by Student10 on 26/09/23.
//

import Foundation

struct TaskP :  Hashable, Codable{

    let data: String?
    let titulo: String?
    
}

struct TaskGDP :Hashable, Codable
{
    let _id : String?
    let _rev : String?
    var titulo : String?
    var data : String?
}


class TaskModel: ObservableObject {
    
    @Published var tasks : [TaskGDP] = []
    
    
    
    func fetch2(){
        guard let url = URL(string: "http://192.168.128.203:1880/healthLifeTaskRead") else {
   
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([TaskGDP].self, from: data)
                
                DispatchQueue.main.async {
                    self!.tasks = parsed
                    print("Persons : \(self!.tasks)")
                }
            } catch {
                print(error)
                print("Persons : \(self!.tasks)")
            }
        }
        
        task.resume()
    }
    
    func postItem(item : TaskP){
        
        // var ?
        
        //    for index in offsets {
        //        print("Deleted item at index \(index)")
        //        item = listPersonMusic[index]
        //    }
        
        guard let url = URL(string: "http://192.168.128.203:1880/healthLifeTaskPost") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let data = try JSONEncoder().encode(item)
            request.setValue("\(String(describing: item))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error deleting resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource deleted successfully")
            } else {
                print("Error deleting resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
        
        // listPersonMusic.remove(atOffsets: offsets)
        
    }
    
    func remove(item : TaskGDP){
        
        guard let url = URL(string: "http://192.168.128.203:1880/healthLifeTaskDelete") else { return }

        var request = URLRequest(url: url)
      
        request.httpMethod = "DELETE"
        
        do {
            let data = try JSONEncoder().encode(item)
            
            print(item)
            request.setValue("\(String(describing: item))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error deleting resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource deleted successfully")
            } else {
                print("Error deleting resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
    
        
        
 }
    func Update(item : TaskGDP){
        
        guard let url = URL(string: "http://192.168.128.203:1880/healthLifeTaskPut") else { return }

        var request = URLRequest(url: url)
      
        request.httpMethod = "PUT"
        
        do {
            let data = try JSONEncoder().encode(item)
            
            print(item)
            request.setValue("\(String(describing: item))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error deleting resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource deleted successfully")
            } else {
                print("Error deleting resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
        
 }
    
    
}


