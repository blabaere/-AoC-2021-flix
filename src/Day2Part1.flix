use Day2.Direction;
use Day2.Direction.{Forward, Up, Down};
use Day2.{Command, readInput, parseCommand};
use Day2.loadInput;

namespace Day2/Part1 {

    type alias Position = (Int, Int)

    def move(position: Position, command: Command): Position =
        let (x, y) = position;
        let (direction, distance) = command;

        match direction {
            case Forward => (x + distance, y)
            case Up      => (x, y - distance)
            case Down    => (x, y + distance)
        }

    def travel(moves: List[Command]): Position =
        List.foldLeft(move, (0, 0), moves)

    pub def main(): String & Impure =
        match loadInput() |> Result.map(travel) {
            case Ok(x, y) => "${x * y}"
            case Err(msg) => msg
        }

}
