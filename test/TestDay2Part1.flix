use Day2.Direction;
use Day2.Direction.{Forward, Up, Down};
use Day2.parseDirection;
use Day2.Command;
use Day2.parseCommand;

namespace Day2/Part1 {

    @test
    def moveForward_Increases_Horizontal(): Bool =
        let position = (0, 0);
        let command = (Forward, 10);
        let destination = move(position, command);

        destination == (10, 0)

    @test
    def moveUp_Decreases_Depth(): Bool =
        let position = (0, 0);
        let command = (Up, 10);
        let destination = move(position, command);

        destination == (0, -10)

    @test
    def moveDown_Increases_Depth(): Bool =
        let position = (0, 0);
        let command = (Down, 10);
        let destination = move(position, command);

        destination == (0, 10)

    @test
    def theyGotMoves(): Bool =
        let moves = (Forward, 5)::(Down, 10)::Nil;
        let destination = travel(moves);

        destination == (5, 10)
}
