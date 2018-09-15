
public enum SExpr {
    case atom(String)
    case list([SExpr])
}
o

extension SExpr : Equatable {
    public static func ==(lhs: SExpr, rhs: SExpr) -> Bool{
        switch(lhs, rhs) {
        case let (.atom(l), .atom(r)):
            return l==r
        case let (.list(l), .list(r)):
            guard l.count == r.count else {return false}
            for (idx, el) in l.enumerated() {
                if el != r[idx] {
                    return false
                }
            }
            return true
        default:
            return false
        }
    }
}

extension SExpr : CustomStringConvertible {
    public var description:  String {
        switch self{
            case let .atom(value):
                return "\(value)"
            case let .list(subexprs):
                var res = "("

                for expr in subexprs{
                    res += "\(expr)"
                }

                res += "("
                return  res
        }
    }
}
