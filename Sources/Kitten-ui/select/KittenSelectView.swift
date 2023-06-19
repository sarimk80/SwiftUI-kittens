//
//  SwiftUIView.swift
//
//
//  Created by sarim khan on 16/06/2023.
//

import SwiftUI

public struct KittenSelectView: View {
    
    let items:[String]
    @State private var isShowList:Bool = false
    @State private var selectedOption:String = "Select Option"
    @Binding public var selected:String
    
    public init(items: [String],selected:Binding<String>) {
        self.items = items
        self._selected = selected
    }
    
  public  var body: some View {
        VStack{
            HStack(spacing:8){
                
                Text(selectedOption)
                Spacer()
                Image(systemName: "chevron.down")

                
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.isShowList.toggle()
                }
            }
            .padding()
            .frame(width: .infinity)
            .background(Color.gray.opacity(0.15))
            .border(Color.gray.opacity(0.3), width: 1)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            
            
            
            
           if (isShowList) { List(items, id: \.self){ value in
                
                HStack{
                    Text(value)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.gray.opacity(0.05))
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .onTapGesture {
                    self.selectedOption = value
                    self.isShowList = false
                    self.selected = value
                }
                
                
                
                
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .background(Color.gray.opacity(0.05))
            .border(Color.gray.opacity(0.3), width: 1)
            .frame(width: .infinity,height: UIScreen.main.bounds.height * 0.25)
            .transition(.opacity.animation(.easeInOut(duration:0.1)))
            //.transition(.slide)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            
                
           }else{
               EmptyView()
           }
        }
        
        
        
    }
}

struct KittenSelectView_Previews: PreviewProvider {
    
    static var previews: some View {
        KittenSelectView(
            items: ["Option-1",
                    "Option-2",
                    "Option-3",
                    "Option-4",
                    "Option-5"],
            selected: .constant("")
        )
        .padding()
    }
}
