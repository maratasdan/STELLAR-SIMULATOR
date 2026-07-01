//
//  ContentView.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/25/26.
//

import SwiftUI
import AudioToolbox

struct PHO_Map: View {
    
    
    @State private var stations: [Station] = [
        Station(name: "Truckers", x: 230, y: 630, width: 330, height: 140, line: 1, completed: true),
        Station(name: "Scale House", x: 185, y: 400, width: 240, height: 180, line: 0, completed: false),
        Station(name: "Sorting Facility", x: 590, y: 545, width: 330, height: 300, line: 2, completed: false),
        Station(name: "Dryer", x: 415, y: 150, width: 695, height: 260, line: 2, completed: false),
        Station(name: "Shelling", x: 955, y: 100, width: 300, height: 160, line: 2, completed: false),
        Station(name: "Conditioning", x: 955, y: 300, width: 300, height: 160, line: 2, completed: false),
        Station(name: "Warehouse", x: 955, y: 570, width: 300, height: 250, line: 2, completed: false)
    ]
    
    @State private var goToTrHome: Bool = false
    @State private var animate = true
    @State private var waitingtrucks: [WatingTrucks] = [
        WatingTrucks(id: UUID().uuidString, type: "ELF", dateArrived: "06/25/2026 10:00:00"),
        WatingTrucks(id: UUID().uuidString, type: "TRUCK", dateArrived: "06/25/2026 08:00:43"),
        WatingTrucks(id: UUID().uuidString, type: "WIGO", dateArrived: "06/25/2026 16:50:32")
    ]
    
    @State private var showScaleUser: Bool = false
    @State private var showDryingPanel: Bool = false
    
    @State private var connections: [Connection] = [
        
//      Truckers to Scaler
        Connection(
            from: CGPoint(x: 180, y: 490),
            to: CGPoint(x: 180, y: 560),
            completed: false
        ),
        
//      Scale to Sorter
        Connection(
            from: CGPoint(x: 425, y: 450),
            to: CGPoint(x: 305, y: 450),
            completed: false
        ),
        
//      Line 1
        Connection(
            from: CGPoint(x: 525, y: 280),
            to: CGPoint(x: 525, y: 395),
            completed: false
        ),
        
//      Line 2
        Connection(
            from: CGPoint(x: 625, y: 280),
            to: CGPoint(x: 625, y: 395),
            completed: false
        ),
        
//      Line 3
        Connection(
            from: CGPoint(x: 760, y: 110),
            to: CGPoint(x: 805, y: 110),
            completed: false
        )
    ]
    
    
    
    @State private var openWaitingTrucks: Bool = false
    @State private var scale: CGFloat = 1.0
    
    @State private var dryerLine: String = "2"
    @State private var status: String = "1"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack {
                    ZStack {
                        Canvas { context, size in
                            for connection in connections {
                                var path = Path()
                                
                                path.move(to: connection.from)
                                path.addLine(to: connection.to)
                                
                                context.stroke(
                                    path,
                                    with: .color(
                                        connection.completed
                                        ? .red
                                        : .white
                                    ),
                                    lineWidth: 5
                                )
                            }
                        }
                        
                        ForEach(stations) { station in
                            StationView(station: station)
                                .position(
                                    x: station.x,
                                    y: station.y
                                )
                            
                                .onLongPressGesture {
                                    if station.name == "Truckers" {
                                        goToTrHome = true
                                        haptic()
                                    } else if station.name == "Dryer" {
                                        showDryingPanel = true
                                    }
                                }
                                .onTapGesture {
                                    if station.name == "Truckers" {
                                        openWaitingTrucks = true
                                        haptic()
                                    } else if station.name == "Scale House" {
                                        showScaleUser = true
                                    }
                                }
                        }
                    }
                }
            }
            .sheet(isPresented: $showScaleUser) {
                List {
                    VStack(alignment: .center) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 10)
                            .foregroundStyle(Color(hex: "#0041BA"))
                            .symbolEffect(.bounce.up.byLayer, options: .repeat(.periodic(delay: 3.0)))
                        
                        Text("Dan Bulala Maratas")
                            .font(.title2)
                        Text("(Scale Operator)")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.clear)
                    Section("") {
                        Label("Report this user", systemImage: "questionmark.circle.fill")
                    }
                }
                .presentationDetents([.medium])
            }
            
            .sheet(isPresented: $openWaitingTrucks) {

                NavigationStack {

                    List {
                        VStack {
                            Image(systemName: "truck.box.badge.clock")
                                .resizable()
                                .frame(width: 130, height: 100)
                                .foregroundStyle(Color(hex: "#0041BA"))
                                .symbolEffect(.bounce.up.byLayer, options: .repeat(.periodic(delay: 3.0)))
                        }
                        .listRowBackground(Color.clear)
                        .frame(maxWidth: .infinity)

                        Section {
                            ForEach(waitingtrucks) { item in
                                HStack {
                                    Image(systemName: "truck.box")
                                        .font(.title3)
                                        .foregroundStyle(Color(hex: "#0041BA"))
                                    Text("\(item.type)")
                                }
                            }
                        }
                    }
                    .toolbar {

                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Open Panel") {
                                openWaitingTrucks = false
                                goToTrHome = true
                            }
                            .buttonStyle(.glassProminent)
                            .tint(Color(hex: "#0041BA"))
                        }

                        ToolbarItem(placement: .principal) {
                            Text("Waiting Trucks")
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $goToTrHome) {
                TR_Home()
            }
            .navigationDestination(isPresented: $showDryingPanel) {
                DR_Panel()
            }
        }
        
        .onAppear() {
            if dryerLine == "1" {
                connections[2].completed.toggle()
            } else if dryerLine == "2" {
                connections[3].completed.toggle()
            }
            
        }
    }
    
    func haptic() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    func playClickSound() {
        AudioServicesPlaySystemSound(1104)
    }
    
}

#Preview {
    PHO_Map()
}
