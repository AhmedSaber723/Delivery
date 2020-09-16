
import Foundation

var LLat : String?
var LLong : String?


struct Client : Decodable {
    var id : Int?
    var client_name : String?
    var client_phone : Int?
    var client_address : String?
    var client_D : Int?
    
    
}

struct responses : Decodable {
    var MessageAr: String?
    var MessageEn: String?
    var Status : Bool?
    var Data : datainfo?
}


struct datainfo : Decodable {
    var access_token : String?
    var Name : String?
    var IsSameActivation : Bool?
    var IsActivation : Bool?
    var personPhoto : String?
    var activationCode : String?
    var OTPcode : String?
    var OTPStatusCode : Bool?
    var countOFD : Int?
    var isNextPage : Bool?
    var isStarted : Bool?
    var deliveryRequestId : Int?
  //  var deliveryList : [deliveryListInfo]?
   // var details : detailsInfo?
    var count : Int?
   // var list : [listInfo]?
    
}
struct deliveryListInfo : Decodable {
    var deliveryRequestId : Int?
    
}
struct detailsInfo :Decodable {
    var startStatus : Bool?
}
struct listInfo : Decodable {
    var unDeliveryReasonId : Int?
}
