//
//  FullScreenViewcycle.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by Lee YunJi on 6/19/24.
//

import Foundation
import SwiftUI

struct FullScreenViewcycle: View{
    @EnvironmentObject var cycleCountModel: CycleCountModel
    @State var tagFullScreenView: Int? = nil

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
            
//            Button{
//                cycleCountModel.isFinishedCycle += 1
//                cycleCountModel.stack = .init()
//            } label: {
//                Text("계속")
//                    .frame(width: 159, height: 50)
//                    .tint(.white)
//                    .background(.main)
//                    .cornerRadius(30.0)
//            }
            Button{
                cycleCountModel.isFinishedCycle += 1
                self.tagFullScreenView = 1
            } label: {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.main)
                    .frame(width: 159, height: 50)
                    .overlay{
                        Text("계속")
                            .frame(width: 159, height: 50)
                            .tint(.white)
                            .background(.main)
                            .cornerRadius(30.0)
                    }
            }
            
            // TODO: deprecated but check
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(), tag: 1, selection: self.$tagFullScreenView) {
                Text("")
            }
            
            
//            NavigationLink(destination: ContentView().navigationBarBackButtonHidden()) {
//                Text("계속")
//                    .frame(width: 159, height: 50)
//                    .tint(.white)
//                    .background(.main)
//                    .cornerRadius(30.0)
//            }
//            .frame(width: 303.0, height: 71.0)
//            .onTapGesture {
//                cycleCountModel.isFinishedCycle += 1
//                print("\(cycleCountModel.isFinishedCycle) FullScreenViewCycle")
//            }
        }
        .navigationBarBackButtonHidden()
        Spacer()
            .frame(maxHeight: 32)
    }
}

//#Preview{
//    FullScreenViewcycle()
//}
