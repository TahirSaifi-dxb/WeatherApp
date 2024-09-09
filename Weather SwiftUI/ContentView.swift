//
//  ContentView.swift
//  Weather SwiftUI
//
//  Created by Tahir Saifi on 09/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            backgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Dubai, UAE")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 70)
                Spacer().frame(height: 80)
                HStack(spacing: 20)
                {
                    Minibar(weekofday: "TUE", ImageName: "cloud.rain.fill", temperature: 70)
                    Minibar(weekofday: "WED", ImageName: "cloud.moon.fill", temperature: 50)
                    Minibar(weekofday: "THU", ImageName: "sun.rain.fill", temperature: 40)
                    Minibar(weekofday: "FRI", ImageName: "wind", temperature: 30)
                    Minibar(weekofday: "THU", ImageName: "moon.stars.fill", temperature: 25)
                   
                }.padding(10)
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: Color.white)
                    
                }
                Spacer()
                     
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Minibar: View {
    var weekofday: String
    var ImageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(weekofday)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: ImageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .frame(width: 40,height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 30 , weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

