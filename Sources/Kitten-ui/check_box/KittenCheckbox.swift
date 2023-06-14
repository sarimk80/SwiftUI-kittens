//
//  SwiftUIView.swift
//
//
//  Created by sarim khan on 13/06/2023.
//

import SwiftUI

public struct KittenCheckbox<Content:View>:View {
    
    @Binding var isChecked:Bool
    public var buttonStatus:ButtonStatus = ButtonStatus.primary
    let content: Content
    
    public init(isChecked: Binding<Bool>, buttonStatus: ButtonStatus = ButtonStatus.primary,@ViewBuilder  content: () -> Content) {
        self._isChecked = isChecked
        self.buttonStatus = buttonStatus
        self.content = content()
    }
    
    public  var body: some View {
        Group{
            HStack{
                ZStack(content: {
                    Rectangle()
                        .fill(isChecked ? buttonStatusToColor(buttonStatus: buttonStatus):buttonStatusToColor(buttonStatus: buttonStatus).opacity(0.1))
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(buttonStatusToColor(buttonStatus: buttonStatus))
                        )
                        .frame(width: 30,height: 30)
                        .cornerRadius(6)
                        .transition(.opacity)
                    
                    if isChecked { Image(systemName: "checkmark")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .transition(.opacity)
                    }
                    else { EmptyView() }
                })
                content
                    .padding(.leading,4)
            }
            
            
        }
        .padding()
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.4)) {
                self.isChecked.toggle()
            }
        }
        
        
    }
}

struct CheckBox_Previews: PreviewProvider {
    
    static var previews: some View {
        KittenCheckbox(isChecked: .constant(true)) {
            Text("Hello")
        }
    }
}
