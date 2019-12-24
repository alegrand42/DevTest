#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

int main()
{
    int speed;
    int lightCount;
    vector<pair<int, int>> lights;
    int res;

    cin >> speed; cin.ignore();
    res = speed;
    cin >> lightCount; cin.ignore();
    for (int i = 0; i < lightCount; i++) {
        int distance;
        int duration;
        pair<int, int> light;
        cin >> distance >> duration; cin.ignore();
        light.first = distance;
        light.second = duration;
        lights.push_back(light);
    }
    
    for(auto light : lights){
        int newspeed = light.first / light.second * 3.6;
        cerr << light.first << " " << light.second << " " << newspeed << endl;
        if (newspeed >= speed)
            speed = newspeed / 2;
    }
    cout << speed << endl;
}