//
//  SideMenuViewModel.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import Foundation

// Manda el texto

// CaseIterable allows to treat our elements like an array
enum SideMenuViewModel : Int, CaseIterable{
    case profile
    case lists
    case bookmarks
    case logout
    
    var title: String{
        switch self{
        case .profile: return "Profile"
        case .lists: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .logout: return "Logout"
        }
    }
    
    // Image name
    
    var imageName: String{
        switch self{
        case .profile: return "person"
        case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
