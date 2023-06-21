//
//  SwiftUIView.swift
//  
//
//  Created by sarim khan on 20/06/2023.
//

import SwiftUI

/// Hello from view

public struct CircularProgressBarView: View {
    
    @Binding var progress:Double
    public var buttonStatus:ButtonStatus = ButtonStatus.primary
    public var size:ViewSizeStatus = ViewSizeStatus.medium
    
   public init(progress: Binding<Double>, buttonStatus: ButtonStatus = ButtonStatus.primary, size: ViewSizeStatus = ViewSizeStatus.medium) {
        self._progress = progress
        self.buttonStatus = buttonStatus
        self.size = size
    }
    
    
    public  var body: some View {
        ZStack(alignment:.center) {
            
            Circle()
                .trim(from: 0,to: 1)
                .stroke(buttonStatusToColor(buttonStatus: buttonStatus).opacity(0.2), style: StrokeStyle(lineWidth: 7,lineCap: .round))
                .frame(width: viewSizeStatusToInt(viewSizeStatus: size),height: viewSizeStatusToInt(viewSizeStatus: size))
            
            Circle()
                .trim(from: 0,to: progress)
                .stroke(buttonStatusToColor(buttonStatus: buttonStatus).opacity(0.9), style: StrokeStyle(lineWidth: 7,lineCap: .round))
                .frame(width: viewSizeStatusToInt(viewSizeStatus: size),height: viewSizeStatusToInt(viewSizeStatus: size))
                .animation(.linear, value: progress)
            
            Text("\(progress * 100,specifier: "%.0f")% ")
                .font(sizeStatusToFont(viewSizeStatus: size))
                .foregroundStyle(buttonStatusToColor(buttonStatus: buttonStatus))
            
        }
        .onChange(of: progress, perform: { value in
            print(value)
        })
    }
}

struct CircularProgressBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        CircularProgressBarView(progress: .constant(0.6))
    }
}
