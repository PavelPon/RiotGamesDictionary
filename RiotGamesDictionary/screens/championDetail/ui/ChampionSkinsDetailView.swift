//
//  ChampionSkinsDetailView.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 08.02.2024.
//

import SwiftUI
import ComposableArchitecture
struct ChampionSkinsDetailView: View {
    @Bindable var store: StoreOf<ChampionDetailStore>
    var body: some View {
                ScrollView(.horizontal){
                    HStack(spacing:0){
                        ForEach(Array(store.championSkins.enumerated()),id: \.offset){ offset , skin in
                            if let source =  URL(string: skin.url) {
                                TestCacheImageView(source: source)
                                .aspectRatio(contentMode: .fit)
                                .containerRelativeFrame(.horizontal)
                                .clipped()
                                .frame(minWidth: UIScreen.main.bounds.size.width,minHeight:200)
                                    .id(skin.id)
                            }

                        }
                    }
                    .scrollTargetLayout()
                }
                
                .frame(maxWidth: .infinity,maxHeight:.infinity)
                .background(.black)
                .scrollPosition(id: $store.detailScrollPosition.sending(\.actionScrollPositionSkin))
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .overlay(alignment:.topTrailing){
                    Button("",systemImage: "xmark.circle.fill"){
                        store.send(.actionSelectedSkin(nil))
                    }.font(.title)
                        .foregroundStyle(.white.opacity(0.8),.white.opacity(0.15))
                        .padding(.top,40)
                        .padding()
                    
                }
                .onAppear{
                    guard store.detailScrollPosition == nil else {return}
                    store.send(.actionScrollPositionSkin(store.selectedSkin))
                }

    }
}

