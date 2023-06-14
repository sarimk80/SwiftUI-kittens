//
//  SwiftUIView.swift
//  
//
//  Created by sarim khan on 14/06/2023.
//

import SwiftUI

public struct KittenRadioButton<Content:View>: View {
    
    @Binding var isChecked:Bool
    public var buttonStatus:ButtonStatus = ButtonStatus.basic
    let content: Content
    
    public init(isChecked: Binding<Bool>,buttonStatus: ButtonStatus = ButtonStatus.basic , @ViewBuilder  content: () -> Content) {
        self._isChecked = isChecked
        self.buttonStatus = buttonStatus
        self.content = content()
    }
    
  public  var body: some View {
      HStack{
          ZStack{
              Circle()
                  .stroke(buttonStatusToColor(buttonStatus: buttonStatus),lineWidth: 2)
                  .frame(width: 30,height: 30)
              
              if(isChecked){ Circle()
                      .fill(buttonStatusToColor(buttonStatus: buttonStatus))
                      .frame(width: 20,height: 20)
                      .transition(.opacity)
              }
              
              else { Circle()
                      .fill(buttonStatusToColor(buttonStatus: buttonStatus).opacity(0.1))
                      .frame(width: 30,height: 30)
                      .transition(.opacity)
              }
          }
          .onTapGesture {
              withAnimation(.easeInOut(duration: 0.3)) {
                  self.isChecked.toggle()
              }
          }
          
          content
              .padding(.leading,4)
          
      }
       
    }
}

struct KittenRadioButton_Previews: PreviewProvider {
    
    static var previews: some View {
        KittenRadioButton(isChecked: .constant(false)) {
            Text("Hello")
        }
    }
}
