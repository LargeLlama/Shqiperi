# Shqiperi
## Rubin Peci, Tim Marder, and Daniel Gelfand
## APCS2 Final Project -- Maze Runner

### Proposal
**Click [_HERE_](./docs/proposal.pdf) our proposal**

### Description
A maze is randomly generated using the algorithm provided below. An Albanian warrior by the name of Dubim must face monsters, traps, and pick up items along the way to survive and escape the maze! ⚔️⚔️⚔️

To control Dubim use the keyboard's 'w' 'a' 's' 'd' characters. Follow a path until Dubim reaches the door! 🏆🏆🏆

### How To Launch
1. From the root of the repo cd into the maze directory
2. In the maze directory run maze.pde and click play.

### How to Play

Dubim (main character) will appear in the first dungeon after the maze finishes generating. You must control Dubim with WASD keys to lead him through his path to the exit. However, Dubim must defeat all the monsters in the current dungeon before moving on to the next. Here are several tips that will guide you to success:
- Walk over monsters to attack them. Beware, they will attack you as well.
- Pick up a weapon as soon as possible. It will help you defeat monsters faster.
- If possible, try to pick up and eat food right before moving on to the next dungeon. That way, you will begin the next dungeon with more health.
- The next dungeon unlocks once you defeat all monsters. However, you may move on without collecting useful items. That is not advisable, and it's highly recommended that you pick up anything useful.
- In rare occasions, a monster will have a useful item. You must be courageous enough and encounter them in order to earn the item.

More Information:
- Your stats are displayed in the console. Make sure to especially check your health every once in a while to make sure you don't die.
- You cannot consume food if you have max health.
- Leveling up requires a certain amount of xp. Killing monsters and completing dungeons gives xp.
- The more level ups, the more xp will be required to level up.

### How it Works (The Algo)
1. Pick a random cell C to start off with, and set it's visited value to true
2. Move to any one of its unvisited neighbors, removing the walls between the cells
3. If no neighbors are available, backtrack until a neighbor is found
4. Repeat until you backtrack back to the original cell


![Albanian Flag](https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Albania.svg/2000px-Flag_of_Albania.svg.png)

![HMMM](https://i.redd.it/01xn93tp6d001.jpg)

