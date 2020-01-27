#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

class Car {
    public:
        int speed;
        int distance;
};

bool isRed(int speed, int dist, int dur){
    return (18 * dist) % (10 * speed * dur) >= (5 * speed * dur);
}

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
    
    /*
    for(auto light : lights){
        int newspeed = light.first / light.second * 3.6;
        cerr << "Dist: " << light.first << " Time: " << light.second << " Speed: " << newspeed << " Max speed: " << speed << endl;
    }
    */
    
    for(int i = 0; i < lightCount; i++){
        if (isRed(res, lights[i].first, lights[i].second)){
            res--;
            i=-1;
        }
    }
    cout << res << endl;
}