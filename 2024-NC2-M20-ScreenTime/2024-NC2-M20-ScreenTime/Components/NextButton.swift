//
//  NextButton.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by Lee YunJi on 6/18/24.
//

import Foundation
import SwiftUI

//[타이머 밑에 있는 버튼] && [FullScreen의 25분 Work 완료뷰] && [토마토 수확(한 사이클 완료)뷰]에 있는 하단 캡슐모양 버튼
//NextButton000에서 000은 버튼이 들어가는 화면을 나타낸 거예요. ex) NextButton25 -> 25분 워크 완료뷰에 들어가는 버튼

//모두 일정 시간이 지나면 활성화가 되도록 해야해요(원래는...)

struct NextButtontimer: View {
    let text: String
    
    var body: some View {
        Button {
        
            //네비게이션 연결
            
        } label: {
            Text(text)
                .frame(width: 159, height: 50)
                .tint(.whitet)
                .background(.main)
                .cornerRadius(30.0)
        }
        .frame(width: 303.0, height: 71.0)
    }
}


struct NextButton25: View {
    let text: String
    
    var body: some View {
        Button {
        
            //네비게이션 연결
            
        } label: {
            Text(text)
                .frame(width: 159, height: 50)
                .tint(.whitet)
                .background(.main)
                .cornerRadius(30.0)
        }
        .frame(width: 303.0, height: 71.0)
    }
}

struct NextButtoncycle: View {
    let text: String
    
    var body: some View {
        Button {
        
            //네비게이션 연결
            
        } label: {
            Text(text)
                .frame(width: 159, height: 50)
                .tint(.whitet)
                .background(.main)
                .cornerRadius(30.0)
        }
        .frame(width: 303.0, height: 71.0)
    }
}
