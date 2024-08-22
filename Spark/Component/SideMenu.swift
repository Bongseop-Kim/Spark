//
//  SideMenu.swift
//  Spark
//
//  Created by 김봉섭 on 2024/08/20.
//

import SwiftUI

enum SideMenuRowType: Int, CaseIterable {
    case name, alarm, holding, campfire, msg, events, instagram, etc

    var title: String {
        switch self {
        case .name: return "Name"
        case .alarm: return "Set Alarm"
        case .holding: return "Holding Spark"
        case .campfire: return "My Campfire"
        case .msg: return "Put Message"
        case .events: return "Events"
        case .instagram: return "Spark's Instagram"
        case .etc: return "ECT"
        }
    }
    
    var subtitle: String? {
        switch self {
        case .name:
            return nil
        case .alarm:
            return "Set toast alarm!"
        case .holding:
            return "Set toast alarm!"
        case .campfire:
            return nil
        case .msg:
            return nil
        case .events:
            return nil
        case .instagram:
            return nil
        case .etc:
            return nil
        }
    }
    
    var isToggle: Bool {
           switch self {
           case .alarm, .holding:
               return true
           case .name, .campfire, .msg, .events, .instagram, .etc:
               return false
           }
       }
}

struct RowView: View {
    var title: String
    var subtitle: String?
    var isToggle: Bool
    var action: () -> Void
    @State private var isToggleOn: Bool = false

    var body: some View {
        if isToggle {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundStyle(.black)
                        .font(.system(size: 14, weight: .semibold))
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .foregroundStyle(.gray)
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
                Spacer()
                Toggle(isOn: $isToggleOn){
                    EmptyView()
                }
                .toggleStyle(SwitchToggleStyle(tint: .pri))
            }
            .padding(15)
        } else {
            Button(action: action) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .foregroundStyle(.black)
                            .font(.system(size: 14, weight: .semibold))
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .foregroundStyle(.gray)
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                .padding(15)
            }
            .frame(height: 50)
        }
        
    }
}

struct MenuContent: View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 270)
                    .shadow(color: Color.purple.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(SideMenuRowType.allCases, id: \.self) { row in
                        RowView(title: row.title, subtitle: row.subtitle, isToggle: row.isToggle) {
                            print("\(row.title) selected")
                        }
                    }
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(Color.white)
            }
            Spacer()
        }
        .background(Color.clear)
    }
}

struct SideMenu: View {
    @Binding var isShowing: Bool
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    SideMenu(isShowing: .constant(true), content: AnyView(MenuContent()))
}
