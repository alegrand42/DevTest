#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 * ---
 * Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.
 **/

int main()
{
    int lightX; // the X position of the light of power
    int lightY; // the Y position of the light of power
    int initialTX; // Thor's starting X position
    int initialTY; // Thor's starting Y position
    cin >> lightX >> lightY >> initialTX >> initialTY; cin.ignore();

    // game loop
    while (1) {
        int remainingTurns; // The remaining amount of turns Thor can move. Do not remove this line.
        cin >> remainingTurns; cin.ignore();
        if (lightX > initialTX){
            if (lightY > initialTY){
                initialTX += 1;
                initialTY += 1;
                cout << "SE" << endl;
            }
            else if (initialTY == lightY){
                initialTX += 1;
                cout << "E" << endl;
            }
            else {
                initialTX += 1;
                initialTY -= 1;
                cout << "NE" << endl;
            }
        }
        else if (lightX < initialTX){
            if (lightY > initialTY){
                initialTX -= 1;
                initialTY += 1;
                cout << "SW" << endl;
            }
            else if (initialTY == lightY){
                initialTX -= 1;
                cout << "W" << endl;
            }
            else {
                initialTX -= 1;
                initialTY -= 1;
                cout << "NW" << endl;
            }
        } else {
            if (lightY > initialTY){
                initialTY += 1;
                cout << "S" << endl;
            }
            else if (lightY < initialTY){
                initialTY -= 1;
                cout << "N" << endl;
            }
            
        }
    }
}
