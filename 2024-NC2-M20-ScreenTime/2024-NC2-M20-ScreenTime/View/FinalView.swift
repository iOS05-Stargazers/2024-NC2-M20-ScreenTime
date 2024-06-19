//
//  FinalView.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by Lee YunJi on 6/19/24.
//

import Foundation
import Swift
import SwiftUI

// 25분-5분 루틴을 완료하고 난 후, 토마토 스티커가 붙은 메인뷰
// 단순히 뷰를 이어붙이게 되면 필요할 것 같아서 만들어뒀어요-!

struct FinalView: View {
    @State private var selectedTab = 0
    init() {
        UITabBar.appearance().backgroundColor = .main
        UITabBar.appearance().unselectedItemTintColor = .sub
    }
    
    var body: some View {
        TabView{
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
                                        Image("tomato3")
                                            .resizable()
                                            .frame(maxWidth: 56, maxHeight: 56)
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
                        RoutineButton25(image: "tomato1", text:"25분-5분 루틴")
                        RoutineButton50(image: "tomato2", text:"50분-10분 루틴")
                        Spacer()
                    }
                }
            }
            .padding()
            .tabItem {
                Image(systemName: "rectangle.on.rectangle")
                Text("투데이")
            }
            Text("성취도")
                .tabItem {
                    Image(systemName: "flame")
                    Text("성취")
                }
            Text("내정보")
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("내정보")
                }
        }
        .navigationBarBackButtonHidden()
        .accentColor(.whitet)
    }
}

#Preview{
    FinalView()
}
