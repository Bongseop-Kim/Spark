//
//  CheckListView.swift
//  Spark
//
//  Created by 김봉섭 on 2024/08/19.
//

import SwiftUI

struct CheckListView: View {
    var items: [CheckItem] // CheckItem 배열을 인자로 받음

    var body: some View {
        HStack() {
            ForEach(0..<items.count, id: \.self) { index in
                VStack {
                    Image(systemName: items[index].isOn ? "checkmark.circle.fill" : "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(items[index].isOn ? .white : .ter)
                    
                    Text(items[index].text)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    CheckListView(items: [
        CheckItem(isOn: true, text: "Mon"),
        CheckItem(isOn: false, text: "Tue"),
        CheckItem(isOn: true, text: "Wed")
    ])
    .padding()
    .background(.black)
}
