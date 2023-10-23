//
//  Slider.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 20.10.2023.
//

import SwiftUI

struct HeightCardView: View {
    @State private var value = 115.0
    @State private var isEditing = false
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 355, height: 150)
            .foregroundColor(.lilac)
            .overlay{
                VStack{
                    Text("Height")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        //.padding()
                        
                    Text(String(format: "%.0f", value))
                        .font(.system(size: 38))
                        .bold()
                        .foregroundColor(.orange)
                    
                    Slider(value: $value, in: 50...230, onEditingChanged: {editing in
                    isEditing = editing
                        }
                    ).tint(.orange)
                    
                }.padding()
            }
    }
}

#Preview {
    ZStack{
        Color.darkBlue
        HeightCardView()
    }.edgesIgnoringSafeArea(.all)
}
