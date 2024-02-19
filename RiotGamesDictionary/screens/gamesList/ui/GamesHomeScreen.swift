//
//  GamesHomeScreen.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 13.02.2024.
//

import SwiftUI
import ComposableArchitecture
import AccountRiotApiNetwork
import UI
struct GamesHomeScreen: View {
    let store:StoreOf<GamesHomeStore>
    
    var body: some View {
        WithPerceptionTracking{
            VStack{
                
                if store.isShowTextInfoError{
                    Text("\(store.textInfoError)")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }else{
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVStack{
                            ForEach(store.listGames,id: \.self) { match in
                                GamesHomeCell(match: match)
                                    .onAppear{
                                        if store.listGames.isLimitElements(match),store.isPagination {
                                            store.send(.paginationListGames)
                                        }
                                    }
                            }
                        }.padding(10)
                        
                    }
                }
                    

            }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .onAppear {
                store.send(.onAppear)
            }
            .background {
                Rectangle()
                    .fill(ColorResources.color2.gradient)
                    .ignoresSafeArea(.all)
            }
            .overlay{
                if store.isLoading {
                    HStack{
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .background(Color.black.opacity(0.2))
                }
            }
            .navigationTitle("Matches \"\(store.name)\" #EUW")
        }
    }
    
    
    @ViewBuilder
    func GamesHomeCell(match:ModelMatchInfoFinal) -> some View{
        ZStack{
            CardView(color:ColorResources.color2).frame(maxWidth:.infinity)
            VStack(spacing:10){
                
                HStack{
                    ZStack(alignment: .bottomTrailing){
                        if let sourse = URL(string: match.summoderData?.championName?.urlIconChampion(version: store.version) ?? ""){
                            TestCacheImageView(source: sourse)
                                .frame(width: 70,height: 70)
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(35)
                                .clipped()
                        }
                        
                        Text("\(Int(match.summoderData?.champLevel ?? 0))")
                            .font(.system(size: 10))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background{
                                Circle()
                                    .fill(.black)
                                    .frame(width: 20, height: 20)
                            }
                            .offset(x:-11,y:-11)
                    }
                    
                    Text("\(Int(match.summoderData?.kills ?? 0)) / \(Int(match.summoderData?.deaths ?? 0)) / \(Int(match.summoderData?.assists ?? 0))")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack(alignment:.leading){
                        Text(match.summoderData?.win == true ? "Victory":"Defeat")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Time: \(Int(match.modelMatchInfo.info.gameDuration / 60)) min")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                
                
                
                ZStack{
                    CardView(color:ColorResources.color3).frame(maxWidth:.infinity)
                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 5), count: 2),spacing:5) {
                        ForEach(match.modelMatchInfo.info.participants,id:\.self){ item in
                            GamesHomeCellSummonerIter(participant: item)
                        }
                    }.frame(maxWidth: .infinity)
                        .padding(10)
                }
            }.padding(10)
        }
        

    }
    @ViewBuilder
    func GamesHomeCellSummonerIter(participant:ModelMatchInfoInfoParticipantsInner) -> some View{
        HStack(spacing: 10){
            if let sourse = URL(string: participant.championName?.urlIconChampion(version: store.version) ?? ""){
                TestCacheImageView(source: sourse)
                    .frame(width: 25,height: 25)
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(5)
                    .clipped()
            }
            
            Text("\(participant.summonerName ?? "") (\(participant.championName ?? "-"))")
                .font(.system(size: 11))
                .foregroundColor(.white)
            
            Spacer()
        }
             .frame(maxWidth: .infinity,maxHeight: 25)

         
    }
}




