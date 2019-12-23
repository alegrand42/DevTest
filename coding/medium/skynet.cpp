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

int _minScore(vector<pair<int, int>> score){
    int max = 0;
    int val = 0;
    for(auto res : score){
        if (res.second > max){
            max = res.second;
            val = res.first;
        }
    }
    return val;
}

int _findNode(int const pos, vector<Node> const &node, vector<int> const severed){
    vector<pair<int, int>> analyze;
    for (auto& link : node[pos].link){
            pair<int, int> res;
            if (find(severed.begin(), severed.end(), link->pos) == severed.end()){
                res.first = link->pos;
                res.second = 1;
                //return link->pos;
                if(link->isExit)
                    res.second++;
                analyze.push_back(res);
            }
            //cerr << node[pos].pos << " " << link->pos << " - ";
    }
    return _minScore(analyze);
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
    while (1) {
        int SI; // The index of the node on which the Skynet agent is positioned this turn
        int index;
        cin >> SI; cin.ignore();
        index = SI;
        index = _findNode(SI, n, severed);
        severed.push_back(SI);
        cout << SI << " " << index << endl;
    }
}
