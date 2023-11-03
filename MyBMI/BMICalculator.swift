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
    
    mutating func calculateBMI(height: Float, weight: Float)-> String{
        
        let heightFormatted = height / 100
        let bmiValue = weight / (heightFormatted * heightFormatted)
        
        
        if bmiValue < 18.5 {
            bmi = BMI(
                classification: .underweight,
                value: bmiValue)
        } else if bmiValue < 25 {
            bmi = BMI(
                classification: .healthy,
                value: bmiValue)
        } else if bmiValue < 30 {
            bmi = BMI(
                classification: .overweight,
                value: bmiValue)
        } else if bmiValue < 40 {
            bmi = BMI(
                classification: .obese,
                value: bmiValue)
        } else {
            bmi = BMI(
                classification: .extremelyObese,
                value: bmiValue)
        }
        let bmiToDecimalPlace = String(format: "%.2f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
    
    mutating func calculateBMIFloat(height: Float, weight: Float) -> Float{
        let heightFormatted = height / 100
        let bmiValue = weight / (heightFormatted * heightFormatted)
        return bmiValue
    }
    
    func getHeight() -> String {
        return String(height)
    }
}
