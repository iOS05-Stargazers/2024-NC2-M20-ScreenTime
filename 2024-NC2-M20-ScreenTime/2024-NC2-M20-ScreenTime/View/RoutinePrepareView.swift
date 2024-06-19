//
//  RoutinePrepareView.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/18/24.
//

import SwiftUI
import FamilyControls


struct RoutinePrepareView: View {
    @EnvironmentObject var managedSettingModel: ManagedSettingModel
    @State var isPresented = false
    @State var tagRoutinePrepareView: Int? = nil
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.main)
                .frame(maxWidth: .infinity, maxHeight: 273)
                .padding(.bottom)
                .overlay{
                    Image("tomato2")
                        .resizable()
                        .frame(width: 256, height: 256)
                    
                    Text("25분-5분 루틴")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 180)
                    
                }
            
            VStack(alignment:.center) {
                AllowingApp()
                SelectApp()
            }
            .padding(.bottom, 20)
            
            AllowingTime()
            
            Spacer()
            
            Button{
                ManagedSettingModel.shared.setShieldRestrictions()
                self.tagRoutinePrepareView = 1
            } label: {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.main)
                    .frame(width: 159, height: 50)
                    .overlay{
                        Text("시작하기")
                            .foregroundColor(.white)
                            .font(.callout)
                            .bold()
                    }
            }

            // TODO: deprecated but check
            NavigationLink(destination: FocusTimerView(), tag: 1, selection: self.$tagRoutinePrepareView) {
                Text("")
            }

// CHECK: 동작X
//            .gesture(TapGesture().onEnded{
//                ManagedSettingModel.shared.setShieldRestrictions()
//            })
            .padding(.bottom, 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .familyActivityPicker(isPresented: $isPresented, selection: $managedSettingModel.selectionToDiscourage)

    }
}

#Preview {
    RoutinePrepareView()
}




extension RoutinePrepareView {
    @ViewBuilder
    private func AllowingApp() -> some View {
        HStack{
            VStack(alignment:.leading){
                Text("제한 앱 설정")
                    .font(.callout)
                    .bold()
                Text("사용할 수 있는 앱을 선택하여 방해를 줄일 수 있어요")
                    .font(.caption)
            }
            .padding(.leading, 26)
            Spacer()
        }
        
    }
    
    
    @ViewBuilder
    private func SelectApp() -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(width: 334, height: 102)
                .shadow(radius: 10)
                .opacity(0.3)
            
            HStack(spacing: 0){
                Button{
                    isPresented = true
                } label: {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 167, height: 102)
                        .cornerRadius(12, corners: [.topLeft, .bottomLeft])
                        .overlay{
                            VStack{
                                HStack{
                                    Text("일시 허용")
                                        .foregroundColor(.main)
                                        .font(.caption)
                                        .padding(.leading)
                                        .padding(.top)
                                    Spacer()
                                }
                                Spacer()
                                
                                if managedSettingModel.isSelectionEmpty() {
                                    Image("emptygroup")
                                        .frame(height: 32)
                                        .padding(.bottom, 22)
                                    
                                } else {
                                    HStack{
                                        ForEach(Array(managedSettingModel.selectionToDiscourage.applicationTokens), id: \.self) { token in
                                            Label(token)
                                                .labelStyle(IconOnlyLabelStyle())
                                                .frame(width: 32, height: 32)
                                                .cornerRadius(8)
                                                .padding(-10)
                                        }
                                        ForEach(Array(managedSettingModel.selectionToDiscourage.categoryTokens), id: \.self) { token in
                                            Label(token)
                                                .labelStyle(IconOnlyLabelStyle())
                                                .frame(width: 32, height: 32)
                                                .cornerRadius(8)
                                                .padding(-10)
                                        }
                                    }
                                    .padding(.bottom, 26)
                                }
                            }
                        }
                }
                
                Divider()
                    .frame(height: 102) // Divider의 높이를 사각형과 동일하게 설정
                    .background(.gray)
                    .opacity(0.3)
                
                Button{
                    if let appSettings = URL(string: "App-prefs:SCREEN_TIME&path=ALWAYS_ALLOWED"), UIApplication.shared.canOpenURL(appSettings) {
                        UIApplication.shared.open(appSettings)
                    }
                } label: {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 167, height: 102)
                        .cornerRadius(12, corners: [.topRight, .bottomRight])
                        .overlay{
                            VStack{
                                HStack{
                                    Text("항상 허용")
                                        .foregroundColor(.main)
                                        .font(.caption)
                                        .padding(.leading)
                                        .padding(.top)
                                    
                                    Spacer()
                                }
                                Spacer()
                                Image("icongroup")
                                    .frame(height: 24)
                                    .padding(.bottom, 26)
                            }
                        }
                }
            }
        }
    }
    
    
    
    @ViewBuilder
    private func AllowingTime() -> some View {
        VStack(alignment:.center) {
            HStack{
                VStack(alignment:.leading){
                    Text("앱 시간 제한")
                        .font(.callout)
                        .bold()
                    Text("사용할 수 있는 앱을 선택하여 방해를 줄일 수 있어요")
                        .font(.caption)
                }
                .padding(.leading, 26)
                Spacer()
            }
            
            HStack(spacing: 0){
                Button{
                    //
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(width: 334, height: 39)
                        .shadow(radius: 10)
                        .opacity(0.3)
                        .overlay{
                            HStack{
                                Text("시간 제한 추가")
                                    .foregroundColor(.main)
                                    .font(.caption)
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                }

            }
        }
    }
    
    
    
    
}





