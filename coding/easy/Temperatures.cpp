int main()
{
    int n; // the number of temperatures to analyse
    cin >> n; cin.ignore();
    int min = numeric_limits<int>::max();
    for (int i = 0; i < n; i++) {
        int t; // a temperature expressed as an integer ranging from -273 to 5526
        cin >> t; cin.ignore();
        
        if (abs(min) > abs(t))
            min = t;
        else if (abs(min) == abs(t) && min < t)
            min = t;
        cerr << min << " " << t << endl; 
    }

    // Write an action using cout. DON'T FORGET THE "<< endl"
    // To debug: cerr << "Debug messages..." << endl;
    if (n == 0)
        min = 0;
    cout << min << endl;
}