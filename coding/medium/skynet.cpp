#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/


struct Node{
    int pos;
    vector<Node *> link;
    bool isExit = false;
};

void _displayNode(Node const n){
    cerr << "pos: ";
    cerr << n.pos;
    cerr << " ;exit: ";
    string hasExit = (n.isExit) ? "True" : "False";
    cerr << hasExit;
    cerr << " ;link: ";
    cerr << n.link.at(0)->pos;
    cerr << endl;
}

void _displayVectorNode(vector<Node> const &node){
    for(auto n : node)
        _displayNode(n);
}


int _findNode(int const pos, vector<Node> const &node, vector<int> const severed){
    for (auto& link : node[pos].link){
            if (find(severed.begin(), severed.end(), link->pos) == severed.end())
                return link->pos;
            cerr << node[pos].pos << " " << link->pos << " - ";
    }
    cerr << endl;
}

int main()
{
    int N; // the total number of nodes in the level, including the gateways
    int L; // the number of links
    int E; // the number of exit gateways
    vector<Node> n;
    vector<int> severed;
    
    cin >> N >> L >> E; cin.ignore();
    n.resize(N);
    for(int i = 0; i < N; i++)
        n[i].pos = i;
    for (int i = 0; i < L; i++) {
        int N1; // N1 and N2 defines a link between these nodes
        int N2;
        cin >> N1 >> N2; cin.ignore();
        n[N1].link.push_back(&n[N2]);        
        n[N2].link.push_back(&n[N1]);
    }
    for (int i = 0; i < E; i++) {
        int EI; // the index of a gateway node
        cin >> EI; cin.ignore();
        n[EI].isExit = true;
    }
    _displayVectorNode(n);


    // game loop
    while (1) {
        int SI; // The index of the node on which the Skynet agent is positioned this turn
        int index;
        cin >> SI; cin.ignore();
        index = SI;

        // Write an action using cout. DON'T FORGET THE "<< endl"
        // To debug: cerr << "Debug messages..." << endl;

        index = _findNode(SI, n, severed);
        severed.push_back(SI);
    
        // Example: 0 1 are the indices of the nodes you wish to sever the link between
        cout << SI << " " << index << endl;
    }
}