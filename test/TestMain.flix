@test
def parseForwardDirection(): Bool =
  parseDirection("forward") == Ok(Forward)

@test
def parseUpDirection(): Bool =
  parseDirection("up") == Ok(Up)
  
@test
def parseDownDirection(): Bool =
  parseDirection("down") == Ok(Down)

@test
def parseOneDirection(): Bool =
  Result.isErr(parseDirection("one"))

@test
def parseCommand1(): Bool = 
  parseCommand("forward 10") == Ok((Forward, 10))

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