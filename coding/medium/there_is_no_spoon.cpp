#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

/**
 * Don't let the machines win. You are humanity's last hope...
 **/

void display_grid(vector<string> const &grid){
        for(auto row : grid)
        cerr << row << endl;
}

void display_node(vector<string> const &grid, int width, int height){
    string str;
    for (int i=0; i < height; i++){
        for (int j = 0; j < width; j++){
            
            if(grid[j][i] == '.')
                continue;
                
            cout << i << " " << j << " ";
            
            int right =j;
            while(++right < width && grid[right][i] == '.'){}
            if (right < width && grid[right][i] != '.'){
                cout << right << " " << i;
            } else {
                cout << "-1 -1";
            }
            
            cout << " ";
            
            int down = i;
            while(++down < height && grid[j][down] == '.'){}
            if (down < height && grid[j][down] != '.'){
                cout << j << " " << down;
            } else {
                cout << "-1 -1";
            }
            cout << endl;
        }

    }

}

int main()
{
    int width; // the number of cells on the X axis
    cin >> width; cin.ignore();
    int height; // the number of cells on the Y axis
    cin >> height; cin.ignore();
    vector<string> grid;
    
    
    for (int i = 0; i < height; i++) {
        string line;
        getline(cin, line); // width characters, each either 0 or .
        grid.push_back(line);
    }

    // Write an action using cout. DON'T FORGET THE "<< endl"
    // To debug: cerr << "Debug messages..." << endl;

    display_grid(grid);
    
    display_node(grid, width, height);

    // Three coordinates: a node, its right neighbor, its bottom neighbor
    
    /*
    cout << "0 0 1 0 0 1" << endl;
    cout << "1 0 -1 -1 -1 -1" << endl;
    cout << "0 1 -1 -1 -1 -1" << endl;
    */
    
}