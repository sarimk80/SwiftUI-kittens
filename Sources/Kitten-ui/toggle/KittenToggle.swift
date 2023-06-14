//
//  SwiftUIView.swift
//
//
//  Created by sarim khan on 14/06/2023.
//

import SwiftUI

public struct KittenToggle<Content:View>: View {
    
    @Binding var isChecked:Bool
    @State private var circleAlignmant:Alignment = Alignment.leading
    public var buttonStatus:ButtonStatus = ButtonStatus.primary
    let content: Content
    
    public init(isChecked: Binding<Bool>,buttonStatus: ButtonStatus = ButtonStatus.primary,@ViewBuilder  content: () -> Content) {
        self._isChecked = isChecked
        self.buttonStatus = buttonStatus
        self.content = content()
    }
    
    public var body: some View {
        HStack{
            ZStack(alignment: circleAlignmant){
                
                ToggleCapsule(isChecked: $isChecked,buttonStatus: buttonStatus)
                
                ToggleCircle(isChecked: $isChecked,buttonStatus: buttonStatus)
                
            }
            .onTapGesture {
                withAnimation(.snappy(extraBounce: 0.25)) {
                    self.isChecked.toggle()
                    if(self.isChecked){
                        circleAlignmant = Alignment.trailing
                    }else{
                        circleAlignmant = Alignment.leading
                    }
                }
            }
            content
                .padding(.leading,4)
        }
        
    }
}

struct ToggleCircle: View {
    @Binding var isChecked:Bool
    var buttonStatus:ButtonStatus = ButtonStatus.primary
    var body: some View {
        ZStack{
            Circle()
                .fill(.white)
                .frame(width: 35,height: 35)
                .padding(.leading,2)
                .padding(.trailing,2)
            
            if(isChecked) {
                Image(systemName: "checkmark")
                    .fontWeight(.heavy)
                    .foregroundColor(buttonStatusToColor(buttonStatus: buttonStatus))
                    .transition(.opacity.animation(.easeInOut(duration:0.4)))
            }else{
                EmptyView()
            }
        }
    }
}

struct ToggleCapsule: View {
    @Binding var isChecked:Bool
    var buttonStatus:ButtonStatus = ButtonStatus.primary
    var body: some View {
        ZStack{
            Capsule()
                .stroke(buttonStatusToColor(buttonStatus: buttonStatus), lineWidth: 2)
                .frame(width: 70,height: 40)
            
            Capsule()
                .fill(isChecked ? buttonStatusToColor(buttonStatus: buttonStatus) : buttonStatusToColor(buttonStatus: buttonStatus).opacity(0.3))
                .frame(width: 70,height: 40)
        }
    }
}

struct KittenToggle_Previews: PreviewProvider {
    
    static var previews: some View {
        KittenToggle(isChecked: .constant(false)){
            Text("Toggle")
        }
    }
}
