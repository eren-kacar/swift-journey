import Foundation
//
//var name: String?
//
//name = nil
//name = "Eren"
//
//if let name = name {
//    print(name)
//}
//
//let username = name ?? "Anonymous"
//print(username)


// User Profile Viewer
var name: String?
var email: String?
var phone: String?

name = "Eren"
email = "eren@email.com"
phone = nil




print("===== USER =====")
if let name = name {
    print("Name: \(name)")
}else{
    print("Name: Not Available")
}

if let email = email {
    print("Email: \(email)")
}else{
    print("Email: Not Available")
}

print("Phone: \(phone ?? "Not Available")")
print("================")
