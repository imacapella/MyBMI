//
//  ResultView.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 24.10.2023.
//

import SwiftUI

struct ResultView: View {
    @State var bmi : BMICalculator
    @State var infoButton = false
    @State var isShowingPopup = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.orange.opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Spacer()
                    Text("\(bmi.getBMIValue())")
                        .font(Font.system(size: 80, design: .rounded).weight(.heavy))
                        .foregroundColor(.white)
                    
                    
                    let customWidth = geo.size.width / 1.5
                    
                    // Progress bar with colors
                    ZStack(alignment: .leading) {
                        Rectangle().frame(width: customWidth, height: 20)
                            .foregroundColor(Color(.black).opacity(0.5))
                        Rectangle().frame(width: (40/50)*customWidth, height: 20)
                            .foregroundColor(.red)
                        Rectangle().frame(width: (30/50)*customWidth, height: 20)
                            .foregroundColor(.orange)
                        Rectangle().frame(width: (25/50)*customWidth, height: 20)
                            .foregroundColor(.green)
                        Rectangle().frame(width: (18.5/50)*customWidth, height: 20)
                            .foregroundColor(.blue)
                    }.cornerRadius(10).overlay{
                        if bmi.getBMIValue() <= 18.5{
                            RoundedRectangle(cornerRadius: 45)
                                .stroke(Color.blue, lineWidth: 7)
                        }
                        else if bmi.getBMIValue() <= 25 && bmi.getBMIValue() > 18.5{
                            RoundedRectangle(cornerRadius: 45)
                                .stroke(Color.green, lineWidth: 7)
                        }
                        else if bmi.getBMIValue() <= 30 && bmi.getBMIValue() > 25{
                            RoundedRectangle(cornerRadius: 45)
                                .stroke(Color.orange, lineWidth: 7)
                        }
                        else if bmi.getBMIValue() <= 40 && bmi.getBMIValue() > 30{
                            RoundedRectangle(cornerRadius: 45)
                                .stroke(Color.red, lineWidth: 7)
                        }
                        else{
                            RoundedRectangle(cornerRadius: 45)
                                .stroke(Color.black, lineWidth: 7)
                        }
                            
                    }
                    
                    Spacer()
                    
                    Button(action:{infoButton.toggle()}){
                        if infoButton == false{
                            Image(systemName: "info.bubble")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                        }
                        else{
                            HStack {
                                Button(action:{}){
                                    if infoButton == true{
                                        Image(systemName: "info.bubble")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 30))
                                            .onTapGesture {
                                                withAnimation(.easeIn(duration: 0.3)) {
                                                    infoButton.toggle()
                                                }
                                            }
                                    }
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .background(Circle().fill(Color.blue))
                                        .frame(width: 30, height: 30)
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .background(Circle().fill(Color.green))
                                        .frame(width: 30, height: 30)
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .background(Circle().fill(Color.orange))
                                        .frame(width: 30, height: 30)
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .background(Circle().fill(Color.red))
                                        .frame(width: 30, height: 30)
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .background(Circle().fill(Color.black))
                                        .frame(width: 30, height: 30)
                                }.padding(.horizontal)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}



#Preview {
    ResultView(bmi: BMICalculator(height: 170, weight: 76))
}
