//
//  TextFieldModifier.swift
//
//
//  Created by 김인섭 on 10/15/23.
//

import SwiftUI

public struct TextFieldModifier: ViewModifier {
    
    public init() { }
    
    public func body(content: Content) -> some View {
        content
            .frame(width: 200)
            .padding(4)
            .background(
                Color.gray
                    .opacity(0.2)
                    .cornerRadius(5.0)
            )
    }
}
