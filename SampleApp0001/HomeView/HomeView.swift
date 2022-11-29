//
//  HomeView.swift
//  SampleApp0001
//
//  Created by cmStudent on 2022/08/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("ひっくり返せ")
                .font(.system(size: 40, weight: .black, design: .default))
            
            Spacer()
            
            Group {
                Text("ランキング")
                    .font(.title)
                    .fontWeight(.black)
                ScrollView {
                    VStack {
                        ForEach(0 ..< viewModel.rankings.count, id: \.self) { num in
                            if num < 5 {
                                RankingItemView(rankingNumber: String(viewModel.rankingNumber[num]) + "位",
                                                date: viewModel.stringFromDate(date: viewModel.rankings[num].date, format: "yyyy-MM-dd HH:mm:ss +0000") ,
                                                name: viewModel.rankings[num].name,
                                                resultNumber: String(viewModel.rankings[num].result) + "回")
                            } else {
                                if viewModel.isRanking {
                                    RankingItemView(rankingNumber: String(viewModel.rankingNumber[num]) + "位",
                                                    date: viewModel.stringFromDate(date: viewModel.rankings[num].date, format: "yyyy-MM-dd HH:mm:ss +0000") ,
                                                    name: viewModel.rankings[num].name,
                                                    resultNumber: String(viewModel.rankings[num].result) + "回")
                                }
                            }
                        }
                        .onAppear {
                            viewModel.lode()
                        }
                        if viewModel.rankings.count > 5 {
                            if viewModel.isRanking {
                                Button {
                                    withAnimation {
                                        viewModel.isRanking = false
                                    }
                                } label: {
                                    Text("閉じる")
                                }
                            } else {
                                Button {
                                    withAnimation {
                                        viewModel.isRanking = true
                                    }
                                } label: {
                                    Text("もっと見る")
                                }
                                
                            }
                        }
                        
                    }
                    
                }
                .frame(width: CGFloat(UIScreen.main.bounds.width - 40.0), height: CGFloat(UIScreen.main.bounds.height - 520.0))
            }
            
            Spacer()
            Button(action: {
                withAnimation {
                    viewModel.isSetting = true
                }
            }) {
                Text("次へ")
                    .font(.system(size: 12, weight: .black, design: .default))
                    .frame(width: 160, height: 48)
                    .foregroundColor(Color(.white))
                    .background(Color.black)
                    .cornerRadius(24)
            }
            
            .padding()
            .fullScreenCover(isPresented: $viewModel.isSetting, onDismiss: {
                viewModel.name = ""
                viewModel.kindValue = .one
                viewModel.lode()
            }) {
                SettingView(viewModel: viewModel)
            }
            Spacer()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
