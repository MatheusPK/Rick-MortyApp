//
//  UIImageView+setImage.swift
//  Rick&MortyApp
//
//  Created by André Barros on 03/11/25.
//

import UIKit

extension UIImageView {
    func setImage(request: RequestType) {
        
        DispatchQueue.global().async {
            
            let requestProvider = RequestProviderImp()
            
            requestProvider.fetchData(request: request) { result in
                
                switch result {
                case .success(let data):
                    guard let data else { return }
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
