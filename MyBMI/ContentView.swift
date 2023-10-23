//
//  ContentView.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State public var weight = 30
    @State var calculateButtonToggled = false
    @State var restartButton = false
    var body: some View {
        ZStack {
            Color.darkBlue
            VStack {
                Spacer()
                HeightCardView()
                HStack{
                    CardViews(weight: weight, rectIcon: "car", rectText: "Weight")
                        
                    CardViews(weight: weight, rectIcon: "car", rectText: "Age")
                }
                HStack {
                    if calculateButtonToggled == true{
                        VStack {
                            RoundedRectangle(cornerRadius: 17)
                                .frame(width: 360, height: 60)
                                .foregroundColor(.lilac)
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
                            Button(action:{calculateButtonToggled.toggle()}){
                                RoundedRectangle(cornerRadius: 17)
                                    .frame(width: 360, height: 70)
                                    .foregroundColor(.lilac)
                                    .overlay{
                                        Text("Re-Calculate")
                                            .bold()
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    }
                            }.padding()
                        }
                    }
                    else if calculateButtonToggled == false && restartButton == false{
                        Button(action:{print("\(BMICalculator())")}){
                            RoundedRectangle(cornerRadius: 17)
                                .frame(width: 360, height: 70)
                                .foregroundColor(.lilac)
                                .overlay{
                                    Text("Calculate MyBMI")
                                        .bold()
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                        }.padding()
                        
                        
                    }
                }
                Spacer()
                
            }
            .padding()
        }.edgesIgnoringSafeArea(.all)
    }
    
    func BMICalculator() -> Double{
        calculateButtonToggled.toggle()
         return (Double(weight))
    }
}



#Preview {
    ContentView()
}


