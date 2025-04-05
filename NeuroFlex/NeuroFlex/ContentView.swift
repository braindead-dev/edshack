//
//  ContentView.swift
//  NeuroFlex
//
//  Created by Henry on 4/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            // Welcome section
            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome!")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                
                Text("Let's work together to stop hyperextending your joints and improve your proprioception.")
                    .font(.system(size: 24))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal)
            
            // Logo image
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            // Today's Progress section
            VStack(alignment: .leading, spacing: 20) {
                Text("Today's Progress")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 1, green: 0.4, blue: 0.4))
                            .frame(width: 40, height: 40)
                        
                        Text("2")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    Text("Overextensions")
                        .font(.system(size: 24))
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                }
                
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.4, green: 0.8, blue: 0.4))
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "arrow.up")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    Text("Better than yesterday")
                        .font(.system(size: 24))
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.33))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    .background(Color.white)
            )
            .padding(.horizontal)
            
            Spacer()
            
            // Get Started button
            Button(action: {
                // Nothing happens for now
            }) {
                Text("Get Started")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.blue)
                    )
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.95, green: 0.95, blue: 0.97).ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
