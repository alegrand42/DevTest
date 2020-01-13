#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <map>

using namespace std;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

int main()
{
    int n; // the number of relationships of influence
    map<int, vector<int>> lst;
    int max = 0;
    int count = 0;

    cin >> n; cin.ignore();
    for (int i = 0; i < n; i++) {
        int x; // a relationship of influence between two people (x influences y)
        int y;
        cin >> x >> y; cin.ignore();
        
        lst[x].push_back(y);
    }

    for (auto& l : lst){
        count = 1;
        cerr << l.first << ": ";
        for (int l0 : l.second){
            cerr << l0 << " ";
            count++;
        }
        if (count > max)
            max = count;
        cerr << endl;
    }

    
    cout << max << endl;
}