//
//  ChampionDetailScreen.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 02.02.2024.
//

import SwiftUI
import ComposableArchitecture
import UI
import LoLDictionaryNetwork

struct ChampionDetailScreen: View {
    @Perception.Bindable var store: StoreOf<ChampionDetailStore>
    
    var body: some View {
        WithPerceptionTracking{
            ScrollView{
                VStack(alignment: .leading, spacing:15){
                    
                    if #available(iOS 17.0, *){
                        GeometryReader{ proxy in
                            let size = proxy.size
                            ScrollView(.horizontal){
                                HStack(spacing:10){
                                    ForEach(store.championSkins){ skin in
                                        
                                        if let source =  URL(string: skin.url) {
                                            TestCacheImageView(source: source)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: size.width)
                                                .clipShape(.rect(cornerRadius:5))
                                                .onTapGesture {
                                                
                                                    store.send(.actionSelectedSkin(skin.id))
                                                }
                                                .contentShape(.rect)
                                                .frame(minWidth: 200,minHeight:200)
                                        }
//                                        AsyncImage(url: URL(string: skin.url),content: { image in
//                                            image
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                                .frame(maxWidth: size.width)
//                                                .clipShape(.rect(cornerRadius:5))
//                                                .onTapGesture {
//                                                
//                                                    store.send(.actionSelectedSkin(skin.id))
//                                                }
//                                                .contentShape(.rect)
//                                        },
//                                                   placeholder:{
//                                            ProgressView()
//                                        })
//                                        
//                                        .frame(minWidth: 200,minHeight:200)
                                     
                                    }

                                }.scrollTargetLayout()
                            }
                            .scrollPosition(id:$store.scrollPositionRootView.sending(\.actionScrollPositionRootView))
                            .scrollIndicators(.hidden)
                            .scrollTargetBehavior(.viewAligned)
                            .scrollClipDisabled()
                        }.frame(height:200)
                    } else {
//                        AsyncImage(url: URL(string: store.championDetailObj?.id.urlsplashChampion() ?? ""),content: { image in
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(maxWidth: .infinity)
//                                .cornerRadius(5)
//                        },
//                                   placeholder:{
//                            ProgressView()
//                        })
//                        .frame(maxWidth: .infinity, minHeight: 200)
//                        .background(Color.clear)
                        
                        if let source =  URL(string: store.championDetailObj?.id.urlsplashChampion() ?? "") {
                            TestCacheImageView(source: source)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.rect(cornerRadius:5))
                                .contentShape(.rect)
                                .frame(minWidth: .infinity,minHeight:200)
                        }
                        
                    }
                    
                    Text(store.championDetailObj?.title ?? "")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    HStack( spacing: 8) {
                        ForEach(store.championDetailObj?.tags ?? [],id:\.self){title in
                            Button {
                                
                            } label: {
                                Text(title)
                                
                                    .font(.system(size: 13))
                                    .foregroundColor(.white)
                            }
                            
                        }
                        Spacer()
                    }
                    
                    if !store.titleStats .isEmpty {
                        ZStack{
                            CardView(color:ColorResources.color1).frame(maxWidth:.infinity)
                            
                            VStack(alignment: .leading, spacing:8){
                                Text(store.titleStats)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 2),spacing:10) {
                                    ForEach(store.championStats,id:\.id){ item in
                                        HStack(alignment:.center, spacing: 0){
                                            Text("\(item.title)".uppercased() )
                                                .font(.system(size: 13))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            Text("\(String(format: ":  %.2f",item.value))")
                                                .font(.system(size: 13))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }.frame(maxWidth:.infinity)
                                    }
                                }
                            }
                            .padding(10)
                            
                        }
                    }
                    if store.championDetailObj != nil {
                        ZStack {
                        
                                CardView(color:ColorResources.color1).frame(maxWidth:.infinity)
                            VStack(alignment:.leading,spacing: 10){
                                    
                                    Text(store.titleSpells)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    
                                    PassiveView(passive: store.championDetailObj?.passive)
                                    
                                    ForEach(store.championDetailObj?.spells ?? [], id:\.self){ spell in
                                        SpellViewCell(spell:spell)
                                    }
                            }.frame(maxWidth: .infinity)
                                .padding(10)
                            }
                    }
        
                    

                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(10)
            }
        
            .onAppear{
                store.send(.onAppear)
            }
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            .background {
                Rectangle()
                    .fill(ColorResources.color2.gradient)
                    .ignoresSafeArea(.all)
            }
            .overlay{
                if store.isLoading{
                    HStack{
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .background(Color.black.opacity(0.2))
                }
                if store.showDetailSkinsView {
                    ChampionSkinsDetailView(store: store)
                        .ignoresSafeArea(.all)
                        .transition(.offset(y:5))
                }
            }
            .navigationTitle(store.championDetailObj?.name ?? "")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(store.showDetailSkinsView)
        }
    }
    
    @ViewBuilder
    func PassiveView(passive:PassiveObj?) -> some View {
        ZStack{
            CardView(color:ColorResources.color3).frame(maxWidth:.infinity)
            VStack{
                    Text(passive?.name ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment: .leading)
                
                HStack(spacing: 10){
//                    AsyncImage(url: URL(string: passive?.image.full.urlIcon(version: store.version, group: passive?.image.group ?? "") ?? ""),content: { image in
//                        image
//                            .resizable()
//                            .aspectRatio(1,contentMode: .fit)
//                            .cornerRadius(5)
//                            .frame(width: 70,height: 70)
//                    },
//                               placeholder:{
//                        ProgressView()
//                    })
                    
                    if let source =  URL(string: passive?.image.full.urlIcon(version: store.version, group: passive?.image.group ?? "") ?? "") {
                        TestCacheImageView(source: source)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 70,height: 70)
                        .background(Color.clear)
                        .cornerRadius(5)
                        .clipped()
                    }

                    
                    Text(passive?.description ?? "")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity)
                        
                }
            }.padding(10)
        }
    }
    @ViewBuilder
    func SpellViewCell(spell:ChampionDetailObjSpellsInner) -> some View {
        ZStack{
            CardView(color:ColorResources.color3).frame(maxWidth:.infinity)
            VStack{
                Text(spell.name ?? "")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,alignment: .leading)
                HStack(spacing: 10){
                    
//                    AsyncImage(url: URL(string: spell.image?.full.urlIcon(version: store.version, group: spell.image?.group ?? "") ?? ""),content: { image in
//                        image
//                            .resizable()
//                            .aspectRatio(1,contentMode: .fit)
//                            .frame(maxWidth: .infinity)
//                            .cornerRadius(5)
//                            .frame(width: 70,height: 70)
//                    },
//                               placeholder:{
//                        ProgressView()
//                    })
//                    .frame(width: 70,height: 70)
//                    .background(Color.clear)
                    if let source =  URL(string: spell.image?.full.urlIcon(version: store.version, group: spell.image?.group ?? "") ?? "") { 
                        TestCacheImageView(source: source)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 70,height: 70)
                        .background(Color.clear)
                        .cornerRadius(5)
                        .clipped()
                    }
                    Text(spell.description ?? "")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity)
                }
                
                
                
                VStack(spacing:4){
                    Text("cooldownBurn: \(spell.cooldownBurn ?? "")".uppercased())
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment: .leading)
                    Text("costBurn: \(spell.costBurn ?? "")".uppercased())
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment: .leading)
                    Text("rangeBurn: \(spell.rangeBurn ?? "")".uppercased())
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment: .leading)
                }
                
            }
            .padding(10)
        }
    }
}

