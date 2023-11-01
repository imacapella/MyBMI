//
//  BMICalculator.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 24.10.2023.
//

import Foundation
import SwiftUI

struct BMICalculator {
    
    var height: Float = 0.0
    var weight: Float = 0.0 
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let heightFormatted = height / 100
        let bmiValue = weight / (heightFormatted * heightFormatted)
        
        if bmiValue < 18.5 {
            bmi = BMI(
                classification: .underweight,
                value: bmiValue,
                advice: "You are underweight.",
                symbol: "exclamationmark.circle",
                color: .blue)
        } else if bmiValue < 25 {
            bmi = BMI(
                classification: .healthy,
                value: bmiValue,
                advice: "You are in a healthy BMI range.",
                symbol: "checkmark.seal",
                color: .green)
        } else if bmiValue < 30 {
            bmi = BMI(
                classification: .overweight,
                value: bmiValue,
                advice: "You are overweight.",
                symbol: "exclamationmark.circle",
                color: .orange)
        } else if bmiValue < 40 {
            bmi = BMI(
                classification: .obese,
                value: bmiValue,
                advice: "You are obese.",
                symbol: "exclamationmark.triangle",
                color: .red)
        } else {
            bmi = BMI(
                classification: .extremelyObese,
                value: bmiValue,
                advice: "You are extremely obese!",
                symbol: "exclamationmark.octagon",
                color: .black)
        }
    }
    
    func getBMIValue() -> String {
        let bmiToDecimalPlace = String(format: "%.2f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
    
    func getHeight() -> String {
        return String(height)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Please enter your height and weight to get a BMI result."
    }
    
    func getColor() -> Color {
        return bmi?.color ?? Color.black
    }
    
    func getBMIValue() -> Float {
        return bmi?.value ?? 0.0
    }
    
}
