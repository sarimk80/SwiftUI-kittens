import SwiftUI


public struct kittenButton: View {
    
    public var body: some View {
        VStack(spacing:8){
            Button {
                print("Hello")
            } label: {
                Text("PRIMARY")
            }
            .kittenButton()
            Button {
                print("Hello")
            } label: {
                Text("SUCCESS")
            }
            .kittenButton(buttonStatus: .success)
            
            Button {
                print("Hello")
            } label: {
                HStack{
                    Image(systemName: "house")
                    Text("WARNING")
                }
            }
            .kittenOutlineButton(buttonStatus: .warning)
            
            Button {
                print("Hello")
            } label: {
                Image(systemName: "star.fill")
            }
            .kittenOutlineButton(buttonStatus: .danger)
            
            Button {
                print("Hello")
            } label: {
                Text("BASIC")
            }
            .kittenTextButtom(buttonStatus: .basic)

        }
        
    }
    
}

public struct SimpleKittenButtonModifier : ViewModifier {
    
    var buttonStatus:ButtonStatus = ButtonStatus.primary
    
    public func body(content:Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .background(buttonStatusToColor(buttonStatus: buttonStatus))
            .cornerRadius(8)
    }
}

public struct SimpleKittenButtonOutlineBorderModofier : ViewModifier {
    
    var buttonStatus:ButtonStatus = ButtonStatus.primary
    
    public func body(content:Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundColor(buttonStatusToColor(buttonStatus: buttonStatus))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(buttonStatusToColor(buttonStatus: buttonStatus))
            )
            .background(buttonStatusToColor(buttonStatus: buttonStatus).opacity(0.1))
    }
}

public struct SimpleKittenButtonGhostModifier : ViewModifier {
    
    var buttonStatus:ButtonStatus = ButtonStatus.primary
    
    public func body(content:Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundColor(buttonStatusToColor(buttonStatus: buttonStatus))
            .padding()
    }
}


extension View {
    // Filled Button
    public func kittenButton(buttonStatus:ButtonStatus = ButtonStatus.primary) -> some View {
        modifier(SimpleKittenButtonModifier(buttonStatus: buttonStatus))
    }
    // Outline Button
    public func kittenOutlineButton(buttonStatus:ButtonStatus = ButtonStatus.primary) -> some View {
        modifier(SimpleKittenButtonOutlineBorderModofier(buttonStatus: buttonStatus))
    }
    
    // Text Buttom
    public func kittenTextButtom(buttonStatus:ButtonStatus = ButtonStatus.primary) -> some View {
        modifier(SimpleKittenButtonGhostModifier(buttonStatus: buttonStatus))
    }
}

struct PlainButton_Previews: PreviewProvider {
    
    static var previews: some View {
        kittenButton()
    }
}
