//
//  ContentView.swift
//  SampleLeeoSettingApp
//
//  Created by hyunho lee on 2022/06/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAirplainModeOn: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        profileCell()
                    }
                }
                
                Section {
                    toggleCell(imageName: "airplane",
                               iconColor: .orange,
                               cellTitle: "에어플레인 모드",
                               isAirplainModeOn: $isAirplainModeOn)
                    
                    navigationLinkCell(imageName: "wifi",
                              iconColor: .blue,
                              cellTitle: "Wi-Fi",
                    subTitle: "SK_WiFiGIGAD9BC_5G") {
                        Text("셀룰러 화면2")
                    }
                    
                    navigationLinkCell(imageName: "bolt",
                                iconColor: .blue,
                                cellTitle: "Bluetooth",
                                subTitle: "켬") {
                        Text("Bluetooth 화면")
                    }
                    
                    navigationLinkCell(imageName: "antenna.radiowaves.left.and.right",
                              iconColor: .green,
                              cellTitle: "셀룰러") {
                        Text("셀룰러 화면2")
                    }
                }
                
                Section {
                    navigationLinkCell(imageName: "hourglass",
                              iconColor: .indigo,
                              cellTitle: "스크린 타임") {
                        Text("스크린 타임 화면")
                    }
                }
                
                Section {
                    navigationLinkCell(imageName: "gear",
                              iconColor: .gray,
                              cellTitle: "일반") {
                        Text("일반 화면")
                    }

                    navigationLinkCell(imageName: "figure.wave.circle",
                              iconColor: .blue,
                              cellTitle: "손쉬운 사용") {
                        Text("손쉬운 사용 화면")
                    }
                    
                    navigationLinkCell(imageName: "hand.raised.fill",
                              iconColor: .blue,
                              cellTitle: "개인 정보 보호") {
                        Text("개인 정보 보호 화면")
                    }
                }
                
                Section {
                    navigationLinkCell(imageName: "key.fill",
                              iconColor: .gray,
                              cellTitle: "암호") {
                        Text("암호 화면")
                    }
                }
            }
            .navigationTitle(Text("설정"))
        }
    }
    
    @ViewBuilder
    private func profileCell() -> some View {
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,
                       height: 40)
                .padding(.all, 10)
                .background(.green)
                .clipShape(Circle())
            
            VStack(alignment: .leading,spacing: 3) {
                Text("Leeo")
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                Text("Apple ID, iCloud, 미디어 및 구입")
                    .font(.system(size: 14))
            }
            .padding(.leading, 6)
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder
    private func iconImage(imageName: String, iconColor: Color) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 4)
            .background(iconColor)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
    
    @ViewBuilder
    private func toggleCell(imageName: String, iconColor: Color, cellTitle: String, isAirplainModeOn: Binding<Bool>) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
                
            Toggle(cellTitle,
                   isOn: $isAirplainModeOn)
        }
    }
    
    @ViewBuilder
    private func navigationLinkCell<V: View>(imageName: String, iconColor: Color,
                                      cellTitle: String, subTitle: String? = nil,
                                      destination: @escaping () -> V) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
                
            if let subTitle = subTitle {
                NavigationLink {
                    destination()
                } label: {
                    HStack {
                        Text(cellTitle)
                        Spacer()
                        Text(subTitle)
                            .foregroundColor(.gray)
                    }
                }
            } else {
                NavigationLink(cellTitle) {
                    destination()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
