//
//  SwiftUIView.swift
//
//
//  Created by sarim khan on 22/06/2023.
//

import SwiftUI

public struct KittenListTileView<Title,Subtitle,Leading,Trailing>: View where Title : View , Subtitle : View, Leading : View, Trailing : View {
    
    @Binding private var isDisable:Bool
    @Binding private var isSelected:Bool
    let title : Title
    let subtitle : Subtitle?
    let leading : Leading?
    let trailing : Trailing?
    
    public  init(isDisable:Binding<Bool> = .constant(false),isSelected:Binding<Bool> = .constant(false), @ViewBuilder title: () -> Title, @ViewBuilder subtitle: () -> Subtitle? = { EmptyView() } ,
                 @ViewBuilder leading: () -> Leading? = { EmptyView() },
                 @ViewBuilder trailing: () -> Trailing? = { EmptyView() }
                 
    ) {
        self._isDisable  = isDisable
        self._isSelected = isSelected
        self.title = title()
        self.subtitle = subtitle()
        self.leading = leading()
        self.trailing = trailing()
    }
    
    public var body: some View {
        VStack{
            
            HStack(alignment:.top , spacing:10){
                leading
                VStack(alignment:.leading,spacing: 8){
                    title
                    subtitle
                        .lineLimit(1)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                Spacer()
                trailing
            }
            .customExtentionModifier(isDisable: isDisable, isSelected: isSelected)
            
        }
        
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
    
    public func KittenTabItem<V>(@ViewBuilder _ label: () -> V) -> some View where V : View {
        return HStack{
            Text("Hello")
        }
    }
}


struct ListTileView_Previews: PreviewProvider {
    
    static var previews: some View {
        KittenListTileView(isSelected: .constant(false),title: {
            Text("Hello title")
        },subtitle: {
            Text("Long text Long text Long text Long text Long text Long text Long text Long text")
        } ,leading: {
            Image(systemName: "shareplay")
                .renderingMode(.template)
                .symbolRenderingMode(.multicolor)
                .symbolVariant(.square)
        },trailing: {
            Text("Delete")
                .foregroundColor(.red)
        }
        )
        .padding()
        
    }
}
