//
//  File.swift
//  
//
//  Created by sarim khan on 12/06/2023.
//

import Foundation
import SwiftUI


public enum ButtonStatus {
    case primary
    case info
    case warning
    case danger
    case basic
    case success
    
}

public enum ViewSizeStatus {
    case extrsSmall
    case small
    case medium
    case large
    case extraLarge
    case doubleExtraLarge
}

public func viewSizeStatusToInt(viewSizeStatus:ViewSizeStatus) -> Double {
    switch viewSizeStatus {
    
    case .extrsSmall:
        return 20
    case .small:
        return 40.0
    case .medium:
        return 60.0
    case .large:
        return 80.0
    case .extraLarge:
        return 100
    case .doubleExtraLarge:
        return 120
    }
}

public func sizeStatusToFont(viewSizeStatus:ViewSizeStatus) -> Font {
    
    switch viewSizeStatus {
    case .extrsSmall:
        return .caption2
    case .small:
        return .caption
    case .medium:
        return .subheadline
    case .large:
        return .body
    case .extraLarge:
        return .title3
    case .doubleExtraLarge:
        return .title
    }
}

public func buttonStatusToColor(buttonStatus:ButtonStatus) -> Color {
    switch buttonStatus{
        
    case .primary:
       return Color.primary
    case .info:
        return Color.info
    case .warning:
        return Color.warning
    case .danger:
        return Color.danger
    case .basic:
        return Color.basic
    case .success:
        return Color.success
    }
    
}
