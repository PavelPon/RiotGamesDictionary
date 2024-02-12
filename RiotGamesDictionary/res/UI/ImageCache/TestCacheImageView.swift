//
//  TestCacheImageView.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 10.02.2024.
//

import SwiftUI

struct TestCacheImageView: View {
    private let source: URLRequest
    @State private var image: UIImage?
    @Environment(\.imageLoader) private var imageLoader
    
    init(source: URL) {
        self.init(source: URLRequest(url: source))
    }
    
    init(source: URLRequest){
        self.source = source
    }
    
    var body: some View {
        Group {
            if let image = image{
                Image(uiImage: image)
                    .resizable()
            }else{
                Rectangle()
                    .background(Color.clear)
            }
        }.task {
            await loadImage(at:source)
        }
    }
    
    
    func loadImage(at source:URLRequest) async {
        do{
            image = try await imageLoader.fetch(source)
        } catch{
            print(error)
        }
    }
}
