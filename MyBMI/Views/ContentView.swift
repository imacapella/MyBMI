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
            Color.black
                .edgesIgnoringSafeArea(.all)
            AnimatedBackground()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 25)
                .scaleEffect(1.2)
                .opacity(0.9)
            
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct AnimatedBackground: View {
        
        @State var start = UnitPoint(x: 0, y: -2)
        @State var end = UnitPoint(x: 4, y: 0)
        
        let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
        let colors = [Color(.black), Color(.black), Color("purpleDark"), Color("purpleLight"), Color("purpleHighlight")]
        
        var body: some View {
            
            LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                .animation(Animation.easeInOut(duration: 10).repeatForever())
                .onReceive(timer, perform: { _ in
                    self.start = UnitPoint(x: 4, y: 0)
                    self.end = UnitPoint(x: 0, y: 2)
                    self.start = UnitPoint(x: -4, y: 20)
                    self.start = UnitPoint(x: 4, y: 0)
                })
        }
    }
}
    
    #Preview {
        ContentView()
    }
    
    

