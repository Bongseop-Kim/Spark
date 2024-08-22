//
//  ChipView.swift
//  Spark
//
//  Created by 김봉섭 on 2024/08/19.
//

import SwiftUI

struct ChipView: View {
    var text: String
    var mode: String = "primary"
    
    var body: some View {
        Text(text)
            .frame(width: 52, height:27)
            .background(mode == "primary" ? .pri : .sec)
            .cornerRadius(20)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(mode == "primary" ? .sec : .ter)
    }
}

#Preview {
    ChipView(text: "Lv.1")
}
