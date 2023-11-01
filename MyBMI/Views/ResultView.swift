//
//  ResultView.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 24.10.2023.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var bmi : BMICalculator
    @State var infoButton = false
    @State var isShowingPopup = false
    
    
    
    var body: some View {
        ZStack {
            bmiChanges()
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack {
                    Spacer()
                    Button(action:{presentationMode.wrappedValue.dismiss()}){
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }.padding(.trailing,40).padding(.top,40)
                }
                Spacer()
                Text("\(bmi.getBMIValue())")
                    .font(Font.system(size: 80, design: .rounded).weight(.heavy))
                    .foregroundColor(.white)
                HStack {
                    Text("You Are")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Text("\(getWeightClass())")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action:{presentationMode.wrappedValue.dismiss()}){
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 340, height: 60)
                        .foregroundColor(bmiChanges().opacity(0.6))
                        .overlay{
                            Text("Recalculate")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                }.padding()
            }
            Spacer()
            
        }
    }
    
    fileprivate func getWeightClass() -> String {
        switch bmi.bmi?.classification {
        case .underweight:
            return "Underweight"
        case .healthy:
            return "Healthy"
        case .overweight:
            return "Overweight"
        case .obese:
            return "Obese"
        case .extremelyObese:
            return "Extremely Obese"
        default:
            return "Unknown"
        }
    }
    
    fileprivate func bmiChanges() -> Color {
        if bmi.getBMIValue() <= 18.5{
            return Color.blue
        }
        else if bmi.getBMIValue() <= 25 && bmi.getBMIValue() > 18.5{
            return Color.green
        }
        else if bmi.getBMIValue() <= 30 && bmi.getBMIValue() > 25{
            return Color.orange
        }
        else if bmi.getBMIValue() <= 40 && bmi.getBMIValue() > 30{
            return Color.red
        }
        else{
            return Color.black.opacity(0.6)
        }
    }
    
}


#Preview {
    ResultView(bmi: BMICalculator(height: 170, weight: 76))
}
