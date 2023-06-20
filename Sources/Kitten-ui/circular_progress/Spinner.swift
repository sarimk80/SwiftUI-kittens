//
//  SwiftUIView.swift
//
//
//  Created by sarim khan on 20/06/2023.
//

import SwiftUI

public struct SpinnerView: View {
    @State var appear = false
    @State private var isRotating = 0.0
    var lineWidth:CGFloat = 5
    var animationSpeed:Double = 0.2
    public var buttonStatus:ButtonStatus = ButtonStatus.primary
    
    public init(lineWidth: CGFloat = 5, animationSpeed: Double = 0.2,buttonStatus: ButtonStatus = ButtonStatus.primary) {
       
        self.lineWidth = lineWidth
        self.animationSpeed = animationSpeed
        self.buttonStatus = buttonStatus
    }
    
    public  var body: some View {
        Circle()
        
            .trim(from: appear ? 0.0 : 0.1,to: appear ? 0.3 : 0.95)
            .stroke(buttonStatusToColor(buttonStatus: buttonStatus), style: StrokeStyle(lineWidth: lineWidth,lineCap: .round))
            .frame(width: 50,height: 50)
            .rotationEffect(Angle(degrees: isRotating))
            .animation(.linear.speed(animationSpeed).repeatForever(), value: appear)
            .onAppear {
                withAnimation(Animation.linear.delay(0.2)) {
                    self.appear .toggle()
                    
                }
                withAnimation(.linear(duration: 0.2)
                    .speed(animationSpeed).repeatForever(autoreverses: false)) {
                        isRotating = 360.0
                    }
                
            }
        
        
    }
}

struct SpinnerView_Previews: PreviewProvider {
    
    static var previews: some View {
        SpinnerView(lineWidth: 5, animationSpeed: 0.2)
    }
}
