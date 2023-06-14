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
