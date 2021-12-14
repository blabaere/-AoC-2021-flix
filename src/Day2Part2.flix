use Day2.{Direction, Command};
use Day2.Direction.{Forward, Up, Down};

namespace Day2/Part2 {

    type alias State = (Int, Int, Int) //horizontal, depth, aim

    def execute(command: Command, state: State): State = 
        let (h, d, a) = state;
        let (direction, distance) = command;

        match direction {
            case Down    => (h, d, a + distance)
            case Up      => (h, d, a - distance)
            case Forward => (h + distance, d + a * distance, a)
        }
   
    pub def main(): String =
        "test"
}
