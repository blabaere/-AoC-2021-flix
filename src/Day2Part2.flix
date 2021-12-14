use Day2.{Direction, Command};
use Day2.Direction.{Forward, Up, Down};
use Day2.loadInput;

namespace Day2/Part2 {

    type alias State = (Int, Int, Int) //horizontal, depth, aim

    def execute(state: State, command: Command): State = 
        let (h, d, a) = state;
        let (direction, distance) = command;

        match direction {
            case Down    => (h, d, a + distance)
            case Up      => (h, d, a - distance)
            case Forward => (h + distance, d + a * distance, a)
        }
   
    def executeAll(commands: List[Command]): State =
        List.foldLeft(execute, (0, 0, 0), commands)

    pub def main(): String & Impure =
        match loadInput() |> Result.map(executeAll) {
            case Ok(x, y, _) => "${x * y}"
            case Err(msg) => msg
        }

}
