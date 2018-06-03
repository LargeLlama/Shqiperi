# Team Shqiperi
## Rubin Peci, Tim Marder, and Daniel Gelfand

![Albanian Flag](https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Albania.svg/2000px-Flag_of_Albania.svg.png)

## Algorithm for Maze Generation
1. Pick a random cell C to start off with, and set it's visited value to true
 2. Move to any one of its unvisited neighbors, removing the walls between the cells
 3. If no neighbors are available, backtrack until a neighbor is found
 4. Repeat until you backtrack back to the original cell
