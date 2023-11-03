//
//  ContentView.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isChanged = false
    @State var bmi = BMICalculator(height: 0.0,weight: 0.0)
    @State var isPresentedPopup = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("purpleHighlight"), Color("purpleLight"), Color("purpleDark")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 25)
                .scaleEffect(1.3)
            VStack {
                Spacer()
                Text("Welcome To MyBMI")
                    .padding(.top,100)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                VStack{
                    Spacer()
                    HStack{
                        Text("Height")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(getHeight(cm:Float(bmi.height)))")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                    Slider(value: $bmi.height, in: 120...220, onEditingChanged: { _ in
                        if self.isChanged == false { self.isChanged = true }
                    })
                    .accentColor(Color("purpleHighlight"))
                    .padding()
                    .onTapGesture { isChanged = true }
                    .onAppear {
                        if(self.bmi.height < 1) {
                            self.bmi.height = 170
                        }
                    }
                    
                }
                
                VStack{
                    HStack{
                        Text("Weight")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(getWeight(kg:Float(bmi.weight)))")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                    Slider(value: $bmi.weight, in: 20...150, onEditingChanged: { _ in
                        if self.isChanged == false { self.isChanged = true }
                    })
                    .accentColor(Color("purpleHighlight"))
                    .padding()
                    .onTapGesture { isChanged = true }
                    .onAppear {
                        if(self.bmi.weight < 1) {
                            self.bmi.weight = 85
                        }
                    }
                    Spacer()
                }
                
                
                
                Button(action:{isPresentedPopup.toggle()}){
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 340, height: 60)
                        .foregroundColor(.purpleHighlight)
                        .overlay{
                            Text("Calculate")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                        }
                        .sheet(isPresented: $isPresentedPopup, content: {
                            ResultView(bmi: bmi)
                        })
                }
            }
        }
    }
    
    
    func getHeight(cm:Float) -> String {
        return "\(String(format: "%.0f", cm)) cm"
    }
    
    func getWeight(kg:Float) -> String {
        return "\(String(format: "%.0f", kg)) kg"
    }
}
    
    #Preview {
        ContentView()
    }
    
    

