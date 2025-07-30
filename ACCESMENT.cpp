#include <iostream>
#include <cmath>
using namespace std;
class EventCostCalculator {
public:
    void calculateTotalCost(int guests, int minutes, const string& event, const string& name) {
        int servers;
        const double Costperhour = 18.50, Costperminutes = 0.40, CostofDinner = 20.70;
        float cost1, cost2, deposit, Costforoneserver, Totalfoodcost, Averagecost, Totalcost;

        servers = ceil(static_cast<double>(guests) / 20);

        cost1 = (minutes / 60) * Costperhour;
        cost2 = (minutes % 60) * Costperminutes;
        Costforoneserver = cost1 + cost2;

        Totalfoodcost = guests * CostofDinner;

        Averagecost = Totalfoodcost / guests;

        Totalcost = Totalfoodcost + (Costforoneserver * servers);

        cout << "Event: " << event << endl;
        cout << "Customer: " << name << endl;
        cout << "Number of guests: " << guests << endl;
        cout << "Number of servers: " << servers << endl;
        cout << "Cost for one server: " << Costforoneserver << endl;
        cout << "Total food cost: " << Totalfoodcost << endl;
        cout << "Average cost per person: " << Averagecost << endl;
        cout << "Total cost: " << Totalcost << endl;

        deposit = Totalcost * 0.25;
        cout << "Please deposit a 25% deposit to reserve the event." << endl;
        cout << "Deposit needed: " << deposit << endl;
    }
};
int main() {
    int guests, minutes;
    string event, name;

    cout << "Enter the name of the event: ";
    getline(cin, event);
    cout << "Enter the customer's first and last name: ";
    getline(cin, name);
    cout << "Enter the number of guests: ";
    cin >> guests;
    cout << "Enter the number of minutes in the event: ";
    cin >> minutes;

    EventCostCalculator calculator;
    calculator.calculateTotalCost(guests, minutes, event, name);

    return 0;
}