//
//  BMI.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 24.10.2023.
//

import Foundation
import SwiftUI

struct BMI {
    let classification: WeightClass
    let value: Float
}

enum WeightClass {
    case underweight
    case healthy
    case overweight
    case obese
    case extremelyObese
    case unknown
}
