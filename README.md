# Shqiperi
## Rubin Peci, Tim Marder, and Daniel Gelfand
## APCS2 Final Project -- Maze Runner

### Proposal
**Click [_HERE_](./docs/proposal.pdf) for our proposal**

### Description
Following the structure of a binary tree and mimicking the use of recursive backtracking, a maze is generated using the 'Growing Tree' algorithm provided below. Once the maze is generated, an Albanian warrior by the name of Dubim must face monsters and pick up items along the way to reach the exit and survive the maze! ⚔️⚔️⚔️🏆🏆🏆

### How To Launch
1. From the root of the repo go into the maze directory
2. In the maze directory run the command `processing maze.pde` and click play.

### How to Play

Dubim (main character) will appear in the first dungeon after the maze finishes generating. You must control Dubim with WASD keys to lead him through his path to the exit. However, Dubim must defeat all the monsters in the current dungeon before moving on to the next. Here are several tips that will guide you to success:
- Walk over monsters to attack them. Beware, they will attack you as well.
- Pick up a weapon as soon as possible. It will help you defeat monsters faster.
- If possible, try to pick up and eat food right before moving on to the next dungeon. That way, you will begin the next dungeon with more health.
- The next dungeon unlocks once you defeat all monsters. However, you may move on without collecting useful items. That is not advisable, and it's highly recommended that you pick up anything useful.

More Information:
- Your stats are displayed in the console. Make sure to especially check your health every once in a while to make sure you don't die.
- You cannot consume food if you have max health.
- Leveling up requires a certain amount of xp. Killing monsters gives xp.
- The more level ups, the more xp will be required to level up.

### How it Works (The Algo)
1. Let C be a list of cells, initially empty. Add one cell to C(upperleft in our case).
2. Choose the most recently added cell to C, and carve a passage to any unvisited neighbor of that cell, adding that neighbor to C as well. If there are no unvisited neighbors, remove the cell from C.
3. Repeat #2 until C is empty.


![Albanian Flag](https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Albania.svg/2000px-Flag_of_Albania.svg.png)

![HMMM](https://i.redd.it/01xn93tp6d001.jpg)

