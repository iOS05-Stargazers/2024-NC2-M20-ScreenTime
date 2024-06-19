//
//  MainView.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/19/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var cycleCountModel: CycleCountModel

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
                                    
                                    if cycleCountModel.isFinishedCycle == 1 {
                                        Image("tomato3")
                                            .resizable()
                                            .frame(maxWidth: 56, maxHeight: 56)
                                    }
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
                    
                    
                    //RoutineButton25(image: "tomato1", text:"25분-5분 루틴")
                    // TODO: RoutineButton25를 ViewBuilder로 시도해보기
                    NavigationLink(destination: RoutinePrepareView()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 347.0, height: 56)
                                .background(.white)
                                .cornerRadius(9.0)
                                .shadow(color: Color(white: 0.0, opacity: 0.1), radius: 4.0, x:1.0, y:1.0)
                            
                            
                            HStack {
                                HStack {
                                    Image("tomato1")
                                        .resizable()
                                        .frame(maxWidth: 40, maxHeight: 40)
                                    Spacer()
                                        .frame(maxWidth: 32)
                                    Text("25분-5분 루틴")
                                        .font(.callout)
                                        .bold()
                                        .foregroundStyle(.gray1)
                                        .bold()
                                }
                                Spacer()
                                Image(systemName: "chevron.right.circle")
                                    .font(.system(size: 32.0, weight: .regular))
                                    .foregroundColor(.gray1)
                            }
                            .padding()
                        }
                        .frame(width: 303.0, height: 71.0)
                    }
                    
                    RoutineButton50(image: "tomato2", text:"50분-10분 루틴")
                    Spacer()
                }
            }
        }
        .padding()

    }
}


#Preview{
    MainView()
}
