// The main entry point.
def main(_args: Array[String]): Int32 & Impure =
  match readInput() |> Result.flatMap(solve) {
    case Ok(x, y) => "${x * y}"
    case Err(msg) => msg
  } |> Console.printLine;

  0 // exit code

def solve(lines: List[String]): Result[(Int, Int), String] =
  Result.traverse(parseCommand, lines) |>
  Result.map(travel)

def readInput(): Result[List[String], String] & Impure =
  File.readLines("input/day2/input.txt")

def parseCommand(command: String): Result[(Direction, Int), String] =
  let fragments = String.splitOn({ substr = " " }, command);
  
  match fragments {
      case verb::object::Nil => parseCommandSentence(verb, object)
      case _ => Err("Not a valid command: '{command}'")
  }

def parseCommandSentence(verb: String, object: String): Result[(Direction, Int), String] = 
  use Result.flatMap;
  let* direction = parseDirection(verb);
  let* distance = Int32.fromString(object);

  Ok((direction, distance))

def parseDirection(word: String): Result[Direction, String] & Pure = 
  match word {
    case "forward" => Ok(Forward)
    case "up"      => Ok(Up)
    case "down"    => Ok(Down)
    case _ => Err("Not a valid direction: ${word}")
  }

enum Direction with Eq, ToString {
  case Forward,
  case Up,
  case Down
}

def move(position: (Int, Int), command: (Direction, Int)): (Int, Int) =
  let (x, y) = position;
  let (direction, distance) = command;

  match direction {
      case Forward => (x + distance, y)
      case Up      => (x, y - distance)
      case Down    => (x, y + distance)
  }

def travel(moves: List[(Direction, Int)]): (Int, Int) =
  List.foldLeft(move, (0, 0), moves)