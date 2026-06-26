//
//  TR_Home.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/25/26.
//

import SwiftUI
internal import Combine

struct WatingTrucks: Codable, Identifiable {
    var id: String
    var type: String
    var dateArrived: String
}

struct TR_Home: View {
     
    @State private var currentDate = Date()
    
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    @State private var waitingtime: [WatingTrucks] = [
        WatingTrucks(id: UUID().uuidString, type: "ELF", dateArrived: "06/25/2026 10:00:00"),
        WatingTrucks(id: UUID().uuidString, type: "TRUCK", dateArrived: "06/25/2026 08:00:43"),
        WatingTrucks(id: UUID().uuidString, type: "WIGO", dateArrived: "06/25/2026 16:50:32")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var showMenu = false
    
    @State private var currentType: String = ""
    @State private var currentDateTime: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        
                        ForEach(waitingtime) { item in
                            
                            VStack {
                                VStack {
                                    HStack(alignment: .top) {
                                        Image(systemName: "truck.box.badge.clock")
                                            .foregroundStyle(Color(hex: "#0041BA"))
                                            .font(.title)
                                        VStack {
                                            HStack {
                                                Text("\(item.type)")
                                                    .font(.title2)
                                                Spacer()
                                            }
                                            HStack {
                                                Image(systemName: "arrow.down")
                                                Text(item.dateArrived)
                                                Spacer()
                                            }
                                            HStack {
                                                Image(systemName: "clock")
                                                Text(waitingTime(from: item.dateArrived))
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                            .background(Color(hex: "#ffffff").opacity(0.7))
                            .cornerRadius(10)
                            .onTapGesture {
                                
                                currentType = item.type
                                currentDateTime = item.dateArrived
                                
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    showMenu.toggle()
                                }
                            }
                            
                        }
                    }
                    .padding()
                }
                
                if showMenu {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showMenu = false
                            }
                        }
                }
                
                VStack(alignment: .leading) {
                    List {
                        VStack {
                            Image(systemName: "truck.box.badge.clock")
                                .resizable()
                                .frame(width: 130, height: 100)
                                .foregroundStyle(Color(hex: "#0041BA"))
                                .symbolEffect(.bounce.up.byLayer, options: .repeat(.periodic(delay: 3.0)))
                            Text("\(currentType)")
                                .font(.title2)
                        }
                        .listRowBackground(Color.clear)
                        .frame(maxWidth: .infinity)
                        
                        Section("") {
                            VStack(alignment: .leading) {
                                HStack(alignment: .top) {
                                    Image(systemName: "calendar.circle")
                                    VStack(alignment: .leading) {
                                        Text("\(currentDateTime)")
                                        Text("Date of arrival")
                                            .font(.caption)
                                    }
                                }
                            }
                            VStack(alignment: .leading) {
                                HStack(alignment: .top) {
                                    Image(systemName: "clock.badge")
                                    VStack(alignment: .leading) {
                                        Text(waitingTime(from: currentDateTime))
                                        Text("Waiting time")
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                        
                        Section("") {
                            VStack(alignment: .leading) {
                                HStack(alignment: .top) {
                                    Image(systemName: "questionmark.circle")
                                    VStack(alignment: .leading) {
                                        Text("Report this truck")
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: 300)
                .background(.background)
                .offset(x: showMenu ? 0 : -300)
                .animation(.easeInOut(duration: 0.3), value: showMenu)
            }
            .onReceive(timer) { value in
                currentDate = value
            }
        }
    }
    
    func waitingTime(from dateString: String) -> String {

        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm:ss"

        guard let arrivalDate = formatter.date(from: dateString) else {
            return "--:--:--"
        }

        let seconds = Int(currentDate.timeIntervalSince(arrivalDate))

        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let secs = seconds % 60

        return String(
            format: "%02d:%02d:%02d",
            hours,
            minutes,
            secs
        )
    }
}

#Preview {
    TR_Home()
}
