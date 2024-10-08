//
//  ImageLoader.swift
//  SoulFoodApp
//
//  Created by Jia Zheng Cheong on 2/9/24.
//

import Combine
import Foundation
class ImageLoader: ObservableObject {
    var dataPublisher = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            dataPublisher.send(data)
        }
     }
    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
        guard let data = data else { return }
            
        DispatchQueue.main.async {
           self.data = data
        }
    }
    task.resume()
  }
}
