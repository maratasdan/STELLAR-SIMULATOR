//
//  Home.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/25/26.
//

import SwiftUI

struct Home: View {
    
    @State private var selected = "1"
    
    var body: some View {
        NavigationStack {
            HStack {
                
                VStack {
                    
                    VStack {
                        if selected == "1" {
                            PHO_Map()
                            
                        } else {
                            HStack {
                                Text("2")
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    
                }
                
            }
        }
        
    }
}

#Preview {
    Home()
}
