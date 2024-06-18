//
//  FullScreenViewcycle.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by Lee YunJi on 6/19/24.
//

import Foundation
import SwiftUI

struct FullScreenViewcycle: View{
    var body: some View {
        VStack(alignment: .center){
            Spacer()
                .frame(maxHeight: 240)
            Image("checksymbol")
                .resizable()
                .frame(maxWidth: 118, maxHeight: 118)
            Spacer()
                .frame(maxHeight: 32)
            Text("토마토 하나 수확 완료!")
                .font(.title)
                .bold()
                .foregroundColor(.blackt)
            Spacer()
                .frame(maxHeight: 16)
            Text("한 사이클을 완료했어요.\n 이대로 계속 화이팅!")
                .font(.callout)
                .foregroundColor(.blackt)
                .multilineTextAlignment(.center)
            Spacer()
            NextButtoncycle(text: "계속")
            Spacer()
                .frame(maxHeight: 32)
        }
    }
}

#Preview{
    FullScreenViewcycle()
}
