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
    let suffixView:  Content?
    
    public init(input: Binding<String>,placeHolderText:String = "Input",@ViewBuilder  suffixView: () -> Content? = {EmptyView()}) {
        self._input = input
        self.placeHolderText = placeHolderText
        self.suffixView = suffixView()
    }
    
    public  var body: some View {
        HStack{
            
            TextField(text: $input, label: {
                Text("Email")
            })
            .onChange(of: input, perform: { value in
                print(value)
            })
            .KittenTextFiled {
                suffixView
            }

        }
        
    }
}

struct SimpleTextFiledModifier<SuffixView:View> : ViewModifier {
    
    let suffixView:() -> SuffixView
    
    init(suffixView: @escaping () -> SuffixView) {
        self.suffixView = suffixView
    }
    
    func body(content: Content) -> some View {
        HStack{
            content
            suffixView()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2)))
        .overlay(
               RoundedRectangle(cornerRadius: 5)
                   .stroke(Color.gray.opacity(0.5), lineWidth: 1)
           )
       
    }
}

extension View {
   public func KittenTextFiled(@ViewBuilder suffixView: @escaping () -> some View) -> some View {
        modifier(SimpleTextFiledModifier(suffixView: suffixView))
    }
}

struct KittenInput_Preview : PreviewProvider {
    
    static var previews: some View {
        
        TextField(text: .constant("")) {
            Text("Email")
        }
        .KittenTextFiled {
            Image(systemName: "square.and.arrow.up.fill")
                .onTapGesture {
                    print("suffix Tap")
                }
        }
        .padding()

    }
}
