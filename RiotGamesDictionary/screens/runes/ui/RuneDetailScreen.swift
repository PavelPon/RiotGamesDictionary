//
//  RuneDetailScreen.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 09.02.2024.
//

import SwiftUI
import ComposableArchitecture
struct RuneDetailScreen: View {
    var store: StoreOf<RuneDetailStore>
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing:10){
                HStack(spacing:20){
                    
                    if let source =  URL(string: store.rune.icon?.urlIconRune() ?? "") {
                        TestCacheImageView(source: source)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100,height: 100)
                            .background(Color.clear)
                            .cornerRadius(5)
                    }
                    Text("\(store.rune.name ?? "")")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                Text("\(store.rune.longDesc ?? "")")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                
                
            }.padding(10)
        }
        .frame(maxWidth: .infinity,maxHeight:.infinity)
        .background {
            Rectangle()
                .fill(ColorResources.color2.gradient)
                .ignoresSafeArea(.all)
        }
    }
}
