// The main entry point.
def main(_args: Array[String]): Int32 & Impure =
  Day2/Part1.main() |> Console.printLine;
  Day2/Part2.main() |> Console.printLine;
  Day3/Part1.main() |> Console.printLine;
  Day3/Part2.main() |> Console.printLine;

  0 // exit code
