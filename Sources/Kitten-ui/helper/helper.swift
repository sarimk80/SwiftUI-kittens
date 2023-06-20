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
    case small
    case medium
    case large
}

public func viewSizeStatusToInt(viewSizeStatus:ViewSizeStatus) -> Double {
    switch viewSizeStatus {
        
    case .small:
        return 20.0
    case .medium:
        return 30.0
    case .large:
        return 50.0
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
