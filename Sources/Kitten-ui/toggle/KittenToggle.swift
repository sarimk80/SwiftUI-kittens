//
//  SwiftUIView.swift
//  
//
//  Created by sarim khan on 14/06/2023.
//

import SwiftUI

public struct KittenToggle: View {
    
    @Binding var isChecked:Bool
    
 public var body: some View {
     ZStack(alignment: .leading){
            
            ToggleCapsule()
            
         if(isChecked) {
             Circle()
                 .fill(.white)
                 .frame(width: 35,height: 35)
                 .padding(.leading,2)
                 .padding(.trailing,2)
                 .transition(.slide)
         }
         else{
             
             Circle()
                 .fill(.white)
                 .frame(width: 35,height: 35)
                 .padding(.leading,2)
                 .padding(.trailing,2)
                 .transition(.slide)
             
         }
            
        }
     .onTapGesture {
         withAnimation(.easeInOut(duration: 0.3)) {
             self.isChecked.toggle()
         }
     }
    }
}

struct ToggleCapsule: View {
    var body: some View {
        ZStack{
            Capsule()
                .stroke(.blue, lineWidth: 2)
                .frame(width: 70,height: 40)
            
            Capsule()
                .fill(.blue.opacity(0.3))
                .frame(width: 70,height: 40)
        }
    }
}

struct KittenToggle_Previews: PreviewProvider {
    
    static var previews: some View {
        KittenToggle(isChecked: .constant(false))
    }
}
