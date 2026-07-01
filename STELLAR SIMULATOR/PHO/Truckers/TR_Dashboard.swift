//
//  TR_Dashboard.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/26/26.
//

import SwiftUI

struct TR_Dashboard: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Truckers Dashboard")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .bold()
                        Spacer()
                    }
                    .padding(.bottom, 30)
                    
                    HStack {
                        Text("Montly Received")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    
                    HStack(alignment: .top) {
                        LazyVGrid(columns: columns) {
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Total Received kg")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("0")
                                            .font(.system(size: 50, design: .monospaced))
                                        Spacer()
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity)
                            }
                            .background(Color.white.opacity(0.75))
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Corn")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("0")
                                            .font(.system(size: 50, design: .monospaced))
                                        Spacer()
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity)
                            }
                            .background(Color.white.opacity(0.75))
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Rice")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("0")
                                            .font(.system(size: 50, design: .monospaced))
                                        Spacer()
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity)
                            }
                            .background(Color.white.opacity(0.75))
                            .cornerRadius(20)
                            
                        }
                    }
                    .padding(.bottom, 30)
                    
                    HStack {
                        Text("Weekly Received")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    
                    HStack(alignment: .top) {
                        LazyVGrid(columns: columns) {
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Total Received kg")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("0")
                                            .font(.system(size: 50, design: .monospaced))
                                        Spacer()
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity)
                            }
                            .background(Color.white.opacity(0.75))
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Corn")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("0")
                                            .font(.system(size: 50, design: .monospaced))
                                        Spacer()
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity)
                            }
                            .background(Color.white.opacity(0.75))
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Rice")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("0")
                                            .font(.system(size: 50, design: .monospaced))
                                        Spacer()
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity)
                            }
                            .background(Color.white.opacity(0.75))
                            .cornerRadius(20)
                            
                        }
                    }
                    .padding(.bottom, 1000)
                    
                    HStack {
                        Text("Ongoing Trucks")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    
                    HStack {
                        Text("Hello")
                    }
                    .padding(.bottom, )
                    
                    Spacer()
                    
                }.padding(20)
                
            }
        }
    }
}

#Preview {
    TR_Dashboard()
}
