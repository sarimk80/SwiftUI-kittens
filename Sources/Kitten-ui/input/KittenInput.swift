//
//  SwiftUIView.swift
//
//
//  Created by sarim khan on 15/06/2023.
//

import SwiftUI

public struct KittenInput<Content:View,Label:View>: View {
    @Binding private var input:String
    private var placeHolderText:String
    let perfixView:  Content?
    let label : Label
    
    public init(input: Binding<String>,placeHolderText:String = "Input",@ViewBuilder label:() -> Label ,@ViewBuilder  perfixView: () -> Content? = {EmptyView()}) {
        self._input = input
        self.placeHolderText = placeHolderText
        self.perfixView = perfixView()
        self.label = label()
    }
    
    public  var body: some View {
        HStack{
            
            TextField(text: $input, label: {
                label
            })
            .onChange(of: input, perform: { value in
                print(value)
            })
            .SimpleTextFiled {
                perfixView
            }

        }
        
    }
}

struct SimpleTextFiledModifier<PrefixView:View> : ViewModifier {
    
    let prefixView:() -> PrefixView
    
    init(prefixView: @escaping () -> PrefixView) {
        self.prefixView = prefixView
    }
    
    func body(content: Content) -> some View {
        HStack{
            
            prefixView()
            
            content
                
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2)))
        .border(Color.gray.opacity(0.5))
        
    }
}

extension View {
    func SimpleTextFiled(@ViewBuilder prefixView: @escaping () -> some View) -> some View {
        modifier(SimpleTextFiledModifier(prefixView: prefixView))
    }
}

struct KittenInput_Preview : PreviewProvider {
    
    static var previews: some View {
        KittenInput(input: .constant(""),placeHolderText: "Email") {
            Text("Input")
        } perfixView: {
            Text("hello")
        }

    }
}
