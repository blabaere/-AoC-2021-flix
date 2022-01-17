use String.charAt;

namespace Day3/Part2 {

    def bitCountsAt(diagnostic: List[String], index: Int): (Int, Int) =
        let setCount = List.count(line -> charAt(index, line) == '1', diagnostic);
        let unsetCount = List.count(line -> charAt(index, line) == '0', diagnostic);

        (setCount, unsetCount)

    def mostCommonBitAt(diagnostic: List[String], index: Int): Char =
        let (set, unset) = bitCountsAt(diagnostic, index);
    
        if (set >= unset) '1' else '0'

    def leastCommonBitAt(diagnostic: List[String], index: Int): Char =
        let (set, unset) = bitCountsAt(diagnostic, index);
    
        if (set < unset) '1' else '0'

    def ratingAt(
        bitCriteriaAt: (List[String], Int) -> Char,
        diagnostic: List[String], 
        index: Int): String =
        match diagnostic {
            case Nil       => bug!("Empty diagnostic rating")
            case head::Nil => head
            case _ => {
                let bitCriteria = bitCriteriaAt(diagnostic, index);
                let filtered = List.filter(line -> charAt(index, line) == bitCriteria, diagnostic);
                
                ratingAt(bitCriteriaAt, filtered, index + 1)
            }
        }

    def oxigenRating(diagnostic: List[String]): String =
        ratingAt(mostCommonBitAt, diagnostic, 0)

    def co2Rating(diagnostic: List[String]): String =
        ratingAt(leastCommonBitAt, diagnostic, 0)

    def intFromBinaryString(text: String): Result[Int, String] = 
        try {
            import static java.lang.Integer.parseInt(String, Int32);
            Ok(parseInt(text, 2)) as & Pure
        } catch {
            case _: ##java.lang.NumberFormatException => Err("Int32.fromString")
        }
    
    def lifeSupportRating(diagnostic: List[String]): Result[Int, String] =
        use Result.flatMap;
        let* oxigen = oxigenRating(diagnostic) |> intFromBinaryString;
        let* co2 = co2Rating(diagnostic) |> intFromBinaryString;

        Ok(oxigen * co2)

    def readInput(): Result[List[String], String] & Impure =
        File.readLines("input/day3.txt")

    pub def main(): String & Impure =
        match readInput() {
            case Ok(lines) => "${lifeSupportRating(lines)}"
            case Err(msg) => msg
        }

}