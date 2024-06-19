//
//  RestTimerView.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/19/24.
//

import SwiftUI

struct RestTimerView: View {
    @Environment(\.dismiss) private var dismiss

    @StateObject var timerModel = TimerModel()
    @State var tagRestTimerView: Int? = nil


    var body: some View {
        ZStack(alignment: .center){
            
            if timerModel.isfinishedSecond > 0 {
                Circle()
                    .stroke(.main, lineWidth: 6)
                    .opacity(0.3)
                    .frame(width: 320, height: 320)
                    .overlay{
                        Text("\(timerModel.restTimeRemaining)")
                            .font(.system(size:64, weight: .thin))
                    }
                
                Button{
                    timerModel.stopTimer()
                    dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.gray5)
                        .frame(width: 159, height: 50)
                        .overlay{
                            Text("중단하기")
                                .foregroundColor(.white)
                                .font(.callout)
                                .bold()
                        }
                }
                .padding(.top, 640)

            } else{
                
                Circle()
                    .stroke(.main, lineWidth: 6)
                    .opacity(0.3)
                    .frame(width: 320, height: 320)
                    .overlay{
                        Text("00:00")
                            .font(.system(size:64, weight: .thin))
                    }
                
                
                NavigationLink(destination: FullScreenViewcycle()) {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.main)
                        .frame(width: 159, height: 50)
                        .overlay{
                            Text("완료!")
                                .foregroundColor(.white)
                                .font(.callout)
                                .bold()
                        }
                }
                .padding(.top, 640)
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear{
            /// view가 나타남과 동시에 TimerModel의 프로퍼티 값을 업데이트 시켜준다
            timerModel.updateRestTimeRemaining()
        }
        .onReceive(timerModel.timer, perform: { value in
            timerModel.updateRestTimeRemaining()
            
            if timerModel.isfinishedSecond == 0 {
                timerModel.stopTimer()
            }
        })

    }
}

#Preview {
    RestTimerView()
}
