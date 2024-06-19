//
//  FullScreenView.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by Lee YunJi on 6/18/24.
//

import Foundation
import SwiftUI

struct FullScreenView25: View{
    var body: some View {
        VStack(alignment: .center){
            Spacer()
                .frame(maxHeight: 240)
            Image("25symbol")
                .resizable()
                .frame(maxWidth: 118, maxHeight: 118)
            Spacer()
                .frame(maxHeight: 32)
            Text("25분의 워크 끝!")
                .font(.title)
                .bold()
                .foregroundColor(.blackt)
            Spacer()
                .frame(maxHeight: 16)
            Text("25분동안 집중하느라 수고했어요!\n이제 5분의 쉬는시간이 시작됩니다.")
                .font(.callout)
                .foregroundColor(.blackt)
                .multilineTextAlignment(.center)
            Spacer()
            
//            Button{
//                self.tagRestTimerView = 1
//            } label: {
//                RoundedRectangle(cornerRadius: 30)
//                    .fill(.main)
//                    .frame(width: 159, height: 50)
//                    .overlay{
//                        Text("완료!")
//                            .foregroundColor(.white)
//                            .font(.callout)
//                            .bold()
//                    }
//            }
//            .padding(.top, 640)
//            
//            // TODO: deprecated but check
//            NavigationLink(destination: FullScreenViewcycle(), tag: 1, selection: self.$tagRestTimerView) {
//                Text("")
//            }
            
            NavigationLink(destination: RestTimerView()) {
                Text("계속")
                    .frame(width: 159, height: 50)
                    .tint(.whitet)
                    .background(.main)
                    .cornerRadius(30.0)
                    .frame(width: 303.0, height: 71.0)
            }
            
            Spacer()
                .frame(maxHeight: 32)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview{
    FullScreenView25()
}
