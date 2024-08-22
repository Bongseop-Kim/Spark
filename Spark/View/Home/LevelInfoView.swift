//
//  LevelInfoView.swift
//  Spark
//
//  Created by 김봉섭 on 2024/08/19.
//

import SwiftUI

struct LevelInfoView: View {
    @Binding var progress: Double
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                ChipView(text: "Lv. 1", mode: "white")
                
                Text("Burned firewoods")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                CustomProgressView(progress: $progress)
            }
            
            Spacer()
                .frame(width: 30)
            
            VStack {
                ZStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height:30)
                        .foregroundColor(.pri)
                        
                    Image(systemName: "eraser.fill")
                        .foregroundColor(.white)
                }
                Text("Feed")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    LevelInfoView(progress: .constant(0.2))
        .padding()
        .background(.black)
}
