//
//  SwiftUIView.swift
//  
//
//  Created by sarim khan on 22/06/2023.
//

import SwiftUI

public struct LinearProgressView: View {
    
    @Binding private var progress:Double
    private var buttonStatus:ButtonStatus = ButtonStatus.primary

    
    
    public  init(progress: Binding<Double>,buttonStatus:ButtonStatus = ButtonStatus.primary) {
        self._progress = progress
        self.buttonStatus = buttonStatus
    }
    
    
    public var body: some View {
        GeometryReader(content: { geometry in
            
            ZStack(alignment:.leading){
                RoundedRectangle(cornerRadius: 8.0,style: .circular)
                    .fill(buttonStatusToColor(buttonStatus: buttonStatus).opacity(0.3))
                    .frame(width: .infinity,height: 8)
                    
                
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(buttonStatusToColor(buttonStatus: buttonStatus))
                    .frame(width: geometry.size.width * (progress / 100)  ,height: 8)
                    
            }
        })
        .frame(width: .infinity,height: 8)
        
       
    }
}

struct LinearProgressView_Previews: PreviewProvider {
    
    static var previews: some View {
        LinearProgressView(progress: .constant(40))
        .padding()
    }
}
