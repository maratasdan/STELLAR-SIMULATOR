//
//  SwiftUIView.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/26/26.
//

internal import Combine
struct DryerPanel: Identifiable, Codable {
    
    var id: String { binid }
    var binid: String
    var hybrid: String
    var seedtype: String
    var mc: String
    var uppertemp: String
    var lowertemp: String
    var timer: String
    var blower: String
    
}

import SwiftUI

struct DR_Panel: View {
    
    @State private var binTimerColor: String = "#0041BA";
    
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var dryerpanel: [DryerPanel] = [
        DryerPanel(binid: "201", hybrid: "POLY", seedtype: "Corn", mc: "43.21", uppertemp: "31", lowertemp: "24", timer: "2026-06-30 14:10:12", blower: "1"),
        DryerPanel(binid: "202", hybrid: "POLY", seedtype: "Corn", mc: "43.21", uppertemp: "31", lowertemp: "24", timer: "2026-06-26 15:10:03", blower: "2"),
        DryerPanel(binid: "203", hybrid: "POLY", seedtype: "Corn", mc: "43.21", uppertemp: "31", lowertemp: "24", timer: "2026-06-30 12:10:04", blower: "2"),
        DryerPanel(binid: "204", hybrid: "POLY", seedtype: "Corn", mc: "43.21", uppertemp: "31", lowertemp: "24", timer: "2026-06-26 16:10:14", blower: "1"),
        DryerPanel(binid: "205", hybrid: "POLY", seedtype: "Corn", mc: "43.21", uppertemp: "31", lowertemp: "24", timer: "2026-06-26 14:10:24", blower: "1"),
        DryerPanel(binid: "206", hybrid: "POLY", seedtype: "Corn", mc: "43.21", uppertemp: "31", lowertemp: "24", timer: "2026-06-26 15:10:32", blower: "2")
    ]
    
    @State private var goToDryingDetails: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView {
                    HStack {
                        LazyVGrid(columns: columns) {
                            ForEach(dryerpanel) { item in
                                VStack {
                                    VStack {
                                        VStack {
                                            HStack {
                                                Image(systemName: "flame.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(Color.red)
                                                    .symbolEffect(.pulse)
                                                Text("\(item.binid)")
                                                    .font(.title)
                                                    .foregroundColor(Color(hex: "#0041BA"))
                                                    .bold()
                                                Spacer()
                                                if item.blower ==  "1" {
                                                    Image(systemName: "arrow.up.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                } else if item.blower == "2" {
                                                    Image(systemName: "arrow.down.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                }
                                                
                                            }
                                            .padding(.bottom, 10)
                                            HStack {
                                                Label("\(item.hybrid)", systemImage: "camera.macro.circle.fill")
                                                Spacer()
                                            }
                                            HStack {
                                                Label("\(item.seedtype)", systemImage: "leaf.circle.fill")
                                                Spacer()
                                            }
                                            HStack {
                                                HStack {
                                                    Label("\(item.uppertemp)°", systemImage: "arrow.up")
                                                    Label("\(item.lowertemp)°", systemImage: "arrow.down")
                                                }
                                                Spacer()
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    //                                                Label(, systemImage: "timer")
                                                    Text(remainingTime(for: item.timer))
                                                        .frame(width: 110, height: 30)
                                                        .bold()
                                                        .background(
                                                            Color(
                                                                hex: remainingTime(for: item.timer) == "Timers Up!"
                                                                ? "#f54254"
                                                                : "#0041BA"
                                                            )
                                                        )
                                                        .cornerRadius(10)
                                                        .foregroundStyle(Color.white)
                                                    Spacer()
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                            
                                            Spacer()
                                        }
                                        .padding(20)
                                        .background(
                                            Color(
                                                hex: remainingTime(for: item.timer) == "Timers Up!"
                                                ? "#ffedef"
                                                : "#ffffff"
                                            )
                                            .opacity(0.9)
                                        )
                                    }
                                    .border(Color.white, width: 2)
                                    .cornerRadius(20)
                                    .frame(maxWidth: .infinity)
                                    .padding(5)
                                }
                                .onTapGesture {
                                    goToDryingDetails = true
                                }
                            }
                        }
                    }
                    .padding(20)
                    Spacer()
                }
                
            }
            .frame(maxWidth: .infinity)
            .onReceive(timer) { value in
                currentTime = value
            }
            .navigationDestination(isPresented: $goToDryingDetails) {
                DR_PanelDetails()
            }
        }
    }
    
    func remainingTime(for timerString: String) -> String {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        guard let arrival = formatter.date(from: timerString) else {
            return "--:--:--"
        }

        let target = arrival.addingTimeInterval(60 * 60)
        let remaining = target.timeIntervalSince(currentTime)

        if remaining <= 0 {
            return "Timers Up!"
        }

        let hours = Int(remaining) / 3600
        let minutes = (Int(remaining) % 3600) / 60
        let seconds = Int(remaining) % 60

        return String(format: "%02d:%02d:%02d",
                      hours,
                      minutes,
                      seconds)
    }
}

#Preview {
    DR_Panel()
}
