//
//  PositionedScalingHeader.swift
//  Example
//
//  Created by Marián Trpkoš on 24.03.2024.
//  Copyright © 2024 Exyte. All rights reserved.
//

import SwiftUI
import ScalingHeaderScrollView

struct PositionedScalingHeader: View {
    @State private var showBottomSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            customToolbar
            
            ScalingHeaderScrollView(header: {
                ZStack {
                    Color.blue
                    Text("Header")
                }
                .frame(height: 200)
            }, content: {
                VStack {
                    Text("HELLO TAB VIEW")
                        .padding(.all, 40)
                    
                    Button {
                        showBottomSheet.toggle()
                    } label: {
                        Text("Open sheet")
                    }
                    
                    Spacer()
                        .frame(height: 6000)
                }
                .frame(width: .infinity)
                .background(.red)
                .sheet(isPresented: $showBottomSheet) {
                    Text("Hello from bottom sheet")
                }
            })
            .height(min: 120, max: 200)
            .allowsHeaderCollapse()
        }
    }
    
    var customToolbar: some View {
        HStack(alignment: .center) {
            Text("Custom toolbar")
        }
        .frame(height: 60)
        .background(Color.gray)
    }
}
