//
//  ImageLoaderKey.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 10.02.2024.
//

import Foundation
import SwiftUI

struct ImageLoaderKey: EnvironmentKey {
    static let defaultValue = ImageLoader()
}

extension EnvironmentValues {
    var imageLoader: ImageLoader {
        get { self[ImageLoaderKey.self] }
        set { self[ImageLoaderKey.self ] = newValue}
    }
}
