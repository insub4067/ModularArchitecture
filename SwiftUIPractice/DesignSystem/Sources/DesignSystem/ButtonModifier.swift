//
//  ButtonModifier.swift
//
//
//  Created by 김인섭 on 10/15/23.
//

import SwiftUI

public struct ButtonModifier: ViewModifier {
    
    public init() { }
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .semibold))
            .padding(.vertical)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .cornerRadius(5.0)
            .foregroundColor(.white)
    }
}
