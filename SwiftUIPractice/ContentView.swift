//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/13/23.
//

import SwiftUI
struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel.build()
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text(viewModel.user?.login ?? "")
            Button("Get User and Register Bitcoin ") {
                viewModel.registerBitcoin()
            }
            
            Text(viewModel.asset?.assetType ?? "")
            Button("Registered Bitcoin") {
                viewModel.getResgisteredAsset()
            }
        }
    }
}

#Preview {
    ContentView()
}
