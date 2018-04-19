

import Foundation

public enum API {
    
	case ListHeroes
	
	
}

extension API: Resource {
    
    var method: Method {
        switch self{
        case .ListHeroes:
            return Method.GET
        }
    }
    
    var bodyObjects: [String : Any] {
       return  [:]
    }
    
	
	public var path: String {
        
		switch self {
		case .ListHeroes:
			return "bins/bvyob"
        
        
		}
	}
	
	public var parameters: [String:String] {
        
		switch self {
        case   .ListHeroes:
            return [:]
		
        
		}

	}
	
}
