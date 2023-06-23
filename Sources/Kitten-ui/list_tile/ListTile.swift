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
        HStack(alignment:.top , spacing:10){
            Image(systemName: "folder.fill")
            VStack(alignment:.leading){
                Text("Hello")
                Text("Long text")
                
            }
            Spacer()
            Image(systemName: "trash")
        }
        .customExtentionModifier(isDisable: isDisable, isSelected: isSelected)
        

    }
}


struct customModifier: ViewModifier {
    
    let isDisable:Bool
    let isSelected:Bool
    
    
    func body(content: Content) -> some View {
        content
            .disabled(isDisable)
            .padding()
            .background(isSelected ? .blue.opacity(0.2): .clear)
            .clipShape(
                .rect(
                    topLeadingRadius: 8,
                    bottomLeadingRadius: 8,
                    bottomTrailingRadius: 8,
                    topTrailingRadius: 8
                )
            )
            .overlay(alignment:.leading) {
                Rectangle()
                    .fill(.blue)
                    .frame(width: isSelected ? 8 : 0)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 8,
                            bottomLeadingRadius: 8,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 0
                        )
                    )
            }
    }
}

extension View {
    func customExtentionModifier(isDisable:Bool,isSelected:Bool) -> some View {
       modifier(customModifier(isDisable: isDisable, isSelected: isSelected))
    }
}

struct ListTileView_Previews: PreviewProvider {
    
    static var previews: some View {
        KittenListTileView(isSelected: .constant(false))
            .padding()
        
    }
}
