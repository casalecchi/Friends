//
//  DetailView.swift
//  Friends
//
//  Created by Felipe Casalecchi on 17/04/23.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(user.isActive ? .green : .red)
                    Text(user.isActive ? "Online" : "Offline")
                        .font(.headline)
                }
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
                    .padding([.top, .horizontal])
                
                VStack(alignment: .leading) {
                    Text("User informations:")
                        .font(.headline)
                    
                    VStack {
                        Text("Work @ \(user.company)")
                            .padding(2)
                        Text(user.about)
                    }
                    .padding(.bottom)
                    
                    Text("User contacts:")
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                        Text(user.email)
                    }
                    
                    HStack {
                        Image(systemName: "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                        Text(user.address)
                    }
                }
                .padding()
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
                    .padding([.top, .horizontal])
                
                LazyVStack(alignment: .leading) {
                    Text("User friends:")
                        .font(.headline)
                    
                    ForEach(user.friends) { friend in
                        HStack {
                            Image(systemName: "circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                            Text(friend.name)
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: "", isActive: true, name: "Felipe Casalecchi", age: 21, company: "Apple", email: "felipe.casalecchi@poli.ufrj.br", address: "999 Street Address", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date.now, tags: [], friends: [Friend(id: "", name: "Friend Name")]))
    }
}
