//
//  RankingItemView.swift
//  SampleApp0001
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct RankingItemView: View {
    
    var rankingNumber: String
    var date: String
    var name: String
    var resultNumber: String
    
    init(rankingNumber: String, date: String, name: String, resultNumber: String) {
        self.rankingNumber = rankingNumber
        self.date = date
        self.name = name
        self.resultNumber = resultNumber
    }
    
    var body: some View {
        HStack {
            Text(rankingNumber)
                .font(.system(size: 20, weight: .black, design: .default))
                .frame(alignment: .leading)
                .padding()
            
            Spacer()
            Text(date.prefix(19))
                .foregroundColor(.gray)
                .font(.system(size: 12, weight: .regular, design: .default))
                .frame(alignment: .leading)
                .padding()

            Spacer()
            Text(name)
                .font(.system(size: 16, weight: .regular, design: .default))
                .frame(alignment: .leading)
                .padding()

            Spacer()
            Text(resultNumber)
                .font(.system(size: 16, weight: .regular, design: .default))
                .frame(alignment: .leading)
                .padding()
        }
    }
}

struct RankingItemView_Previews: PreviewProvider {
    static var previews: some View {
        RankingItemView(rankingNumber: "1位", date: "2022-09-06 02:20:29", name: "cndor", resultNumber: "38.0回")
    }
}
