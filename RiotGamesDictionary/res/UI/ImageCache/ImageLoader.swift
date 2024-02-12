//
//  ImageLoader.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 10.02.2024.
//

import Foundation
import UIKit
actor ImageLoader {
    private var images:[URLRequest:LoaderStatus] = [:]
    public func fetch(_ url: URL) async throws -> UIImage{
        let request = URLRequest(url: url)
        return try await fetch(request)
    }
    
    public func fetch(_ urlRequest: URLRequest) async throws -> UIImage {
        if let status = images[urlRequest]{
            switch status {
            case .fetched(let image):
                return image
                
            case .inProcess(let task):
                return try await task.value
            }
        }
        
        if let image = try self.imageFromFileSystem(for: urlRequest){
            images[urlRequest] = .fetched(image)
            return image
        }
        
        let task:Task<UIImage,Error> = Task{
            let (imageData,_) =  try await URLSession.shared.data(for: urlRequest)
            let image = UIImage(data: imageData)!
            do {
                try self.persistImage(image,for: urlRequest)
            }catch{
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
            return image
        }
        
        images[urlRequest] = .inProcess(task)
        
        let image = try await task.value
        
        images[urlRequest] = .fetched(image)
        
        return image
        
    }
    
    private func imageFromFileSystem(for urlRequest: URLRequest) throws -> UIImage? {
        guard let url = fileName(for:urlRequest) else{
            assertionFailure("Unable to generate a local path for \(urlRequest)")
            return nil
        }
        let data  = try? Data(contentsOf: url)
        guard let data = data else{
            return nil
        }
        return UIImage(data: data)
    }
    
    private func fileName(for urlRequest: URLRequest) -> URL?{
        guard let fileName = urlRequest.url?.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let applicationSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return applicationSupport.appendingPathComponent(fileName)
    }
    
    
    private func persistImage(_ image:UIImage, for urlRequest:URLRequest) throws {
        guard let url = fileName(for: urlRequest),let data = image.jpegData(compressionQuality: 0.8) else{
            assertionFailure("Unable to generate a local path for \(urlRequest)")
            return
        }
        try data.write(to: url)
    }
    private enum LoaderStatus{
        case inProcess(Task<UIImage,Error>)
        case fetched(UIImage)
    }
}
