//
//  ContentView.swift
//  NeuroFlex
//
//  Created by Henry on 4/5/25.
//

import SwiftUI

struct ContentView: View {
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
            VStack(alignment: .leading, spacing: 20) {
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
                // Nothing happens for now
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
                .frame(height: 20)  // Reduced from 40 to bring button higher
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.976, green: 0.949, blue: 0.929).ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
