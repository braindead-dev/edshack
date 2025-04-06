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
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("NeuroFlex")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                
                Spacer()
                
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                    .padding(.trailing, 20)
            }
            .padding(.leading, 20)
            .padding(.top, 8)
            
            HStack(spacing: 16) {
                // Live Angle Card
                VStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .stroke(Color(red: 0.9, green: 0.92, blue: 0.95), lineWidth: 12)
                            .frame(width: 80, height: 80)
                        
                        Circle()
                            .trim(from: 0, to: 0.7)
                            .stroke(Color(red: 0.4, green: 0.45, blue: 0.9), lineWidth: 12)
                            .frame(width: 80, height: 80)
                            .rotationEffect(.degrees(-90))
                        
                        Text("150°")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                    }
                    
                    Text("Live Angle")
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
                
                // Safe Time Card
                VStack(spacing: 4) {
                    Image("love_bear")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                    
                    Text("12 mins")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                    
                    Text("Strain Time Today")
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color(red: 0.988, green: 0.976, blue: 0.961).ignoresSafeArea())
    }
}

struct SessionView: View {
    @State private var angle: Int = 0
    @State private var isConnected: Bool = false
    @State private var connectionStatus: String = "Not Connected"
    @State private var timer: Timer? = nil
    @State private var lastFetchTime: Date = Date()
    
    // Arduino server URL
    private let arduinoURL = "http://192.168.4.1"
    
    var body: some View {
        VStack(spacing: 20) {
            // Connection status
            HStack {
                Circle()
                    .fill(isConnected ? Color.green : Color.red)
                    .frame(width: 12, height: 12)
                Text(connectionStatus)
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
            }
            .padding(.top, 20)
            
            // Angle display
            VStack(spacing: 10) {
                Text("Current Angle")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                
                Text("\(angle)°")
                    .font(.system(size: 72, weight: .bold))
                    .foregroundColor(angleColor)
                
                // Status indicator
                Text(angleStatus)
                    .font(.system(size: 20))
                    .foregroundColor(angleColor)
                    .padding(.top, 5)
                
                // Latency indicator
                if isConnected {
                    Text("Latency: \(String(format: "%.0f", latency))ms")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
            }
            .padding(.vertical, 30)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.5))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .padding(.horizontal)
            
            // Connect button
            Button(action: {
                if isConnected {
                    stopPolling()
                } else {
                    startPolling()
                }
            }) {
                Text(isConnected ? "Disconnect" : "Connect")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(isConnected ? Color.red : Color(red: 0.239, green: 0.482, blue: 0.945))
                    )
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.988, green: 0.976, blue: 0.961).ignoresSafeArea())
    }
    
    // Calculate latency in milliseconds
    var latency: Double {
        return Date().timeIntervalSince(lastFetchTime) * 1000
    }
    
    // Angle status based on value
    var angleStatus: String {
        if angle < 170 {
            return "Safe"
        } else if angle >= 170 && angle <= 180 {
            return "Caution"
        } else {
            return "Hyperextending"
        }
    }
    
    // Color based on angle
    var angleColor: Color {
        if angle < 170 {
            return Color(red: 0.4, green: 0.8, blue: 0.4) // Green
        } else if angle >= 170 && angle <= 180 {
            return Color.orange
        } else {
            return Color(red: 1, green: 0.4, blue: 0.4) // Red
        }
    }
    
    // Start polling for angle data
    func startPolling() {
        // First try to connect to the Arduino
        testConnection { success in
            if success {
                isConnected = true
                connectionStatus = "Connected to NeuroFlex"
                
                // Create a timer to poll every 100ms (10 times per second)
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    fetchAngleData()
                }
            } else {
                isConnected = false
                connectionStatus = "Connection Failed"
            }
        }
    }
    
    // Test connection to Arduino
    func testConnection(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: arduinoURL) else {
            completion(false)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { _, response, error in
            if let error = error {
                print("Connection error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
        task.resume()
    }
    
    // Stop polling
    func stopPolling() {
        timer?.invalidate()
        timer = nil
        isConnected = false
        connectionStatus = "Not Connected"
        angle = 0
    }
    
    // Fetch angle data from Arduino
    func fetchAngleData() {
        guard let url = URL(string: arduinoURL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isConnected = false
                    self.connectionStatus = "Connection Lost"
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let angleValue = json["angle"] as? Int {
                    DispatchQueue.main.async {
                        self.angle = angleValue
                        self.lastFetchTime = Date()
                    }
                }
            } catch {
                print("JSON parsing error: \(error.localizedDescription)")
            }
        }
        task.resume()
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
                                    .font(.system(size: 14))
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9 / CGFloat(items.count))
                        .foregroundColor(selectedTab == item.tag ? 
                            Color(red: 0.216, green: 0.227, blue: 0.373) : 
                            Color(red: 0.706, green: 0.722, blue: 0.733))
                    }
                }
                Spacer()
            }
            .padding(.top, 16)
            .frame(height: 80)
            
            // Extra rectangle to ensure we extend all the way down
            Rectangle()
                .fill(Color(red: 1.0, green: 1.0, blue: 0.992))
                .frame(height: 30)
        }
        .background(Color(red: 1.0, green: 1.0, blue: 0.992))
        .clipShape(RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
        .overlay(
            RoundedCorner(radius: 32, corners: [.topLeft, .topRight])
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
        TabBarItem(icon: "circle.grid.cross.fill", title: "Session", tag: 1),
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
                .ignoresSafeArea(.all, edges: .bottom)
        }
        .ignoresSafeArea(.all, edges: .bottom)
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
