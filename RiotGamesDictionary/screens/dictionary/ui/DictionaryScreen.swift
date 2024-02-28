//
//  DictionaryScreen.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 10.01.2024.
//

import SwiftUI
import ComposableArchitecture
import LoLDictionaryNetwork
import UI

struct DictionaryScreen: View {
    @Bindable var  store:StoreOf<DictionaryStore>
    var body: some View {
        WithPerceptionTracking{
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                VStack{
                    GeometryReader{ proxy in
                        let safeAreaTop = proxy.safeAreaInsets.top
                        ScrollView(.vertical,showsIndicators: false) {
                            VStack{
                                
                                HeaderView(safeAreaTop)
                                    .offset(y:-store.offsetScroll)
                                    .zIndex(1)
                                switch store.selectTab {
                                case .champions:
                                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 3)) {
                                        ForEach(store.championsSearch,id: \.self) { champion in
                                            NavigationLink(state: DictionaryStore.Path.State.screenChampionDetail(ChampionDetailStore.State(id: champion.id))) {
                                                DictionaryCell(title: champion.name, url: champion.id.urlIconChampion(version:store.version))
                                            }.foregroundColor(.clear)
                                        }
                                    }
                                    .padding(.horizontal,10)
                                    .zIndex(0)
                                case .items:
                                    Text("items")
                                case .runes:
                                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 3)) {
                                        ForEach(store.runesSearch,id: \.self) { rune in
                                            NavigationLink(state: DictionaryStore.Path.State.screenRuneDetail(RuneDetailStore.State(rune: rune))) {
                                                DictionaryCell(title: rune.name ?? "", url: rune.icon?.urlIconRune() ?? "")
                                                    .foregroundColor(.clear)
                                            }
                                        }
                                    }.padding(.horizontal,10)
                                     .zIndex(0)
                                case .summoners:
                                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 3)) {
                                        ForEach(store.summonersSearch,id: \.self) { summoner in
                                            NavigationLink(state: DictionaryStore.Path.State.screenSummonerDetail(SummonerDetailStore.State(summoner:summoner))) {
                                                DictionaryCell(title: summoner.name, url: summoner.image.full.urlIcon(version:store.version,group:summoner.image.group))
                                                    .foregroundColor(.clear)
                                            }
                                        }
                                    }.padding(.horizontal,10)
                                     .zIndex(0)
                                }

                            }
                            .offset(coordinateSpace: .named("SCROLL")) { offset in
                                self.store.send(.setOffsetScroll(offset))
                                self.store.send(.setShowSearchView((-offset > 80) && store.showSearchView))
                            }
                        }
                        .coordinateSpace(name:"SCROLL")
                        .edgesIgnoringSafeArea(.top)
                    }
                    
                }.onAppear {
                    store.send(.onAppear)
                }
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
                }
            }
        destination: { store in
                switch store.state{
                case .screenChampionDetail:
                    if let store = store.scope(state: \.screenChampionDetail, action: \.screenChampionDetail){
                        ChampionDetailScreen(store: store)
                    }
                case .screenRuneDetail:
                    if let store = store.scope(state: \.screenRuneDetail, action: \.screenRuneDetail){
                        RuneDetailScreen(store: store)
                    }
                case .screenSummonerDetail:
                    if let store = store.scope(state: \.screenSummonerDetail, action: \.screenSummonerDetail){
                        SummonerDetailScreen(store: store)
                    }
                case .screenSettings:
                    if let store = store.scope(state: \.screenSettings, action: \.screenSettings){
                        SettingsScreen(store: store)
                    }
                case .screenGamesHome:
                    if let store = store.scope(state: \.screenGamesHome, action: \.screenGamesHome){
                        GamesHomeScreen(store: store)
                    }
                }
            
            }
        }
    }
    
    
    @ViewBuilder
    func HeaderView(_ safeAreaaTop:CGFloat) -> some View {
        let progress = -(store.offsetScroll / 80) > 1 ? -1 : (store.offsetScroll > 0 ? 0 : (store.offsetScroll / 80))
        VStack(spacing: 15){
            HStack(spacing: 15){
                HStack(spacing: 8){
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                    TextField(store.selectTab.instance.hint,text: $store.searchText.sending(\.searchTextChange))
                        .tint(.white)
                }
                .padding(.vertical,10)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 10 , style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(.black)
                        .opacity(0.15)
                }
                .opacity(store.showSearchView ? 1 : 1 + progress)
                
                Menu {
                    NavigationLink(state: DictionaryStore.Path.State.screenGamesHome(GamesHomeStore.State())) {
                        Text("My games")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.foregroundColor(.clear)
                    
                    
                    
                    NavigationLink(state: DictionaryStore.Path.State.screenSettings(SettingsStore.State())) {
                        Text("Settings")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.foregroundColor(.clear)
                    
                } label: {
                    Image(systemName: "text.justify")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 35,height: 35)
                }

                
//                Button{
//                    
//                }label: {
//                    Image(systemName: "text.justify")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.white)
//                        .frame(width: 35,height: 35)
//                }
                
                .opacity(store.showSearchView ? 0 : 1)
                .overlay{
                    if store.showSearchView {
                        Button{
                            store.send(.setShowSearchView(false))
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                
                        }
                    }
                }
            }
            
            HStack(spacing:0){
                
                
                ForEach(store.tabs,id:\.self){ tab in
                    CustomButton(tab:tab)
                }
            }
            .padding(.horizontal, -progress * 50)
                .padding(.top,10)
                .offset(y: progress * 63)
                .opacity(store.showSearchView ? 0 : 1)
        }
        .overlay(alignment: .topLeading, content: {
            Button{
                store.send(.setShowSearchView(true))
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .offset(x:13,y: 10)
            .opacity(store.showSearchView ? 0 : -progress)
        })
        .animation(.easeInOut(duration: 0.2),value: store.showSearchView)
        .environment(\.colorScheme,.dark)
        .padding([.horizontal,.bottom],15)
        .padding(.top,safeAreaaTop + 10)
        .background{
            Rectangle()
                .fill(ColorResources.color1.gradient)
                .padding(.bottom, -progress * 85)
        }
    }
    
    @ViewBuilder
    func CustomButton(tab:DictionaryTabs) -> some View {
        
        let progress = -(store.offsetScroll / 40) > 1 ? -1 : (store.offsetScroll > 0 ? 0 : (store.offsetScroll / 40))
        
        Button(action: {
            store.send(.tabSelected(tab))
        }, label: {
            VStack{
                Image(systemName: tab.instance.systemIconName)
                    .fontWeight(.semibold)
                    .foregroundColor(ColorResources.color1)
                    .frame(width: 35,height: 35)
                    .background{
                        RoundedRectangle(cornerRadius:8, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .fill(.white.opacity(tab == store.selectTab ? 1 : 0.6))
                    }
                Text(tab.instance.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(.white.opacity(tab == store.selectTab ? 1 : 0.6))
            }
            .frame(maxWidth: .infinity)
            .opacity(1 + progress)
            .overlay{
                Image(systemName: tab.instance.systemIconName)
                    .font(.title3)
                    .foregroundColor(.white.opacity(tab == store.selectTab ? 1 : 0.6))
                    .fontWeight(.semibold)
                    .opacity(-progress)
                    .offset(y:-10)
                
            }
        })
        
    }
    
    @ViewBuilder
    func DictionaryCell(title:String,url:String) -> some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            ZStack{
                Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: .infinity)
                
//                AsyncImage(url: URL(string: url),content: { image in
//                    image
//                        .resizable()
//                        .aspectRatio(1, contentMode: .fit)
//                        .frame(maxWidth: .infinity)
//                        
//                },
//                placeholder:{
//                    ProgressView()
//                })
                if let source =  URL(string: url) {
                    TestCacheImageView(source: source)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .background(Color.clear)
                    .cornerRadius(5)
                    .clipped()
                }

            }
            Text(title)
                .multilineTextAlignment(.center)
                .lineLimit(2, reservesSpace: true)
                .foregroundColor(Color.white)
            
        }
    }
    
    
    
    
}

struct OffsetKey:PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
extension View{
    @ViewBuilder
    func offset(coordinateSpace:CoordinateSpace,complition:@escaping(CGFloat)->()) -> some View{
        self.overlay{
            GeometryReader{ proxy in
                let minY = proxy.frame(in: coordinateSpace).minY
                Color.clear
                    .preference(key: OffsetKey.self, value: minY)
                    .onPreferenceChange(OffsetKey.self){ value in
                        complition(value)
                    }
                
            }
        }
    }
}
