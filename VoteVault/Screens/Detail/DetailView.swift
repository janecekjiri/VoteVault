//
//  DetailView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DetailViewModel
    @State private var selectedColor = Color.blue
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // MARK: Name of political party
                HStack {
                    Text("party_name_title")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 10)
                
                TextField("party_name_placeholder", text: .constant("ODS"))
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
                    Text("party_color_title")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                ColorPicker(selection: self.$selectedColor, supportsOpacity: false, label: {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 50)
                        .foregroundStyle(self.selectedColor)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        }
                })
                
                Spacer()
                    .frame(height: 5)
                
                HStack {
                    Text("tap_on_button_to_open_color_picker")
                        .font(.footnote)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 20)
                
                // MARK: Percents of political party
                HStack {
                    Text("percentages_title")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 10)
                
                TextField("percentages_placeholder", text: .constant("15,7"))
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
                        Text("coalition_title")
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
                    Text("coalition_description")
                        .font(.footnote)
                    
                    Spacer()
                }
            }
        }
        .padding([.leading, .trailing, .bottom], 20)
        .toolbar {
            if self.viewModel.type == .new {
                ToolbarItem(placement: .topBarLeading) {
                    Button(
                        action: {},
                        label: {
                            Text("cancel")
                                .foregroundStyle(Color(.label))
                    })
                }
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                if self.viewModel.type == .edit {
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "trash")
                                .tint(Color(.label))
                    })
                }
                
                Button(
                    action: {},
                    label: {
                        Text("save")
                            .foregroundStyle(Color(.label))
                })
            }
        }
        .navigationTitle("detail_title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(model: nil))
}
