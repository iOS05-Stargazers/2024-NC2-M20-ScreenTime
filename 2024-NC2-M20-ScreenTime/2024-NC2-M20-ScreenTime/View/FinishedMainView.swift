//
//  MainView.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/19/24.
//

import SwiftUI

struct FinishedMainView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.main)
                .frame(width: 393.0, height: 260.0)
                .padding(.bottom, 600)
            
            VStack{
                Spacer()
                    .frame(maxHeight: 56)
                HStack{
                    Text("TOMATO\nTIME!")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button{
                        //설정...이지만 가짜 버튼^^
                    } label:{
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                    }
                }.padding(.all)
                    .foregroundColor(.whitet)
                VStack{
                    ZStack{
                        Image("tomatotree")
                            .resizable()
                            .frame(minWidth: 347,minHeight: 392)
                            .shadow(radius: 5)
                        VStack(alignment: .leading){
                            Spacer()
                            HStack{
                                
                                Text("오늘의 토마토")
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(.blackt)
                            }.padding(.trailing)
                            Spacer()
                                .frame(maxHeight: 256)
                            HStack{
                                ZStack{
                                    Image("ticket")
                                        .resizable()
                                        .frame(maxWidth: 71, maxHeight:80)
                                }
                                Image("ticket")
                                    .resizable()
                                    .frame(maxWidth: 71, maxHeight:80)
                                Image("ticket")
                                    .resizable()
                                    .frame(maxWidth: 71, maxHeight:80)
                                Image("ticket")
                                    .resizable()
                                    .frame(maxWidth: 71, maxHeight:80)
                            }
                            Spacer()
                                .frame(maxHeight: 10)
                        }
                    }
                }.padding()
                VStack{
                    HStack{
                        Text("테오를 위한 추천 패턴")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }.padding(.leading)
               
                    RoutineButton50(image: "tomato2", text:"50분-10분 루틴")
                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .padding()
    }
}


#Preview{
    FinishedMainView()
}
