//
//  Weather.swift
//  oct
//
//  Created by Francisco Martin on 2022.
//

import SwiftUI

struct Weather: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        //Zstack is for example background
        //VStack is for specific content
     
        // gradiente background is good looking
        ZStack {
            BackgroudView(isNight: $isNight,topcolor: isNight ? .black : .blue, bottomcolor: isNight ? .gray :  Color("lightblue"))
            
       //IF isnght is true(?) then .blue so if false (:) then..
            
            // main title
            VStack{
               CityTextView(cityName: "Los Angeles,CA")
                
                VStack(spacing: 10){
                //here
                    MainWheaterStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", tempareature: "-1°")
                    
                }
                .padding(.bottom,40)
              
                //horizontal stack
                // we are creating a individual vstack for every day of the week
                HStack(spacing: 20){
                    
                    
    //to create a extract view just click the command button and select the VStack word
                    WheaterdayView(dayoftheweek: "MON", imageName: "cloud.sun.fill", temparature: 70)
                        
                    
                    WheaterdayView(dayoftheweek: "TUE", imageName: "sun.max.fill", temparature: 50)
                        
                    
                    WheaterdayView(dayoftheweek: "WED", imageName: "wind.snow", temparature: 45)
                        
                    
                    WheaterdayView(dayoftheweek: "THU", imageName: "cloud.sun.fill", temparature: 65)
                        
                    
                    WheaterdayView(dayoftheweek: "FRI", imageName: "cloud.rain.fill", temparature: 35)
                        
                    WheaterdayView(dayoftheweek: "SAT", imageName: "cloud.rain.fill", temparature: 35)
                        
                    
                }
                .padding(.bottom,50)
                
  
                //the first section is the action
                // the second section is the label
                Button{
                    isNight.toggle()
                } label: {
                    WheaterButton(title: "Change Day", textColor: Color.blue, backgroundColor: .white)
                    
                
                }
            }
        }
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Weather()
        }
    }
}

struct WheaterdayView: View {
    
    var dayoftheweek: String
    var imageName: String
    var temparature: Int
    
    var body: some View {
        
        VStack {
            Text(dayoftheweek)
                .font(.system(size:16,weight: .medium, design: .default))
                .foregroundColor(Color.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40, height:40)
            
            Text("\(temparature)")
                .font(.system(size:28,weight: .medium))
                .foregroundColor(Color.white)
        }
    }
}

struct BackgroudView: View {
    
    // we need Binding when i need to use a goblar variable
    @Binding var isNight: Bool
    var topcolor: Color
    var bottomcolor: Color
    
    var body: some View {
        
        LinearGradient(colors: [isNight ? .black: .blue,isNight ? .gray : Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}



struct CityTextView: View {
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size:32,weight: .medium,design: .default))
            .foregroundColor(Color.white)
            .padding()
    }
} // end struct CityTextView


struct MainWheaterStatusView: View{
    
    var imageName: String
    var tempareature: String
    
    var body: some View{
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:170, height:170)
        
        Text(tempareature)
            .font(.system(size:76,weight: .medium))
            .foregroundColor(Color.white)
    }
} // end struct Main


