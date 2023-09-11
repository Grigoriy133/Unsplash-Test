//
//  LoadDataClass.swift
//  Unspash Test
//
//  Created by Grigoriy Korotaev on 08.09.2023.
//

import Foundation
import Alamofire

class loadDataService {
    static let shared = loadDataService()
    var newsData: Welcome!

    func getRandomPhoto(completion: @escaping ([Welcome]?) -> Void) {
        let url =  "https://api.unsplash.com/photos/random/?client_id=mvB09JG1_Ho6iw6TAFZQi7JZTLwtDSa3p1p4YMKtfZQ&count=20"
        AF.request(url).responseDecodable(of: [Welcome].self) { response in
            switch response.result {
            case .success(let values):
                completion(values)
            case .failure(let error):
                print("Ошибка запроса: \(error)")
                completion(nil)
            }
        }
    }
    func getIdPhoto(id: String, completion: @escaping (Welcome?) -> Void) {
        let url =  "https://api.unsplash.com/photos/" + id + "/?client_id=mvB09JG1_Ho6iw6TAFZQi7JZTLwtDSa3p1p4YMKtfZQ"
        AF.request(url).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                print("Ошибка запроса: \(error)")
                completion(nil)
            }
        }
    }
    func getRequestQuery(query: String, completion: @escaping ([Welcome]?) -> Void) {
        let url = "https://api.unsplash.com/photos/random/?client_id=mvB09JG1_Ho6iw6TAFZQi7JZTLwtDSa3p1p4YMKtfZQ&count=20&query=" + query
        AF.request(url).responseDecodable(of: [Welcome].self) { response in
            switch response.result {
            case .success(let values):
                completion(values)
            case .failure(let error):
                print("Ошибка запроса: \(error)")
                completion(nil)
            }
        }
    }

}
