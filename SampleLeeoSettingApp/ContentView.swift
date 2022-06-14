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
                    airPlainToggleCell()
                    
                    wifiTextCell()
                    
                    HStack {
                        Image(systemName: "bolt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                            
                        NavigationLink {
                            Text("Bluetooth 화면")
                        } label: {
                            HStack {
                                Text("Bluetooth")
                                Spacer()
                                Text("켬")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    plainCell(imageName: "antenna.radiowaves.left.and.right",
                              iconColor: .green,
                              cellTitle: "셀룰러") {
                        Text("셀룰러 화면2")
                    }
                }
                
                Section {
                    plainCell(imageName: "hourglass",
                              iconColor: .indigo,
                              cellTitle: "스크린 타임") {
                        Text("스크린 타임 화면")
                    }
                }
                
                Section {
                    plainCell(imageName: "gear",
                              iconColor: .gray,
                              cellTitle: "일반") {
                        Text("일반 화면")
                    }

                    plainCell(imageName: "figure.wave.circle",
                              iconColor: .blue,
                              cellTitle: "손쉬운 사용") {
                        Text("손쉬운 사용 화면")
                    }
                    
                    plainCell(imageName: "hand.raised.fill",
                              iconColor: .blue,
                              cellTitle: "개인 정보 보호") {
                        Text("개인 정보 보호 화면")
                    }
                }
                
                Section {
                    plainCell(imageName: "key.fill",
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
    private func airPlainToggleCell() -> some View {
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(6)
                
            Toggle("에어플레인 모드",
                   isOn: $isAirplainModeOn)
        }
    }
    
    @ViewBuilder
    private func wifiTextCell() -> some View {
        HStack {
            Image(systemName: "wifi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
                
            NavigationLink {
                Text("Wi-Fi 화면")
            } label: {
                HStack {
                    Text("Wi-Fi")
                    Spacer()
                    Text("SK_WiFiGIGAD9BC_5G")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func cellularPlainCell() -> some View {
        HStack {
            Image(systemName: "antenna.radiowaves.left.and.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(6)
                
            NavigationLink("셀룰러") {
                Text("셀룰러 화면")
            }
        }
    }
    
    @ViewBuilder
    private func plainCell<V: View>(imageName: String, iconColor: Color ,cellTitle: String, destination: @escaping () -> V) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(iconColor)
                .foregroundColor(.white)
                .cornerRadius(6)
                
            NavigationLink(cellTitle) {
                destination()//Text("News 화면")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
