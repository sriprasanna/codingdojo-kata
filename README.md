# Game - Rules

- - There are four different types of pieces, worth 5, 10, 15 and 20 points
- - The different pieces should be represented differently so you can tell the difference
- - The pieces are places on a game grid. Each place in the grid will be filled with a random piece
- - A user can choose any point on the grid. Based on that choice, a cluster of pieces will be selected
- - A cluster is defined as all pieces of the same type as the chosen piece that can be reached going in any of the 8 directions
- - When a cluster is chosen, the pieces will be removed from the grid, and the empty spaces filled from above
- - The player gets points for the pieces removed. The more pieces removed, the more points the player gets. In order to calculate the points, sum the individual point values for pieces and then add a multiplier for how many pieces are in the cluster. These multipliers are not cumulative.
   > 2 = * 1.2
   > 4 = * 1.5
   > 6 = * 1.8
   > 10 = * 2.0
- - No new pieces will be added to the grid
- - The game is over when there are no more pieces on the grid
- - If you have the time, add the posibilility for two plays to alternate playing the game, keeping track of the separate scores