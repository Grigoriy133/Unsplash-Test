//
//  storageService.swift
//  Unspash Test
//
//  Created by Grigoriy Korotaev on 09.09.2023.
//

import Foundation

let key1 = "key1"

class StorageService {
    static let shared = StorageService()
    
    var idArray = ["WH_TyGBhvK8"]
    
    public var randomPhotoArray = [Welcome]()
    public var preferPhotoArray = [Welcome]()
    
    func refreshIdArray(){
        StorageService.shared.idArray = UserDefaults.standard.array(forKey: key1) as? [String] ?? [""]
    }
    
    func saveToPreferList(id: String){
        StorageService.shared.idArray.append(id)
        UserDefaults.standard.set(idArray, forKey: key1)
    }
    func deleteFromPreferList(id: String){
        for i in idArray {
            if id == i {
                StorageService.shared.idArray.removeAll { $0 == id }
                UserDefaults.standard.set(idArray, forKey: key1)
            }
        }
    }
    
}
