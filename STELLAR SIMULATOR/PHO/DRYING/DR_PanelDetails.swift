//
//  DR_PanelDetails.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/26/26.
//

import SwiftUI
import WebKit

struct DryingData: Codable, Identifiable {
    var id: String { noh }
    var noh: String
    var date: String
    var time: String
    var top: String
    var bot: String
    var mc: String
    var remarks: String
}

struct DR_PanelDetails: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]
    
    @State private var showAddData: Bool = false
    
    @State private var noh: String = ""
    
    @State private var dryingdata: [DryingData] = [
        DryingData(noh: "01:00:00", date: "Wed Mar 18", time: "15:31:11", top: "32", bot: "25", mc: "13.5", remarks: "Normal"),
        DryingData(noh: "02:00:00", date: "Wed Mar 18", time: "16:31:11", top: "33", bot: "26", mc: "13.3", remarks: "Normal"),
        DryingData(noh: "03:00:00", date: "Wed Mar 18", time: "17:31:11", top: "34", bot: "27", mc: "13.1", remarks: "Normal"),
        DryingData(noh: "04:00:00", date: "Wed Mar 18", time: "18:31:11", top: "35", bot: "28", mc: "12.9", remarks: "Normal"),
        DryingData(noh: "05:00:00", date: "Wed Mar 18", time: "19:31:11", top: "36", bot: "29", mc: "12.8", remarks: "Good"),
        DryingData(noh: "06:00:00", date: "Wed Mar 18", time: "20:31:11", top: "37", bot: "30", mc: "12.6", remarks: "Good"),
        DryingData(noh: "07:00:00", date: "Wed Mar 18", time: "21:31:11", top: "38", bot: "31", mc: "12.5", remarks: "Good"),
        DryingData(noh: "08:00:00", date: "Wed Mar 18", time: "22:31:11", top: "39", bot: "32", mc: "12.4", remarks: "Normal"),
        DryingData(noh: "09:00:00", date: "Wed Mar 18", time: "23:31:11", top: "40", bot: "33", mc: "12.2", remarks: "Normal"),
        DryingData(noh: "10:00:00", date: "Thu Mar 19", time: "00:31:11", top: "41", bot: "34", mc: "12.0", remarks: "Normal"),
        DryingData(noh: "11:00:00", date: "Thu Mar 19", time: "01:31:11", top: "42", bot: "35", mc: "11.9", remarks: "Stable"),
        DryingData(noh: "12:00:00", date: "Thu Mar 19", time: "02:31:11", top: "43", bot: "36", mc: "11.8", remarks: "Stable"),
        DryingData(noh: "13:00:00", date: "Thu Mar 19", time: "03:31:11", top: "44", bot: "37", mc: "11.7", remarks: "Stable"),
        DryingData(noh: "14:00:00", date: "Thu Mar 19", time: "04:31:11", top: "45", bot: "38", mc: "11.6", remarks: "Stable"),
        DryingData(noh: "15:00:00", date: "Thu Mar 19", time: "05:31:11", top: "46", bot: "39", mc: "11.5", remarks: "Good"),
        DryingData(noh: "16:00:00", date: "Thu Mar 19", time: "06:31:11", top: "47", bot: "40", mc: "11.4", remarks: "Good"),
        DryingData(noh: "17:00:00", date: "Thu Mar 19", time: "07:31:11", top: "48", bot: "41", mc: "11.3", remarks: "Good"),
        DryingData(noh: "18:00:00", date: "Thu Mar 19", time: "08:31:11", top: "49", bot: "42", mc: "11.2", remarks: "Normal"),
        DryingData(noh: "19:00:00", date: "Thu Mar 19", time: "09:31:11", top: "50", bot: "43", mc: "11.1", remarks: "Normal"),
        DryingData(noh: "20:00:00", date: "Thu Mar 19", time: "10:31:11", top: "51", bot: "44", mc: "11.0", remarks: "Normal"),
        DryingData(noh: "21:00:00", date: "Thu Mar 19", time: "11:31:11", top: "52", bot: "45", mc: "10.9", remarks: "Monitor"),
        DryingData(noh: "22:00:00", date: "Thu Mar 19", time: "12:31:11", top: "53", bot: "46", mc: "10.8", remarks: "Monitor"),
        DryingData(noh: "23:00:00", date: "Thu Mar 19", time: "13:31:11", top: "54", bot: "47", mc: "10.7", remarks: "Monitor"),
        DryingData(noh: "24:00:00", date: "Thu Mar 19", time: "14:31:11", top: "55", bot: "48", mc: "10.6", remarks: "Monitor"),
        DryingData(noh: "25:00:00", date: "Thu Mar 19", time: "15:31:11", top: "56", bot: "49", mc: "10.5", remarks: "Done"),
        DryingData(noh: "26:00:00", date: "Thu Mar 19", time: "16:31:11", top: "57", bot: "50", mc: "10.4", remarks: "Done"),
        DryingData(noh: "27:00:00", date: "Thu Mar 19", time: "17:31:11", top: "58", bot: "51", mc: "10.3", remarks: "Done"),
        DryingData(noh: "28:00:00", date: "Thu Mar 19", time: "18:31:11", top: "59", bot: "52", mc: "10.2", remarks: "Done"),
        DryingData(noh: "29:00:00", date: "Thu Mar 19", time: "19:31:11", top: "60", bot: "53", mc: "10.1", remarks: "Done"),
        DryingData(noh: "30:00:00", date: "Thu Mar 19", time: "20:31:11", top: "61", bot: "54", mc: "10.0", remarks: "Completed")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                }
                .padding(20)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // Back action
                    } label: {
                        Label("Back", systemImage: "chevron.left")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Label("Back", systemImage: "list.bullet")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        // Back action
                        Button(action: {
                            showAddData = true
                        }) {
                            Label("Add Data", systemImage: "plus")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Label("Reversal", systemImage: "arrow.trianglehead.2.counterclockwise")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Label("Downtime", systemImage: "x.circle")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Label("Shut Off", systemImage: "power.circle")
                        }
                        
                    } label: {
                        Label("Back", systemImage: "plus")
                    }
                }
            }
        }
        .navigationTitle("Panel Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        .sheet(isPresented: $showAddData) {
            NavigationStack {
                List {
                    Text("Add Monitoring Data")
                        .font(.title2)
                        .listRowBackground(Color.clear)
                    Section {
                        VStack(alignment: .leading) {
                            Text("NOH")
                            TextField("10:21:32", text: $noh)
                                .textFieldStyle(.automatic)
                                .disabled(true)
                        }
                        VStack(alignment: .leading) {
                            Text("Date")
                            TextField("06/30/2026, 11:21:06 AM", text: $noh)
                                .textFieldStyle(.automatic)
                        }
                        VStack(alignment: .leading) {
                            Text("Top Temperature")
                            TextField("43", text: $noh)
                                .textFieldStyle(.automatic)
                        }
                        VStack(alignment: .leading) {
                            Text("Bot Temperature")
                            TextField("43", text: $noh)
                                .textFieldStyle(.automatic)
                        }
                        VStack(alignment: .leading) {
                            Text("Moisture Content")
                            TextField("43", text: $noh)
                                .textFieldStyle(.automatic)
                        }
                        VStack(alignment: .leading) {
                            Text("Moisture Content")
                            TextField("43", text: $noh)
                                .textFieldStyle(.automatic)
                        }
                    }
                    .toolbar {

//                        ToolbarItem(placement: .topBarTrailing) {
//                            Button("Open Panel") {
//                            }
//                            .buttonStyle(.glassProminent)
//                            .tint(Color(hex: "#0041BA"))
//                        }

//                        ToolbarItem(placement: .principal) {
//                            Text("Waiting Trucks")
//                                .font(.headline)
//                        }
                    }
                }
                
                
            }
        }
        
    }
}


#Preview {
    DR_PanelDetails()
}
