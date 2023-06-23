//
//  SwiftUIView.swift
//  
//
//  Created by sarim khan on 22/06/2023.
//

import SwiftUI

public struct KittenListTileView: View {
    
    @Binding private var isDisable:Bool
    @Binding private var isSelected:Bool
    
    public  init(isDisable:Binding<Bool> = .constant(false),isSelected:Binding<Bool> = .constant(false)) {
        self._isDisable  = isDisable
        self._isSelected = isSelected
    }
    
    public var body: some View {
        HStack(alignment:.top , spacing:8){
            Image(systemName: "folder.fill")
            VStack(alignment:.leading){
                Text("Hello")
                Text("Long text")
                
            }
            Spacer()
            Image(systemName: "trash")
        }
        .disabled(isDisable)
        .padding()
        .background(isSelected ? .blue.opacity(0.3): .clear)

    }
}

struct ListTileView_Previews: PreviewProvider {
    
    static var previews: some View {
        List(0..<6,id:\.self){ index in
            KittenListTileView()
                .listRowInsets(EdgeInsets())
        }
        
        
    }
}
