//
//  ContentView.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State public var weight = 30.0
    @State var sliderHeight = 115.0
    @State var calculateButtonToggled = false
    @State var restartButton = false
    var body: some View {
        ZStack {
            Color.orange.opacity(0.3)
            VStack {
                Spacer()
                HeightCardView(value: $sliderHeight, sliderName: "Height", min: 100, max: 230)
                HeightCardView(value: $weight, sliderName: "Weight", min: 30, max: 200)
                
                HStack {
                    if calculateButtonToggled == true{
                        VStack {
                            RoundedRectangle(cornerRadius: 17)
                                .frame(width: 360, height: 60)
                                .foregroundColor(.orange.opacity(0.5))
                                .overlay{
                                    HStack {
                                        Text("Your BMI is: ")
                                            .foregroundColor(.white)
                                            .font(.title)
                                        
                                        Text(String(format: "%.2f", BMICalculator()))
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title)
                                    }
                            }
                            //CALCULATE BUTTON
                            HStack {
                                Button(action:{BMICalculator()}){
                                    RoundedRectangle(cornerRadius: 17)
                                        .frame(width: 280, height: 70)
                                        .foregroundColor(.orange.opacity(0.5))
                                        .overlay{
                                            Text("Calculate MyBMI")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.white)
                                        }
                                }
                                //RESTART BUTTON
                                Button(action:{
                                    weight = 30
                                    sliderHeight = 115
                                    calculateButtonToggled = false
                                }){
                                    RoundedRectangle(cornerRadius: 17)
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.orange.opacity(0.5))
                                        .overlay{
                                            Image(systemName: "arrow.clockwise")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.white)
                                        }
                                }
                            }
                        }
                    }
                    else if calculateButtonToggled == false && restartButton == false{
                        HStack {
                            //CALCULATE BUTTON
                            Button(action:{print("\(BMICalculator())")}){
                                RoundedRectangle(cornerRadius: 17)
                                    .frame(width: 280, height: 70)
                                    .foregroundColor(.orange.opacity(0.5))
                                    .overlay{
                                        Text("Calculate MyBMI")
                                            .bold()
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    }
                            }
                            
                            //RESTART BUTTON
                            Button(action:{
                                weight = 30
                                sliderHeight = 115
                                calculateButtonToggled = false
                            }){
                                RoundedRectangle(cornerRadius: 17)
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.orange.opacity(0.5))
                                    .overlay{
                                        Image(systemName: "arrow.clockwise")
                                            .bold()
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    }
                            }
                        }
                        
                        
                    }
                }
                Spacer()
                
            }
            .padding()
        }.edgesIgnoringSafeArea(.all)
    }
    
    func BMICalculator() -> Double {
        let sliderHeightFormatted = pow(Double(sliderHeight / 100), 2)
        print(sliderHeightFormatted, weight)
        calculateButtonToggled.toggle()
        let bmi = weight / sliderHeightFormatted
        return bmi
    }
}


struct HeightCardView: View {
    @Binding public var value: Double
    @State private var isEditing = false
    var sliderName: String
    var min: Double
    var max: Double
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 357, height: 150)
            .foregroundColor(Color.orange.opacity(0.5))
            .overlay(
                VStack {
                    Text(sliderName)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(String(format: "%.0f", value))
                        .font(.system(size: 38))
                        .bold()
                        .foregroundColor(.white)
                    
                    Slider(value: $value, in: min...max, onEditingChanged: { editing in
                        isEditing = editing
                    })
                    .accentColor(.orange)
                }
                .padding()
            )
    }
}




#Preview {
    ContentView()
}


