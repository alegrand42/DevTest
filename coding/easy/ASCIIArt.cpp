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
    int L;
    int H;
    string T;
    map<char, vector<string>> characters;
    
    cin >> L; cin.ignore();
    cin >> H; cin.ignore();
    getline(cin, T);
    
    for (int i = 0; i < H; i++) {
        string ROW;
        getline(cin, ROW);
        
        characters['?'].push_back(ROW.substr(26 * L, L)); 
        for(int j =0; j < 26; j++)
            characters['A' + j].push_back(ROW.substr(j * L, L));
    }

    for(int i = 0; i < H; i++){
        for (auto c : T){
            if (c >= 'a' && c <= 'z')
                c += ('A' - 'a');
            else if (c < 'A' || c > 'z')
                c = '?';
            cout << characters[c][i];
        }
        cout << endl;
    }
}