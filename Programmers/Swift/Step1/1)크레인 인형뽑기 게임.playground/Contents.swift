import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    // 제약조건
    if board.count<5 || board.count>30 || board[0].count<5 || board[0].count>30 || moves.isEmpty || moves.count>1000 {
       return 0
    }
    
    var board_copy: [[Int]] = board
    var basket: [Int] = []
    var result = 0
    
    for i in 0 ..< moves.count {
        let column_index = moves[i]-1
        
        for j in 0 ..< board_copy.count {
            let pick_doll = board_copy[j][column_index]
            
            if pick_doll != 0 {
                board_copy[j][column_index] = 0
                let last_doll = basket.last ?? 0
                
                if last_doll == pick_doll {
                    basket.removeLast()
                    result += 2
                } else {
                    basket.append(pick_doll)
                }
                
                break
            }
        }
    }
    
    return result
}

var board = [
             [0,0,0,0,0],
             [0,0,1,0,3],
             [0,2,5,0,1],
             [4,2,4,4,2],
             [3,5,1,3,1]
            ]
// 4, 3, 1, 1, 3, 2, 4
var moves = [1,5,3,5,1,2,1,4]

print(solution(board, moves))
