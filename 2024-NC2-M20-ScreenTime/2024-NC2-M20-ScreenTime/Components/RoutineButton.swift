//
//  RoutineButton.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by Lee YunJi on 6/18/24.
//

import Foundation
import SwiftUI



struct RoutineButton25: View {
    @State var image: String
    @State var text: String
    
    
    var body: some View {
        
        Button {
            
           //
            
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 347.0, height: 56)
                    .background(.white)
                    .cornerRadius(9.0)
                    .shadow(color: Color(white: 0.0, opacity: 0.1), radius: 4.0, x:1.0, y:1.0)
                
                HStack {
                    HStack {
                        Image(image)
                            .resizable()
                            .frame(maxWidth: 40, maxHeight: 40)
                        Spacer()
                            .frame(maxWidth: 32)
                        Text(text)
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
    }
}

struct RoutineButton50: View {
    @State var image: String
    @State var text: String
    
    var body: some View {
        Button {
            
            // 네비게이션 연결해주세용(여기는 사실 없어도 됨)
            
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 347.0, height: 56)
                    .background(.white)
                    .cornerRadius(9.0)
                    .shadow(color: Color(white: 0.0, opacity: 0.1), radius: 4.0, x:1.0, y:1.0)
                
                HStack {
                    HStack {
                        Image(image)
                            .resizable()
                            .frame(maxWidth: 40, maxHeight: 40)
                        Spacer()
                            .frame(maxWidth: 32)
                        Text(text)
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
    }
}
