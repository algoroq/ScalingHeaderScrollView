//
//  ContentView.swift
//  Example
//
//  Created by Alisa Mylnikova on 16/09/2021.
//  Copyright © 2019 Exyte. All rights reserved.
//

import SwiftUI
import ScalingHeaderScrollView

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var currentView: AnyView? = nil
    
    var body: some View {
        if let currentViewValue = currentView {
            ZStack(alignment: .topLeading) {
                currentViewValue
                
                Button("", action: {
                    currentView = nil
                })
                .buttonStyle(CircleButtonStyle(imageName: "arrow.backward"))
                .shadow(radius: 4)
                .padding(.leading, 16)
            }
        } else {
            List {
                Section(header: Text("Simple Examples")) {
                    ExampleView(currentView: $currentView, name: "Simple Scaling Header") {
                        SimpleScalingHeader()
                    }
                    
                    ExampleView(currentView: $currentView, name: "Map Scaling Header") {
                        MapScalingHeader()
                    }
                    
                    ExampleView(currentView: $currentView, name: "Color Scaling Header") {
                        ColorScalingHeader()
                    }
                    
                    ExampleView(currentView: $currentView, name: "Request Scaling Header") {
                        RequestScalingHeader()
                    }
                    
                    ExampleView(currentView: $currentView, name: "Tab Scaling Header") {
                        TabScalingHeader()
                    }
                }
                
                Section(header: Text("Beautiful Examples")) {
                    ExampleView(currentView: $currentView, name: "Profile Screen") {
                        ProfileScreen()
                    }
                    
                    ExampleView(currentView: $currentView, name: "Booking Screen") {
                        BookingScreen()
                    }
                    
                    ExampleView(currentView: $currentView, name: "Banking Screen") {
                        BankingScreen()
                    }
                }
                
                Section(header: Text("Algoroq Examples")) {
                    ExampleView(currentView: $currentView, name: "Positioned Scaling Header") {
                        PositionedScalingHeader()
                    }
                }
            }
            .listStyle(.grouped)
        }
    }
}

struct ExampleView<Content: View>: View {
    
    @Binding var currentView: AnyView?
    var name: String
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        Button(name) {
            currentView = AnyView(content())
        }
    }
}
