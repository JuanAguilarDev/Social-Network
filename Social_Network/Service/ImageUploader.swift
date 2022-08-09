//
//  ImageUploader.swift
//  Social_Network
//
//  Created by Juan Aguilar on 08/08/22.
//

import Firebase
import FirebaseStorage
import UIKit
import SwiftUI
// Subir la imagen a la base de datos
struct ImageUploader{
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let filename = NSUUID().uuidString // Valor unico 
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil){
            _, error in
            if let error = error {
                print("An Error occurs whe upload the image: \(error)")
                return
            }
            
            ref.downloadURL(){ imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
                
            }
            
        }
        
    }
}

