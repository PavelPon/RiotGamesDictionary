//
//  ChampionSkinsDetailView.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 08.02.2024.
//

import SwiftUI
import ComposableArchitecture
struct ChampionSkinsDetailView: View {
    @Perception.Bindable var store: StoreOf<ChampionDetailStore>
    var body: some View {
        WithPerceptionTracking{
            if #available(iOS 17.0, *) {
                
                ScrollView(.horizontal){
                    HStack(spacing:0){
                        ForEach(Array(store.championSkins.enumerated()),id: \.offset){ offset , skin in
//                            AsyncImage(url: URL(string: skin.url),content: { image in
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .containerRelativeFrame(.horizontal)
//                            },
//                                       placeholder:{
//                                ProgressView()
//                            })
                            
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
                
            }else {
//                AsyncImage(url: URL(string: store.championDetailObj?.id.urlsplashChampion() ?? ""),content: { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: .infinity)
//                },
//                           placeholder:{
//                    ProgressView()
//                })
                if let source =  URL(string: store.championDetailObj?.id.urlsplashChampion() ?? "") {
                    TestCacheImageView(source: source)
                        .background(.black)
                        .frame(maxWidth: .infinity,maxHeight:.infinity)
                        .overlay(alignment:.topTrailing){
                            Button("",systemImage: "xmark.circle.fill"){
                             //   let position =
                                store.send(.actionShowSkinView(false))
                            }.font(.title)
                                .foregroundStyle(.white.opacity(0.8),.white.opacity(0.15))
                                .padding(.top,40)
                                .padding()
                            
                        }
                }
            }
               
        }
    }
}

