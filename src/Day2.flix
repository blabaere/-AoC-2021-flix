namespace Day2 {
    pub enum Direction with Eq, ToString {
        case Forward,
        case Up,
        case Down
    }

    pub def parseDirection(word: String): Result[Direction, String] = 
        match word {
            case "forward" => Ok(Forward)
            case "up"      => Ok(Up)
            case "down"    => Ok(Down)
            case _ => Err("Not a valid direction: ${word}")
        }

    pub type alias Command = (Direction, Int)

    def parseCommandSentence(verb: String, object: String): Result[Command, String] = 
        use Result.flatMap;
        let* direction = parseDirection(verb);
        let* distance = Int32.fromString(object);

        Ok((direction, distance))

    pub def parseCommand(command: String): Result[Command, String] =
        let fragments = String.splitOn(substr = " ", command);

        match fragments {
            case verb::object::Nil => parseCommandSentence(verb, object)
            case _ => Err("Not a valid command: '{command}'")
        }

    def readInput(): Result[List[String], String] & Impure =
        File.readLines("input/day2.txt")

    def loadInput(): Result[List[Command], String] & Impure =
        let parseAll = Result.traverse(parseCommand);

        readInput() |> Result.flatMap(parseAll)

}