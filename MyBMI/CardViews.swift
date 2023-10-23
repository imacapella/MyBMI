//
//  CardViews.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 18.10.2023.
//

/* import SwiftUI

struct CardViews: View {
    @State var weight : Double
    var rectIcon : String
    var rectText : String
    @State public var age = 30
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 170, height: 170)
            .foregroundColor(.lilac)
            .overlay{
                VStack{
                    Spacer()
                    Text(String(format: "%.0f",rectText))
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    Text(String(format: "%.0f",weight))
                        .font(.system(size:50))
                        .bold()
                        .foregroundColor(.orange)
                    Spacer()
                    HStack{
                        Button(action:{weight-=1; print(weight)}){
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.orange)
                                .overlay{
                                    Image(systemName: "chevron.left")
                                        .foregroundStyle(.lilac)
                                        .bold()
                                }
                        }
                        
                        Button(action:{weight+=1; print(weight)}){
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.orange)
                                .overlay{
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.lilac)
                                        .bold()
                                }
                        }
                    }
                    Spacer()
                }
                
            }.padding(.all,5)
    }
}






#Preview {
    ZStack {
        Color.darkBlue
        VStack{
            HStack{
                CardViews(weight: 50, rectIcon: "fuelpump.circle.fill", rectText: "Weight")
                CardViews(weight: 20, rectIcon: "fuelpump.circle.fill", rectText: "Age")
            }
        }
    }.edgesIgnoringSafeArea(.all)
}
*/
