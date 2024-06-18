//
//  DetailView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: Name of political party
                    HStack {
                        Text("Název strany")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    TextField("Zadejte název strany", text: .constant("ODS"))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(Color(.systemGray6))
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        }
                    
                    // Additional spacing of 10
                    Spacer()
                        .frame(height: 20)
                    
                    // MARK: Color of political party
                    HStack {
                        Text("Barva strany")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 5) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 50)
                            .foregroundStyle(.blue)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 1)
                            }
                        
                        Button(
                            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                            label: {
                                Image("color-wheel")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundStyle(Color(.systemGray6))
                                    )
                        })
                    }
                    
                    Spacer()
                        .frame(height: 5)
                    
                    HStack {
                        Text("Klikněte na tlačítko s barvami pro výběr barvy.")
                            .font(.footnote)
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    // MARK: Percents of political party
                    HStack {
                        Text("Procenta")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    TextField("Zadejte název strany", text: .constant("15,7"))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(Color(.systemGray6))
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Toggle(isOn: .constant(true), label: {
                            Text("Koaliace")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        })
                        
                        // For some reason, without this code the toggle will be partially outside of the bounds
                        Spacer()
                            .frame(width: 2)
                    }
                    
                    Spacer()
                        .frame(height: 5)
                    
                    HStack {
                        Text("Značí, zda je o koalici. Ta potřebuje překročit hranici 7%, zatímco jednotlivá strana pouze 5%.")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding([.leading, .trailing, .bottom], 20)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(
                        action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                        label: {
                            Image(systemName: "trash")
                                .tint(Color(.label))
                    })
                    
                    Button(
                        action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                        label: {
                            Text("Uložit")
                                .foregroundStyle(Color(.label))
                    })
                }
            }
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailView()
}
