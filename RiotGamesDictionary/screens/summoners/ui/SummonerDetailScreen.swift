//
//  SummonerDetailScreen.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 09.02.2024.
//

import SwiftUI
import ComposableArchitecture
struct SummonerDetailScreen: View {
    var store: StoreOf<SummonerDetailStore>
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment:.leading,spacing:10){
                HStack(spacing:20){
        
                    if let source =  URL(string: store.summoner?.image.full.urlIcon(version: store.version, group: store.summoner?.image.group ?? "") ?? "") {
                        TestCacheImageView(source: source)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100,height: 100)
                            .background(Color.clear)
                            .cornerRadius(5)
                    }
                    

                    Text("\(store.summoner?.name ?? "")")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                Text("\(store.summoner?.description ?? "")")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                
                
                Text("cooldown: \(store.summoner?.cooldownBurn ?? "")".uppercased())
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                
                Text("cost: \(store.summoner?.costBurn ?? "")".uppercased())
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                
                Text("costType: \(store.summoner?.costType ?? "")".uppercased())
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                
                
                Text("rangeType: \(store.summoner?.rangeBurn ?? "")".uppercased())
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
        .onAppear {
            store.send(.onAppear)
        }
    }
}


