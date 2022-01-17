namespace Day3/Part1 {

    def flipBit(bit: Char): Char =
        match bit {
            case '0' => '1'
            case '1' => '0'
            case _   => bug!("Not a valid bit")
        }

    def flipBits(bits: List[Char]): List[Char] =
        List.map(flipBit, bits)

    def mostCommonBit(bits: List[Char]): Char =
        let setCount = List.count(c -> c == '1', bits);
        let unsetCount = List.count(c -> c == '0', bits);

        if (setCount >= unsetCount) '1' else '0'
    
    type alias Diagnostic = List[List[Char]]

    def diagnosticFromLines(lines: List[String]): Diagnostic =
        List.map(String.toList, lines)

    def gammaRateBits(diagnostic: Diagnostic): List[Char] =
        List.transpose(diagnostic) |> List.map(mostCommonBit)

    def stringFromCharList(chars: List[Char]): String =
        let len = List.length(chars);
        let a = List.toArray(chars) as & Pure;
        String.init(i -> a[i], len) as & Pure

    def intFromBinaryString(text: String): Int = 
        import static java.lang.Integer.parseInt(String, Int32);
        parseInt(text, 2) as & Pure

    def intFromBits(bits: List[Char]): Int =
        stringFromCharList(bits) |> intFromBinaryString

    def powerConsumptionFromGammaBits(gammaBits: List[Char]): Int =
        let epsilonBits = flipBits(gammaBits);
        let gamma = intFromBits(gammaBits);
        let epsilon = intFromBits(epsilonBits);

        gamma * epsilon

    def powerConsumption(diagnosticLines: List[String]): Int =
        let diagnostic = diagnosticFromLines(diagnosticLines);
        let gammaBits = gammaRateBits(diagnostic);

        powerConsumptionFromGammaBits(gammaBits)

    def readInput(): Result[List[String], String] & Impure =
        File.readLines("input/day3.txt")

    pub def main(): String & Impure =
        match readInput() {
            case Ok(lines) => "${powerConsumption(lines)}"
            case Err(msg) => msg
        }

}