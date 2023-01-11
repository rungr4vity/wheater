//
//  WheaterButton.swift
//  oct
//
//  Created by Francisco Perez on 25/12/22.
//

import SwiftUI



struct WheaterButton:View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View{
        
        Text(title)
            .frame(width: 280, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size:20,weight: .bold,design: .default))
            .cornerRadius(10)
    }
}
