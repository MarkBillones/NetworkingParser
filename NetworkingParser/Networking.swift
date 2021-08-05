//
//  Networking.swift
//  NetworkingParser
//
//  Created by OPSolutions on 8/4/21.
//

import Foundation

let baseURL = "https://jsonplaceholder.typicode.com"

class Networking: API {
    
    func fetch<Model: Codable>(resource: String, model: Model.Type, completionHandler: @escaping ([Codable]) -> Void){
        
        let session = URLSession(configuration: .default)
        let url = URL(string: "\(baseURL)/\(resource)")
        
        guard let url = url else {
            return
        }
        
        let task = session.dataTask(with: url) { data, _, error in
            do {
                let jsonDecoder = JSONDecoder()
                
                let albums = try jsonDecoder.decode([Album].self, from: data!)
                
                DispatchQueue.main.async {
                    completionHandler(albums)
                }
            }catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetchAlbums() {
        //https://jsonplaceholder.typicode..com/albums
        let session = URLSession(configuration: .default)
        let url = URL(string: "\(baseURL)/albums")
        
        guard let url = url else {
            return
        }
        
        let task = session.dataTask(with: url) { data, _, error in
            do {
                let jsonDecoder = JSONDecoder()
                
                let albums = try jsonDecoder.decode([Album].self, from: data!)
                
                for album in albums {
                    print("Title: \(album.title)")
                }
            }catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
