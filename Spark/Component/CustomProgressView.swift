//
//  ProgressView.swift
//  Spark
//
//  Created by 김봉섭 on 2024/08/19.
//

import SwiftUI

struct CustomProgressViewStyle: ProgressViewStyle {
    var trackColor: Color = .sec // 배경 색
    var progressColor: Color = .pri // 진행 색
    var thickness: CGFloat = 8 // 두께

    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: thickness / 2)
                .fill(trackColor)
                .frame(height: thickness)

            RoundedRectangle(cornerRadius: thickness / 2)
                .fill(progressColor)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * UIScreen.main.bounds.width * 0.9, height: thickness)
        }
    }
}

struct CustomProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        ProgressView(value: progress)
            .progressViewStyle(CustomProgressViewStyle())
    }
}

#Preview {
    CustomProgressView(progress: .constant(0.2))
}
