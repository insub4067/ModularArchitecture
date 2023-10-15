//
//  TitleModifier.swift
//  
//
//  Created by 김인섭 on 10/15/23.
//

import SwiftUI

public struct TitleModifier: ViewModifier {

    public init() { }
    
    public func body(content: Content) -> some View {
        content
            .font(.title2)
    }
}
