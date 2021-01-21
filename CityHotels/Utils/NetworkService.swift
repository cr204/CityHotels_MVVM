//
//  NetworkService.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import Foundation

struct NetworkService {

    static func getJSON<T: Decodable>(urlString: String, completionHandler: @escaping (T?) -> Void) {
        
        let urlComp = NSURLComponents(string: urlString)!
        
        let request = URLRequest(url: urlComp.url!)
        URLSession.shared.dataTask(with: request) { (data, responce, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
            guard let data = data else {
                completionHandler(nil)
                return
            }
            
//            let dataAsString = String(data: data, encoding: .utf8)!
//            print("________DATA___________")
//            print(dataAsString)
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(decodedData)
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
                completionHandler(nil)
            }

        }.resume()
        
    }
}
