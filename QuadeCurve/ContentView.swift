//
//  ContentView.swift
//  QuadeCurve
//
//  Created by Ramill Ibragimov on 09.04.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.orange)
                .frame(height: 120)
                .shadow(radius: 8)
                .overlay(
                    Text("Path")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 40))
                        .edgesIgnoringSafeArea(.all)
            
            Text("QuadeCurve")
                .foregroundColor(.gray)
            
            Text("Here's an example of how you add a curve to your path.")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding()
                .padding(.bottom)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.orange)
                        .shadow(radius: 4, y: 4))
            Spacer()
        }.font(.title)
    }
}

struct RoundedBottomRectangle: Shape {
    // How far up or down you want the curve to extend
    var curveOffset: CGFloat = 10
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        // Add a curve as you draw a line to the next point
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.height), control: CGPoint(x: rect.width/2, y: rect.height + curveOffset))
        path.addLine(to: CGPoint(x: 0, y: 0))
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
