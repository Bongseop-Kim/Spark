//
//  ContentView.swift
//  Spark
//
//  Created by 김봉섭 on 2024/08/19.
//

import SwiftUI

struct HomeView: View {
    @State private var isMenuOpen: Bool = false
    @State var selectedSideMenuTab = 0
    @State private var progress = 0.2
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Image("level=00")
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    HStack {
                        Button(action: {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }){
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .padding()
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Jogging")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.title2)
                        Text("30 min")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        CheckListView(items: [
                            CheckItem(isOn: true, text: "Mon"),
                            CheckItem(isOn: false, text: "Tue"),
                            CheckItem(isOn: true, text: "Wed")
                        ])
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .padding(.top, 80.0)
                .ignoresSafeArea(edges: .top)
                
                Spacer()
                    .frame(height: 420)
                
                LevelInfoView(progress: $progress)
                    .padding()
                
                Spacer()
            }
            
            SideMenu(isShowing: $isMenuOpen, content: AnyView(MenuContent()))
        }
    }
}

#Preview {
    HomeView()
}
