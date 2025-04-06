//
//  ContentView.swift
//  NeuroFlex
//
//  Created by Henry on 4/5/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isWelcomeScreenShown: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
                .frame(height: 50)
                
            // Welcome section
            VStack(alignment: .leading, spacing: 5) {
                Text("Welcome!")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                
                Text("Let's work together to stop hyperextending your joints and improve your proprioception.")
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal)
            
            // Logo image
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280, height: 280)
            
            // Today's Progress section
            VStack(alignment: .leading, spacing: 12) {
                Text("Today's Progress")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 1, green: 0.4, blue: 0.4))
                            .frame(width: 30, height: 30)
                        
                        Text("2")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    
                    Text("Overextensions")
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                }
                
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.4, green: 0.8, blue: 0.4))
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "arrow.up")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    
                    Text("Better than yesterday")
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                }
            }
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.5))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .padding(.horizontal)
            
            // Get Started button
            Button(action: {
                isWelcomeScreenShown = false
            }) {
                Text("Get Started")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(red: 0.239, green: 0.482, blue: 0.945))  // #3D7BF1
                    )
            }
            .padding(.horizontal)
            
            Spacer()
                .frame(height: 20)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.976, green: 0.949, blue: 0.929).ignoresSafeArea())
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.988, green: 0.976, blue: 0.961).ignoresSafeArea())  // #FCF9F5
    }
}

struct SessionView: View {
    var body: some View {
        VStack {
            Text("Session")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.988, green: 0.976, blue: 0.961).ignoresSafeArea())  // #FCF9F5
    }
}

struct HistoryView: View {
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.988, green: 0.976, blue: 0.961).ignoresSafeArea())  // #FCF9F5
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.988, green: 0.976, blue: 0.961).ignoresSafeArea())  // #FCF9F5
    }
}

struct TabBarItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let tag: Int
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    let items: [TabBarItem]
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 0) {
                        ForEach(items) { item in
                            Button(action: {
                                selectedTab = item.tag
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: item.icon)
                                        .font(.system(size: 24))
                                    Text(item.title)
                                        .font(.system(size: 12))
                                }
                            }
                            .frame(width: (geometry.size.width * 0.9) / CGFloat(items.count))
                            .foregroundColor(selectedTab == item.tag ? 
                                Color(red: 0.216, green: 0.227, blue: 0.373) : 
                                Color(red: 0.706, green: 0.722, blue: 0.733))
                        }
                    }
                    .frame(width: geometry.size.width * 0.9)
                    Spacer()
                }
                .padding(.top, 24)
            }
            .frame(height: 80)
        }
        .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
        .background(
            Color(red: 1.0, green: 1.0, blue: 0.992)
        )
        .overlay(
            RoundedCorner(radius: 24, corners: [.topLeft, .topRight])
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}

// Helper extension to create partial rounded corners
extension View {
    func corners(_ corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: 24, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct MainTabView: View {
    @State private var selectedTab = 0
    
    let tabItems = [
        TabBarItem(icon: "house.fill", title: "Home", tag: 0),
        TabBarItem(icon: "circle", title: "Session", tag: 1),
        TabBarItem(icon: "clock", title: "History", tag: 2),
        TabBarItem(icon: "gearshape.fill", title: "Settings", tag: 3)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                SessionView()
                    .tag(1)
                
                HistoryView()
                    .tag(2)
                
                SettingsView()
                    .tag(3)
            }
            
            CustomTabBar(selectedTab: $selectedTab, items: tabItems)
        }
    }
}

struct ContentView: View {
    @State private var isWelcomeScreenShown = true
    
    var body: some View {
        if isWelcomeScreenShown {
            WelcomeView(isWelcomeScreenShown: $isWelcomeScreenShown)
        } else {
            MainTabView()
        }
    }
}

#Preview {
    ContentView()
}
